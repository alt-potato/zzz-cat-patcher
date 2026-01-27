if not (mods["lex-aircraft"] and mods["lex-aircraft-grayscale"]) then
	return
end

---@param name string
---@param layer integer
---@param opts table<integer, table<string, any>>
local replace_stripes = function(name, layer, opts)
	local ship = data.raw["spider-vehicle"][name]

	if
		-- overkill? no such thing!
		ship
		and ship.graphics_set
		and ship.graphics_set.animation
		and ship.graphics_set.animation.layers
		and ship.graphics_set.animation.layers[layer]
		and ship.graphics_set.animation.layers[layer].stripes
	then
		local stripes = ship.graphics_set.animation.layers[layer].stripes

		for i, mods in pairs(opts) do
			local stripe = stripes[i]

			if stripe then
				for k, mod in pairs(mods) do
					stripe[k] = mod
				end
			end
		end
	else
		log("failed to patch " .. name .. " (layer " .. layer .. ")")
	end
end

local heavyship_name = "lex-flying-heavyship"
local heavyship_layer = 1
local heavyship_opts = {
	[1] = { filename = "__zzz-cat-patcher__/graphics/entity/flying_heavyship/hr-flying_heavyship_1-64.png" },
	[2] = { filename = "__zzz-cat-patcher__/graphics/entity/flying_heavyship/hr-flying_heavyship_65-128.png" },
}

-- should be 5600x5600 instead of 4000x4000
log("patching grayscale " .. heavyship_name .. " (4000x4000 -> 5600x5600)...")
--             /e\
replace_stripes(heavyship_name, heavyship_layer, heavyship_opts)
