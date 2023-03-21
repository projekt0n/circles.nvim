# circles.nvim

uniform icons for neovim.

[![ci](https://github.com/projekt0n/circles.nvim/actions/workflows/ci.yml/badge.svg)](https://github.com/projekt0n/circles.nvim/actions/workflows/ci.yml)

## Notices

<!-- If you're interested, you can learn more about "sponsor-spotlight" on
 https://dev.to/ful1e5/lets-give-recognition-to-those-supporting-our-work-on-github-sponsors-b00 -->

![shoutout-sponsors](https://sponsor-spotlight.vercel.app/sponsor?login=ful1e5)

- **2022-05-29**: Due to [nvim-tree major changes](http://bit.ly/3vIpEOJ), circle.nvim is **unable to override**
  files & folder icons with `vim.g.nvim_tree_show_icons`. Please check the [this](#configure-with-nvim-tree) for the workaround.

## Features

- Uniform icon replacement for [web-devicons](https://github.com/nvim-tree/nvim-web-devicons)
- Customize lsp diagnostic virtual-text icon

## Requirements

- neovim>=0.8.0
- [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)
- Patched fonts ([Nerd Fonts](https://github.com/ryanoasis/nerd-fonts))

## Installation

### [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use {
  "projekt0n/circles.nvim",
  requires = {"nvim-tree/nvim-web-devicons"}
}
```

### [vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'nvim-tree/nvim-web-devicons'
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
  requires = {"nvim-tree/nvim-web-devicons"},
  config = function()
    require("circles").setup()
  end
}
```

Configuration can be passed to the setup function. Here is an example with most of the default settings:

```lua
require("circles").setup({
  icons = { empty = "", filled = "", lsp_prefix = "" },
  -- override lsp_diagnostic virtual-text icon with `icons.lsp_prefix`
  lsp = true
})
```

## Screenshots

- Terminal: [Konsole](https://konsole.kde.org/)
- Font: [Fira Code](https://github.com/tonsky/FiraCode)
- Colorscheme: [ful1e5/onedark.nvim](https://github.com/ful1e5/onedark.nvim) and [projekt0n/github-nvim-theme](https://github.com/projekt0n/github-nvim-theme)

### Configure with nvim-tree

```lua
local circles = require('circles')

circles.setup({ icons = { empty = '', filled = '', lsp_prefix = '' } })

require('nvim-tree').setup({
  -- ...
  renderer = {
    -- ...
    icons = {
      glyphs = circles.get_nvimtree_glyphs(),
    },
  },
})
```

![circles.nvim X nvim-tree.lua](https://imgur.com/iJtbXo7.png)

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

![circles.nvim X LSP virtual-text](https://imgur.com/Vlvlpr9.png)

#### Disable Custom Diagnostic Icon

```lua
require("circles").setup({
  -- ...
  lsp = false
})
```

![circles.nvim X disabled LSP virtual-text](https://imgur.com/0X4lKFW.png)
