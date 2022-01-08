local util = {}

---override config.empty_icon to 'kyazdani42/nvim-web-devicons' plugin
---@param cfg circles.ConfigSchema
local override_devicons = function(cfg)
  local installed, dev_icons = pcall(require, 'nvim-web-devicons')
  if installed then
    local override_icons = dev_icons.get_icons()
    for _, icon in pairs(override_icons) do
      icon.icon = cfg.icons.empty
    end
    override_icons.default_icon = { icon = cfg.icons.empty }

    dev_icons.setup({ override = override_icons, default = false })
  else
    error("plugin required 'kyazdani42/nvim-web-devicons'")
  end
end

---Override config.empty_icon and config.filled_icon to 'kyazdani42/nvim-tree.lua' plugin
---@param cfg circles.ConfigSchema
local override_nvimtree_icons = function(cfg)
  -- Make nvim-tree icons visible
  vim.g.nvim_tree_show_icons = { git = 0, folders = 1, files = 1, folder_arrows = 1 }

  -- overriding nvim-tree icons
  local icons = cfg.icons
  vim.g.nvim_tree_icons = {
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
  }
end

---override lsp diagnostic prefix icon
---@param cfg circles.ConfigSchema
local override_lsp_diagnostic_text = function(cfg)
  vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = { prefix = cfg.icons.lsp_prefix },
    signs = true,
    update_in_insert = false,
  })
end

---Load the circles.nvim plugin
---@param cfg circles.ConfigSchema
util.load = function(cfg)
  override_devicons(cfg)
  override_nvimtree_icons(cfg)
  if cfg.lsp then
    override_lsp_diagnostic_text(cfg)
  end
end

return util
