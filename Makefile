.DEFAULT_GOAL = lint

fmt:
	stylua --config-path stylua.toml --glob 'lua/**/*.lua' -- lua

lint:
	luacheck lua

