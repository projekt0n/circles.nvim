---@class circles.ConfigSchema
---@field icons table<string, string>
---@field lsp boolean
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
    error("circles.nvim required 'kyazdani42/nvim-web-devicons'")
  end
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

---Setup your uniform icons for neovim
---@param user_config circles.ConfigSchema
local setup = function(user_config)
  if user_config then
    apply_configuration(user_config)
  end

  override_devicons(config)
  if config.lsp then
    override_lsp_diagnostic_text(config)
  end
end

return { setup = setup }
