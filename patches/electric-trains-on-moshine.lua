if not (mods["Moshine"] and mods["electric-trains"]) then
	return
end

local logl = require("lib.log")
local mlib = require("lib.manipulation")

-- move electric train tech behind magnetism (moshine)
if data.raw["technology"]["tech-electric-trains"] then
	logl.info("Moving electric train tech behind magnetism (Moshine)...")
	table.insert(data.raw["technology"]["tech-electric-trains"].prerequisites, "moshine-tech-magnet")
end

logl.info("Modifying electric train recipes to use magnets...")
mlib.modify_ingredients("recipe-electric-locomotive", { type = "item", name = "magnet", amount = 5 })
mlib.modify_ingredients("recipe-electric-cargo-wagon", { type = "item", name = "magnet", amount = 5 })
mlib.modify_ingredients("recipe-electric-fluid-wagon", { type = "item", name = "magnet", amount = 5 })
mlib.modify_ingredients("recipe-electric-artillery-wagon", { type = "item", name = "magnet", amount = 5 })
