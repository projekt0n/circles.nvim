<p align="center">
  <img src="https://imgur.com/qxAhcmx.png" alt="circles.nvim" width="150"/>
</p>

### Status

[![Linting](https://github.com/projekt0n/circles.nvim/actions/workflows/lint.yml/badge.svg)](https://github.com/projekt0n/circles.nvim/actions)
[![Twitter](https://img.shields.io/badge/twitter-projekt0n-blue)](https://twitter.com/projekt0n)

## Features

- Uniform icon replacement for [web-devicons](https://github.com/kyazdani42/nvim-web-devicons) & [nvim-tree](https://github.com/kyazdani42/nvim-tree.lua)
- Customize lsp diagnostic virtual-text icon

## Requirements

- Neovim >= 0.5.0
- Patched fonts ([Nerd Fonts](https://github.com/ryanoasis/nerd-fonts))

## Installation

### [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use {
  "projekt0n/circles.nvim",
  requires = {{"kyazdani42/nvim-web-devicons"}, {"kyazdani42/nvim-tree.lua", opt = true}}
}
```

### [vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'kyazdani42/nvim-web-devicons'
Plug 'projekt0n/circles.nvim'
```

## Usage

```lua
require("circles").setup()
```

If using [packer.nvim](https://github.com/wbthomason/packer.nvim) circles.nvim can be setup directly in the plugin spec:

```lua
use {
  "projekt0n/circles.nvim",
  requires = {{"kyazdani42/nvim-web-devicons"}, {"kyazdani42/nvim-tree.lua", opt = true}},
  config = function()
    require("circles").setup()
  end
}
```

Configuration can be passed to the setup function. Here is an example with most of the default settings:

```lua
require("circles").setup({
  icons = {
    empty = "",
    filled = "",
    lsp_prefix = ""
  },
  -- override lsp_diagnostic virtual-text icon with `icons.lsp_prefix`
  lsp = true
})
```

## Screenshots 📺

<p align="center">
  <img src="https://imgur.com/CdPiq3d.png" alt="circles.nvim Preview"/>
</p>

### Neovim LSP diagnostic virtual-text icon

```
require("circles").setup({
  lsp = false
})
```

<p align="center">
  <img src="https://imgur.com/mHMzgJj.png" alt="circles.nvim LSP virtual-text"/>
</p>

### [Telescope](https://github.com/nvim-telescope/telescope.nvim)

<p align="center">
  <img src="https://imgur.com/mqur6zW.png" alt="circles.nvim with telescpe"/>
</p>

## Useful Links

- Terminal: [kitty](https://sw.kovidgoyal.net/kitty)
- Font: [Ubuntu Mono](https://design.ubuntu.com/font/)
- Theme: [projekt0n/github-nvim-theme](https://github.com/projekt0n/github-nvim-theme)
- config: [ful1e5/dotfiles](https://github.com/ful1e5/dotfiles)

<!-- Ninja  -->
<p align="center">
  <h3 align="center">|| || ||</h1>
</p>
