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

  local make_error = function(msg, x1, y1, x2, y2, source, code)
    return {
      lnum = x1,
      col = y1,
      end_lnum = x2,
      end_col = y2,
      message = msg,
      severity = vim.diagnostic.severity.ERROR,
      source = source,
      code = code,
    }
  end

  local diagnostic_ns = vim.api.nvim_create_namespace('diagnostic_spec')
  local diagnostic_bufnr = vim.api.nvim_create_buf(true, false)
  local diagnostics = { make_error('Some error', 0, 0, 0, 0) }

  local get_virt_text = function(ns)
    ns = vim.diagnostic.get_namespace(ns)
    local virt_text_ns = ns.user_data.virt_text_ns
    local extmarks = vim.api.nvim_buf_get_extmarks(diagnostic_bufnr, virt_text_ns, 0, -1, { details = true })
    return extmarks[1][4].virt_text[2][1]
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
    vim.diagnostic.set(diagnostic_ns, diagnostic_bufnr, diagnostics, {})
    local virt_text = get_virt_text(diagnostic_ns)

    assert.are.same(default_icons.lsp_prefix .. ' Some error', virt_text)
  end)

  it('can overriding custom lsp virtual-text prefix', function()
    circles.setup({ icons = custom_icons, lsp = true })

    vim.diagnostic.set(diagnostic_ns, diagnostic_bufnr, diagnostics, {})
    local virt_text = get_virt_text(diagnostic_ns)

    assert.are.same(custom_icons.lsp_prefix .. ' Some error', virt_text)
  end)

  it('can disable custom prefix override in diagnostics', function()
    circles.setup({ lsp = false })

    vim.diagnostic.set(diagnostic_ns, diagnostic_bufnr, diagnostics, {})
    local virt_text = get_virt_text(diagnostic_ns)

    assert.are.same('■ Some error', virt_text)
  end)
end)
