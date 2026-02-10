if
	not (
		mods["long_stack_inserter"]
		and mods["Moshine"]
		and not settings.startup["moshine-long_stack_inserter"].value
		-- and mods["dredgeworks"] -- doesn't technically rely on dredgeworks
	)
then
	return
end

local logl = require("lib.log")
local mlib = require("lib.manipulation")

logl.info("Removing (floating) long stack inserter...")

-- moshine does not fully remove it if disabled 
-- yes i have beef with moshine AAAAAAAA
mlib.remove_item("long-stack-inserter", {
	item_type = { "item", "inserter" },
})
mlib.remove_technology("long-stack-inserter")

if mods["tenebris"] or mods["tenebris-prime"] then
	mlib.remove_item("bioluminescent-long-stack-inserter", {
		item_type = { "item", "inserter" },
		remove_from_technologies = { "bioinfusor" },
	})
end
