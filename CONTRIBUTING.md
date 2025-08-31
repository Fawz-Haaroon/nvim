# Contributing Guide

Thank you for considering a contribution! This project follows a clean, professional workflow to ensure stability and clarity.

- Code of Conduct: see CODE_OF_CONDUCT.md
- Security policy: see SECURITY.md
- License: MIT (see LICENSE)

Principles
- Stability first. Avoid breaking changes; prefer additive changes.
- Small PRs. Keep changes focused and well-scoped.
- Communication. Open an issue before large changes to align on approach.

Workflow
1) Fork and clone
2) Create a topic branch from main
3) Make changes with clear commits (see Conventional Commits below)
4) Run checks locally (formatting, shellcheck)
5) Open a PR describing the change with context and screenshots where helpful

Commit messages (Conventional Commits)
- feat: add a new feature
- fix: bug fix
- docs: documentation only changes
- chore: tooling, CI, meta changes (no src behavior)
- refactor/perf/test/style: as appropriate

Style and formatting
- Lua code is formatted with Stylua. CI enforces stylua --check .
- Shell scripts are checked with ShellCheck (CI).

PR checklist
- [ ] My change is documented in README/docs when relevant
- [ ] I ran formatting and basic checks locally
- [ ] I tested on at least one Linux terminal (Kitty preferred)

Releases and changelog
- We follow Keep a Changelog format in CHANGELOG.md. Maintainers will cut releases and update the changelog.

