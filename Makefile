.DEFAULT_GOAL = check

circles_path = lua/circles
extra_path = $(circles_path)/extra

extra: $(extra_path)
	@lua $(extra_path)/init.lua

format:
	@for file in `find . -name '*.lua'`;do lua-format $$file -i; done;

lint: $(circles_path)
	@luacheck $(circles_path)

check: format lint

