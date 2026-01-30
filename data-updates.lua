if settings.startup["cat-patcher-resize-greyscale-lex-heavyship"].value then
    require("patches.resize-greyscale-lex-heavyship")
end

if settings.startup["cat-patcher-vtk-over-aai-cannon-shells"].value then
    require("patches.vtk-over-aai-cannon-shells")
end

if settings.startup["cat-patcher-electric-trains-on-moshine"].value then
	require("patches.electric-trains-on-moshine")
end

if settings.startup["cat-patcher-remove-floating-long-stack-inserter"].value then
    require("patches.remove-floating-long-stack-inserter")
end

if settings.startup["cat-patcher-remove-floating-bioluminescents"].value then
    require("patches.remove-floating-bioluminescents")
end

require("lib.manipulation").execute_deferred()
