if not mods["Automatic_Train_Painter"] then
	return
end

local logl = require("lib.log")
local remove_item = require("lib.manipulation").remove_item

logl.info("Removing manual color module...")

remove_item("manual-color-module", {
	item_type = "generator-equipment",
	remove_recipes = {},
})
remove_item("manual-color-module", {
	use_dummy_recipes = true,
	remove_from_technologies = { "automated-rail-transportation" },
})
