if settings.startup["cat-patcher-remove-mas-antimatter-bots"].value then
	require("patches.remove-mas-antimatter-bots")
end

if settings.startup["cat-patcher-remove-manual-color-module"].value then
	require("patches.remove-manual-color-module")
end

if settings.startup["cat-patcher-rename-stuff"].value then
	require("patches.rename-stuff")
end

require("patches.mammoth-mk3-as-marv")

require("patches.immortal-cirno")

require("lib.manipulation").execute_deferred()
