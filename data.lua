if settings.startup["cat-patcher-remove-mas-antimatter-bots"].value then
	require("patches.remove-mas-antimatter-bots")
end

if settings.startup["cat-patcher-remove-manual-color-module"].value then
	require("patches.remove-manual-color-module")
end

if settings.startup["cat-patcher-rename-stuff"].value then
	require("patches.rename-stuff")
end

if settings.startup["cat-patcher-mammoth-mk3-as-marv"].value then
	require("patches.mammoth-mk3-as-marv")
end

if settings.startup["cat-patcher-immortal-cirno"].value then
	require("patches.immortal-cirno")
end

if settings.startup["cat-patcher-senestella-stargate-solar"].value then
	require("patches.senestella-stargate-solar")
end

if settings.startup["cat-patcher-remove-floating-long-stack-inserter"].value then
    require("patches.remove-floating-long-stack-inserter")
end

require("lib.manipulation").execute_deferred()
