if not mods["metal-and-stars"] then
	return
end

local logl = require("lib.log")
local mlib = require("lib.manipulation")

if not (mods["skewer-planet-vesta"] and settings.startup["ske_disable_metal_and_stars_bots"].value) then
	logl.info("Removing antimatter robots...")

	-- remove antimatter robots and associated tech
	mlib.remove_item("antimatter-construction-robot", {
		remove_from_technologies = { "antimatter-robots" },
	})
	mlib.remove_item("antimatter-logistic-robot", {
		remove_from_technologies = { "antimatter-robots" },
	})

	-- data.raw["construction-robot"]["antimatter-construction-robot"] = nil
	-- data.raw["logistic-robot"]["antimatter-logistic-robot"] = nil

	mlib.remove_technology("antimatter-robots")
end

-- rename antimatter to better reflect its (now-limited) function
if data.raw.item["antimatter"] then
	logl.info("Renaming antimatter -> antimatter catalyst...")
	data.raw.item["antimatter"].localised_name = { "cat-patch-item-name.antimatter-catalyst" }
end
