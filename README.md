<p align="center">
  <img src="https://imgur.com/qxAhcmx.png" alt="circles.nvim" width="200"/>
</p>

### Status

<!-- [![Linting]()]() -->

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
