local M = {}

---@class circles.ConfigSchema.Icons
local icons = {
  empty = '',
  filled = '',
  lsp_prefix = '',
}

---@class circles.ConfigSchema
---@field icons circles.ConfigSchema.Icons
---@field lsp boolean
local config = {
  icons = icons,
  lsp = true,
}

---Apply user's configurations
---@param user_config circles.ConfigSchema
local apply_configuration = function(user_config)
  for key, value in pairs(user_config) do
    if value ~= nil then
      if config[key] ~= nil then
        config[key] = value
      else
        error("config option '" .. key .. "' does not exist")
      end
    end
  end
end

---override one icon to 'kyazdani42/nvim-web-devicons' plugin
---@param user_icons circles.ConfigSchema.Icons
local override_devicons = function(user_icons)
  local installed, dev_icons = pcall(require, 'nvim-web-devicons')
  if installed then
    dev_icons.setup({ default = true })

    dev_icons.set_default_icon(user_icons.empty)
    for _, icon in pairs(dev_icons.get_icons()) do
      icon.icon = user_icons.empty
    end
  else
    error("circles.nvim required 'kyazdani42/nvim-web-devicons'")
  end
end

---override lsp diagnostic prefix icon
local override_lsp_diagnostic_text = function()
  vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = { prefix = vim.g.circles_lsp_prefix_icon },
    signs = true,
    update_in_insert = false,
  })
end

---Setup your uniform icons for neovim
---@param user_config circles.ConfigSchema|nil
M.setup = function(user_config)
  if user_config then
    apply_configuration(user_config)
  end

  override_devicons(config.icons)

  vim.g.circles_lsp_prefix_icon = nil
  if config.lsp then
    -- useful for test
    vim.g.circles_lsp_prefix_icon = config.icons.lsp_prefix
    override_lsp_diagnostic_text()
  end
end

---return uniform icons for nvimtree.icons.glyphs
---@return table<string, string>
M.get_nvimtree_glyphs = function()
  return {
    default = config.icons.empty,
    symlink = config.icons.empty,
    folder = {
      default = config.icons.empty,
      open = config.icons.filled,
      empty = config.icons.empty,
      empty_open = config.icons.filled,
      symlink = config.icons.empty,
      symlink_open = config.icons.filled,
    },
  }
end

---return config of circles.nvim
---@return circles.ConfigSchema
M.get_config = function()
  return config
end

return M
