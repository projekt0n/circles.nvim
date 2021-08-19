fun! ReloadCircles()
	lua for k in pairs(package.loaded) do if k:match("^circles") then package.loaded[k] = nil end end
	lua require("circles").setup()
endfun

augroup ReloadCircles
	autocmd!
augroup END
