describe('circles.nvim', function()
  ----------
  -- Modules
  ----------
  local circles = require('circles')
  local devicons = require('nvim-web-devicons')

  ------------
  -- Utilities
  ------------
  ---@param expected_icon string
  local assert_default_icon = function(expected_icon)
    local icon, _ = devicons.get_icon_color('test_name', 'test_extenstion', { default = true })
    assert.are.same(icon, expected_icon)
  end

  ---@param expected_icon string
  local assert_icons = function(expected_icon)
    for _, icon in pairs(devicons.get_icons()) do
      assert.are.same(icon.icon, expected_icon)
    end
  end

  local default_config = circles.get_config()
  local default_icons = default_config.icons
  local custom_icons = { empty = '', filled = '', lsp_prefix = '' }

  before_each(function()
    circles.setup({ icons = default_icons, lsp = true })
  end)

  --------
  -- Tests
  --------
  it('can load nvim-web-devicons', function()
    assert.is_true(devicons.has_loaded())
  end)

  it('can return default config', function()
    circles.setup()
    assert.are.equal(circles.get_config(), default_config)
  end)

  it('can return user config', function()
    local user_config = { icons = custom_icons, lsp = false }
    circles.setup(user_config)
    assert.are.equal(circles.get_config().icons, custom_icons)
    assert.are.equal(circles.get_config().lsp, false)
  end)

  it("can override 'default_icon' in nvim-web-devicons", function()
    assert_default_icon(default_icons.empty)
  end)

  it("can override custom 'default_icon' in nvim-web-devicons", function()
    circles.setup({ icons = custom_icons })
    assert_default_icon(custom_icons.empty)
  end)

  it('can override nvim-web-devicons', function()
    assert_icons(default_icons.empty)
  end)

  it('can override custom nvim-web-devicons', function()
    circles.setup({ icons = custom_icons })
    assert_icons(custom_icons.empty)
  end)

  it('can overriding lsp virtual-text prefix', function()
    assert.are.same(vim.g.circles_lsp_prefix_icon, default_icons.lsp_prefix)
  end)

  it('can overriding custom lsp virtual-text prefix', function()
    circles.setup({ icons = custom_icons, lsp = true })
    assert.are.same(vim.g.circles_lsp_prefix_icon, custom_icons.lsp_prefix)
  end)

  it('can disable Lsp virtual-text prefix', function()
    circles.setup({ lsp = false })
    assert.is_nil(vim.g.circles_lsp_prefix_icon)
  end)
end)
