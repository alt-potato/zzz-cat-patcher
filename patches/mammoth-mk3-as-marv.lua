if not (mods["Factorio-Tiberium"] and mods["Mammoth-MK3"]) then
	return
end

local m_lib = require("lib.manipulation")

-- deep copy mammoth-mk3
local mammoth_mk3 = table.deepcopy(data.raw["car"]["mammoth-mk3"])

-- remove mammoth-mk3, tiberium-marv
m_lib.remove_item("mammoth-mk3", { item_type = "item-with-entity-data", remove_from_technologies = { "mammoth-mk3" } })
m_lib.remove_technology("mammoth-mk3")

-- remove t1 atom shells
m_lib.remove_item("t1-atom-shell")
m_lib.add_defer_operation("remove-t1atom-techs", function(prototype)
	m_lib.remove_technology(prototype.name)
end)
local function is_t1atom_tech(prototype)
	return string.sub(prototype.name, 1, string.len("t1atom-")) == "t1atom-"
end
m_lib.defer("technology", is_t1atom_tech, "remove-t1atom-techs")

-- add mammoth-mk3 as tiberium-marv
mammoth_mk3.name = "tiberium-marv"
table.insert(mammoth_mk3.resistances, { type = "tiberium", decrease = 0, percent = 100 })
mammoth_mk3.consumption = "1200kW"
mammoth_mk3.braking_power = "1000kW"
mammoth_mk3.friction = 0.02
mammoth_mk3.minable = { mining_time = 0.5, result = "tiberium-marv" }
mammoth_mk3.weight = 50000

-- final patches to mammoth-mk3 because i feel like it
local ammo_category = (mods["aai-vehicles-laser-tank"] and "laser-cannon") or "cannon-shell"
m_lib.overwrite({ "gun", "mammoth-cannon", "attack_parameters" }, {
	projectile_creation_offsets = { { -0.25, -1.75 } },
	ammo_category = ammo_category,
})
m_lib.overwrite({ "gun", "mammoth-cannon-b", "attack_parameters" }, {
	projectile_creation_offsets = { { 0.25, -1.75 } },
})

local mammoth_rkt_1 = table.deepcopy(data.raw["gun"]["spidertron-rocket-launcher-1"])
mammoth_rkt_1.name = "mammoth-rocket-launcher-1"
mammoth_rkt_1.attack_parameters.projectile_orientation_offset = 0 -- i mean they're facing forward sooo
mammoth_rkt_1.attack_parameters.projectile_creation_offsets = { { -1.25, -1 } }

local mammoth_rkt_2 = table.deepcopy(data.raw["gun"]["spidertron-rocket-launcher-2"])
mammoth_rkt_2.name = "mammoth-rocket-launcher-2"
mammoth_rkt_2.attack_parameters.projectile_orientation_offset = 0
mammoth_rkt_2.attack_parameters.projectile_creation_offsets = { { 1.25, -1 } }

mammoth_mk3.guns = {
	"mammoth-cannon",
	"mammoth-cannon-b",
	"mammoth-rocket-launcher-1",
	"mammoth-rocket-launcher-2",
}

data:extend({ mammoth_mk3, mammoth_rkt_1, mammoth_rkt_2 })
