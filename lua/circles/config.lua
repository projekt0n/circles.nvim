local config = {}

---@class circles.ConfigSchema
---@field icons table<string, string>
---@field lsp boolean
config.schema = { icons = { empty = '', filled = '', lsp_prefix = '' }, lsp = true }

---Apply custom configurations
---@param user_config circles.ConfigSchema
config.apply_configuration = function(user_config)
  for key, value in pairs(user_config) do
    if value ~= nil then
      if config.schema[key] ~= nil then
        config.schema[key] = value
      else
        error("config option '" .. key .. "' does not exist")
      end
    end
  end
end

return config
