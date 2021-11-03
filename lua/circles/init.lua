local config_module = require("circles.config")
local util = require("circles.util")

local M = {}

---Setup your uniform icons for neovim with projekt0n/circles.nvim
---@param user_config circles.Config
M.setup = function(user_config)
  if user_config then config_module.apply_configuration(user_config) end
  util.load(config_module.config)
end

return M
