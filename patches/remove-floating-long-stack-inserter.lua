if
	not (
		mods["dredgeworks"]
		and mods["long_stack_inserter"]
		and mods["Moshine"]
		and not settings.startup["moshine-long_stack_inserter"].value
	)
then
	return
end

local logl = require("lib.log")
local mlib = require("lib.manipulation")

logl.info("Removing floating long stack inserter...")

-- you're killing me here moshine
mlib.remove_item("floating-long-stack-inserter", {
	item_type = { "item", "inserter" },
	remove_recycling = true,
	remove_from_technologies = { "floating-logistics-technology" },
})

-- you're killing me here paracelsin
if mods["Paracelsin"] then
	mlib.remove({ "recipe", "floating-long-stack-inserter-macerating" })
end
