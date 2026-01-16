if settings.startup["cat-patcher-mas-skin-patches"].value then
	require("patches.mas-skin-patches")
end

if settings.startup["cat-patcher-vtk-over-aai-cannon-shells"].value then
    require("patches.vtk-over-aai-cannon-shells")
end
