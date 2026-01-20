if not (mods["Moshine"] and mods["electric-trains"]) then
	return
end

local lib = require("lib.manipulation")

-- move electric train tech behind magnetism (moshine)
if data.raw["technology"]["tech-electric-trains"] then
    log("Moving electric train tech behind magnetism (Moshine)...")
	table.insert(data.raw["technology"]["tech-electric-trains"].prerequisites, "moshine-tech-magnet")
end

lib.modify_ingredients("recipe-electric-locomotive", { type = "item", name = "magnet", amount = 5 })
lib.modify_ingredients("recipe-electric-cargo-wagon", { type = "item", name = "magnet", amount = 5 })
lib.modify_ingredients("recipe-electric-fluid-wagon", { type = "item", name = "magnet", amount = 5 })
lib.modify_ingredients("recipe-electric-artillery-wagon", { type = "item", name = "magnet", amount = 5 })
