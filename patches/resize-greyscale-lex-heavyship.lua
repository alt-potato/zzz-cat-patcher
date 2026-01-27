if not (mods["lex-aircraft"] and mods["lex-aircraft-grayscale"]) then
	return
end

local heavyship_name = "lex-flying-heavyship"
local heavyship = data.raw["spider-vehicle"][heavyship_name]

-- should be 5600x5600 instead of 4000x4000
log("patching grayscale " .. heavyship_name .. " (4000x4000 -> 5600x5600)...")
--             /e\

if
    heavyship
    and heavyship.graphics_set
    and heavyship.graphics_set.animation
    and heavyship.graphics_set.animation.layers
    and heavyship.graphics_set.animation.layers[1]
then
    local layer = heavyship.graphics_set.animation.layers[1]

    -- WAIT I'M A GENIUS
    layer.width = layer.width * (4000 / 5600)
    layer.height = layer.height * (4000 / 5600)
    layer.scale = layer.scale * (5600 / 4000)
end
