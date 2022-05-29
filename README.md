# circles.nvim

uniform icons for neovim.

[![Linting](https://github.com/projekt0n/circles.nvim/actions/workflows/lint.yml/badge.svg)](https://github.com/projekt0n/circles.nvim/actions)
[![Twitter](https://img.shields.io/badge/twitter-projekt0n-blue)](https://twitter.com/projekt0n)

## Notices

- **2022-05-29**: Due to [nvim-tree major changes](http://bit.ly/3vIpEOJ), this plugin is **unable to override**
  files & folder icons with `vim.g`. Please check the [this](#configure-with-nvim-tree) for the workaround.

## Features

- Uniform icon replacement for [web-devicons](https://github.com/kyazdani42/nvim-web-devicons)
- Customize lsp diagnostic virtual-text icon

## Requirements

- Neovim >= 0.5.0
- Patched fonts ([Nerd Fonts](https://github.com/ryanoasis/nerd-fonts))

## Installation

### [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use {
  "projekt0n/circles.nvim",
  requires = {"kyazdani42/nvim-web-devicons"}
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
  requires = {"kyazdani42/nvim-web-devicons"},
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

## Screenshots

- Terminal: [kitty](https://sw.kovidgoyal.net/kitty)
- Font: [Ubuntu Mono](https://design.ubuntu.com/font/)
- Themes: [projekt0n/github-nvim-theme](https://github.com/projekt0n/github-nvim-theme) & [ful1e5/onedark.nvim](https://github.com/ful1e5/onedark.nvim)
- config: [ful1e5/dotfiles](https://github.com/ful1e5/dotfiles)

### Configure with nvim-tree

```lua
local icons = {
  empty = "",
  filled = "",
  lsp_prefix = ""
}

require('nvim-tree').setup({
  -- ...
  renderer = {
    icons = {
      glyphs = {
        default = icons.empty,
        symlink = icons.empty,
        folder = {
          default = icons.empty,
          open = icons.filled,
          empty = icons.empty,
          empty_open = icons.filled,
          symlink = icons.empty,
          symlink_open = icons.filled,
        },
      },
    },
  },
})

require("circles").setup({
  icons = icons,
  lsp = true
})
```

![screenshot of circles.nvim with nvim-tree.lua](https://imgur.com/iJtbXo7.png)

### Neovim LSP diagnostic virtual-text icon

#### Custom Diagnostic Icon

```lua
require("circles").setup({
  icons = {
    -- ...
    lsp_prefix = ""
  },
  lsp = true
})
```

![screenshot of circles.nvim with Custom LSP virtual-text](https://imgur.com/Vlvlpr9.png)

#### Disable Custom Diagnostic Icon

```lua
require("circles").setup({
  -- ...
  lsp = false
})
```

![screenshot of circles.nvim with disabled LSP virtual-text](https://imgur.com/0X4lKFW.png)
