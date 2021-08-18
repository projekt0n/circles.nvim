local config_module = require("circles.config")
local util = require("circles.util")

M = {}

---Setup your uniform icons for neovim with projekt0n/circles.nvim
---@param userConfig Cfg
M.setup = function(userConfig)
  if userConfig then config_module.applyConfiguration(userConfig) end
  util.load(config_module.config)
end

return M
