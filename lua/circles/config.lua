local util = require("circles.util")

---@class circles.Config
---@field icons table<string,string>
---@field lsp boolean
local config = {icons = {empty = "", filled = "", lsp_prefix = ""}, lsp = true}

---Apply custom configurations to projekt0n/circles.nvim plugin
---@param user_config circles.Config
local function apply_configuration(user_config)
  for key, value in pairs(user_config) do
    if value ~= nil then
      if config[key] ~= nil then
        config[key] = value
      else
        util.error("config option '" .. key .. "' does not exist")
      end
    end
  end
end

return {config = config, apply_configuration = apply_configuration}
