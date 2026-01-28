if not mods["metal-and-stars"] then
	return
end

local m_lib = require("lib.manipulation")

if not (mods["skewer-planet-vesta"] and settings.startup["ske_disable_metal_and_stars_bots"].value) then
	-- remove antimatter robots and associated tech
	m_lib.remove_item("antimatter-construction-robot", {
		remove_from_technologies = { "antimatter-robots" },
	})
	m_lib.remove_item("antimatter-logistic-robot", {
		remove_from_technologies = { "antimatter-robots" },
	})

	-- data.raw["construction-robot"]["antimatter-construction-robot"] = nil
	-- data.raw["logistic-robot"]["antimatter-logistic-robot"] = nil

	m_lib.remove_technology("antimatter-robots")
end

-- rename antimatter to better reflect its (now-limited) function
if data.raw.item["antimatter"] then
	data.raw.item["antimatter"].localised_name = { "cat-patch-item-name.antimatter-catalyst" }
end
