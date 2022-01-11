local config = require('circles.config')
local util = require('circles.util')

local init = {}

---Setup your uniform icons for neovim
---@param user_config circles.ConfigSchema
init.setup = function(user_config)
  if user_config then
    config.apply_configuration(user_config)
  end

  local cfg = config.schema

  util.override_devicons(cfg)
  util.override_nvimtree_icons(cfg)
  if cfg.lsp then
    util.override_lsp_diagnostic_text(cfg)
  end
end

return init
