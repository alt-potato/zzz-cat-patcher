if not ((mods["tenebris"] or mods["tenebris-prime"]) and mods["dredgeworks"]) then
	return
end

local m_lib = require("lib.manipulation")

m_lib.add_defer_operation("remove-floating-logistics", function(prototype)
	m_lib.remove_item(prototype.name, {
		item_type = { "item", "inserter", "transport-belt" },
		quiet_miss = true, -- overly broad search on purpose :)
		remove_recycling = true,
		remove_from_technologies = { "floating-logistics-technology", "bioinfusor" },
	})
end)

local function is_floating_bioluminescent(prototype)
	local match = string.sub(prototype.name, 1, string.len("floating-bioluminescent-"))
	return match == "floating-bioluminescent-" or match == "bioluminescent-floating-"
end

m_lib.defer("item", is_floating_bioluminescent, "remove-floating-logistics")
