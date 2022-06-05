.DEFAULT_GOAL = lint

.PHONY: fmt
fmt:
	stylua --config-path stylua.toml --glob 'lua/**/*.lua' -- lua

.PHONY: lint
lint:
	luacheck lua

.PHONY: test
test: deps/neovim
	nvim --headless --noplugin -u tests/minimal_init.vim -c "PlenaryBustedDirectory tests/circles/ { minimal_init = 'tests/minimal_init.vim' }"
