local config = require('circles.config')
local util = require('circles.util')

local init = {}

---Setup your uniform icons for neovim
---@param user_config circles.ConfigSchema
init.setup = function(user_config)
  if user_config then
    config.apply_configuration(user_config)
  end
  util.load(config.schema)
end

return init
