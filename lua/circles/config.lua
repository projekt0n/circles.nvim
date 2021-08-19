local util = require("circles.util")

---@class Cfg
local config

config = {icons = {empty = "", filled = "", lsp_prefix = ""}, lsp = true}

---Apply custom configurations to projekt0n/circles.nvim plugin
---@param userConfig Cfg
local function applyConfiguration(userConfig)
  for key, value in pairs(userConfig) do
    if value ~= nil then
      if config[key] ~= nil then
        config[key] = value
      else
        util.error("config option '" .. key .. "' does not exist")
      end
    end
  end
end

return {config = config, applyConfiguration = applyConfiguration}
