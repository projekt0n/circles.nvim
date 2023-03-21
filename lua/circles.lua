local M = {}

---@class circles.Icons
---@field empty string
---@field filled string
---@field lsp_prefix string

---@class circles.ConfigSchema
---@field icons circles.Icons
local config = {
  icons = {
    empty = '',
    filled = '',
    lsp_prefix = '',
  },
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

---override icons to 'nvim-tree/nvim-web-devicons' plugin
---@param user_icons circles.Icons
local override_devicons = function(user_icons)
  local installed, dev_icons = pcall(require, 'nvim-web-devicons')
  if installed then
    dev_icons.setup({ default = true })

    dev_icons.set_default_icon(user_icons.empty)
    for _, icon in pairs(dev_icons.get_icons()) do
      icon.icon = user_icons.empty
    end
  else
    error("circles.nvim required 'nvim-tree/nvim-web-devicons'")
  end
end

---Setup your uniform icons for neovim
---@param user_config circles.ConfigSchema|nil
M.setup = function(user_config)
  if user_config then
    apply_configuration(user_config)
  end

  override_devicons(config.icons)

  if config.lsp then
    vim.diagnostic.config({
      virtual_text = {
        prefix = config.icons.lsp_prefix,
      },
    })
  else
    -- An else condition is required here because the default diagnostic icon
    -- may not be retrievable due to `vim` being a global variable.
    vim.diagnostic.config({
      virtual_text = {
        prefix = '■',
      },
    })
  end
end

---Return uniform icons for nvimtree.icons.glyphs
---@return table<string, string|table<string, string>>
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

---Return config of circles.nvim
---@return circles.ConfigSchema
M.get_config = function()
  return config
end

return M
