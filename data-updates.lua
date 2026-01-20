if settings.startup["cat-patcher-vtk-over-aai-cannon-shells"].value then
    require("patches.vtk-over-aai-cannon-shells")
end

if settings.startup["cat-patcher-electric-trains-on-moshine"].value then
	require("patches.electric-trains-on-moshine")
end
