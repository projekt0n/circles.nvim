# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [unreleased]

## [v2.0.1] - 21 March 2023

### Added

- ci: Test suit with nvim v0.8.3

### Changed

- Rewrite diagnostics tests with actual nvim diagnostics API

## [v2.0.0] - 09 November 2022

### Added

- GitHub Sponsors
- feat: `get_nvimtree_glyphs` & `get_config` functions init
- feat: tests with [plenary.nvim](https://github.com/nvim-lua/plenary.nvim)
- feat: [ci](https://github.com/projekt0n/circles.nvim/actions/workflows/ci.yml) GitHub Action init

### Changed

- refactor: require [nvim-nightly](https://github.com/neovim/neovim/releases/tag/nightly)
- fix: lsp diagnostic prefix icon assignment
- refactor: plugin breakdown into one module
- breaking-change: deprecated nvim-tree support

## [v1.0.1] - 11 January 2022

### Added

- docs: Filled circles docs added inside README.md
- docs: make code readable
- refactor: all functions and variable in `snake_case`
- module export refactored
- refactor: load plugin from init.lua

### Changed

- docs: logo removed from `README.md`
- Formatter changed to `LuaForamatter` -> `StyLua`
- Linting options changed
- liberapay team profile in liberapay

## [v1.0.0] - 23 August 2021

### Added

- Initial release 🎊

[unreleased]: https://github.com/projekt0n/circles.nvim/compare/v2.0.1...main
[v2.0.1]: https://github.com/projekt0n/circles.nvim/compare/v2.0.1...v2.0.0
[v2.0.0]: https://github.com/projekt0n/circles.nvim/compare/v2.0.0...v1.0.1
[v1.0.1]: https://github.com/projekt0n/circles.nvim/compare/v1.0.1...v1.0.0
[v1.0.0]: https://github.com/projekt0n/circles.nvim/tree/v1.0.0
