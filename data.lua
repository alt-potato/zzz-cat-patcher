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

require("lib.manipulation").execute_deferred()
