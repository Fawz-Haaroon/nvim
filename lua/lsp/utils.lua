-- ═══════════════════════════════════════════════════════════════════════════════
--  🔧 LSP UTILITIES - Advanced LSP Controls
-- ═══════════════════════════════════════════════════════════════════════════════

local api = vim.api
local lsp = vim.lsp
local diagnostic = vim.diagnostic
local uv = vim.loop
local notify = vim.notify

local M = {}

-- State for LSP toggle functionality
local state = {
    enabled = true,
    attached_buffers_by_client = {},
    client_configs = {},
    original_buf_attach_client = nil,
}

-- Create fresh augroup for LSP attach
local function create_fresh_augroup(name)
    local id = api.nvim_create_augroup(name, { clear = true })
    return id
end

-- Check if a client is Copilot (should always be enabled)
local function is_copilot(client)
    return client and client.name == "copilot"
end

-- Add buffer to tracked buffers for a client
local function add_buf(client_id, bufnr)
    state.attached_buffers_by_client[client_id] = state.attached_buffers_by_client[client_id] or {}

    for _, value in ipairs(state.attached_buffers_by_client[client_id]) do
        if value == bufnr then
            return
        end
    end

    table.insert(state.attached_buffers_by_client[client_id], bufnr)
end

-- Stop a client with timeout handling
local function client_stop(client)
    if client.is_stopped() then
        return
    end

    lsp.stop_client(client.id, false)

    local attempts = 0
    local max_attempts = 50
    local timer = uv.new_timer()

    local handle_client_timeout = function()
        attempts = attempts + 1

        if client.is_stopped() then
            timer:stop()
            timer:close()
            diagnostic.reset()
        elseif attempts >= max_attempts then
            lsp.stop_client(client.id, true)
            timer:stop()
            timer:close()
            diagnostic.reset()
        end
    end

    timer:start(100, 100, vim.schedule_wrap(handle_client_timeout))
end

-- Update client IDs after server restarts
local function update_clients_ids(ids_map)
    local new_attached_buffers_by_client = {}
    local new_client_configs = {}

    for old_client_id, buffers in pairs(state.attached_buffers_by_client) do
        local new_client_id = ids_map[old_client_id]
        if new_client_id then
            new_attached_buffers_by_client[new_client_id] = buffers
            new_client_configs[new_client_id] = state.client_configs[old_client_id]
        end
    end

    state.attached_buffers_by_client = new_attached_buffers_by_client
    state.client_configs = new_client_configs
end

-- Python-specific LSP toggle function
function M.toggle_python_lsp()
    local python_clients = {}
    
    for _, client in ipairs(lsp.get_clients()) do
        if client.name == "pyright" or client.name == "ruff" or client.name == "pylsp" then
            table.insert(python_clients, client)
        end
    end
    
    if #python_clients > 0 then
        for _, client in ipairs(python_clients) do
            client_stop(client)
        end
        -- no success notification
    else
        -- Restart Python LSP
        vim.cmd("LspRestart pyright")
        -- no success notification
    end
end

-- Main LSP toggle function
function M.toggle_lsp()
    if state.enabled then
        state.attached_buffers_by_client = {}
        state.client_configs = {}

        for _, client in ipairs(lsp.get_clients()) do
            if is_copilot(client) then
                goto continue
            end

            state.client_configs[client.id] = client.config

            for bufnr, _ in pairs(client.attached_buffers or {}) do
                add_buf(client.id, bufnr)
                if lsp.buf_is_attached(bufnr, client.id) then
                    lsp.buf_detach_client(bufnr, client.id)
                end
            end

            client_stop(client)

            ::continue::
        end

        -- no success notification
    else
        local ids_map = {}

        for old_client_id, buffers in pairs(state.attached_buffers_by_client) do
            local client = state.client_configs[old_client_id]
            local new_client_id, error = lsp.start_client(client)

            if error then
                notify("Failed to start LSP client: " .. tostring(error), vim.log.levels.ERROR)
                return nil
            end

            ids_map[old_client_id] = new_client_id

            for _, bufnr in ipairs(buffers) do
                state.original_buf_attach_client(bufnr, new_client_id)
            end
        end

        update_clients_ids(ids_map)
        -- no success notification
    end

    state.enabled = not state.enabled
end

-- Setup LSP toggle functionality
function M.setup()
    -- Store original attach function
    state.original_buf_attach_client = lsp.buf_attach_client

    -- Override buffer attachment to handle LSP toggle state
    lsp.buf_attach_client = function(bufnr, client_id)
        local client = lsp.get_client_by_id(client_id)

        if is_copilot(client) then
            return state.original_buf_attach_client(bufnr, client_id)
        end

        if not state.enabled then
            state.client_configs[client_id] = state.client_configs[client_id] or (client and client.config) or {}
            add_buf(client_id, bufnr)
            lsp.stop_client(client_id)
            return false
        end

        return state.original_buf_attach_client(bufnr, client_id)
    end

    -- Setup LSP attach handler
    M.on_attach = function(on_attach, name)
        return api.nvim_create_autocmd({ "LspAttach" }, {
            group = create_fresh_augroup("lsp_attach" .. ((name and ("_" .. name)) or "")),
            callback = function(args)
                local buffer = args.buf
                local client = lsp.get_client_by_id(args.data.client_id)

                if client and (not name or client.name == name) then
                    return on_attach(client, buffer)
                end
            end,
        })
    end

-- Add global keymaps for LSP controls
    vim.keymap.set("n", "<leader>lt", M.toggle_lsp, { desc = "Toggle LSP servers" })
    vim.keymap.set("n", "<leader>lp", M.toggle_python_lsp, { desc = "Toggle Python LSP only" })

    -- no success notification
end

-- Don't load this as a lazy.nvim plugin - it's a utility module
-- It gets loaded manually by other modules that need it
if vim.g._loading_lazy_plugins then
  return {}
end

return M
