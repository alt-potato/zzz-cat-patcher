if not mods["Automatic_Train_Painter"] then
	return
end

local remove_item = require("lib.manipulation").remove_item

remove_item("manual-color-module", {
	item_type = "generator-equipment",
	remove_recipes = {},
})
remove_item("manual-color-module", {
	item_type = "generator-equipment",
	use_dummy_recipes = true,
	remove_from_technologies = { "automated-rail-transportation" },
})
