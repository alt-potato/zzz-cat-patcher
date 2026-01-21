if not ((mods["tenebris"] or mods["tenebris-prime"]) and mods["dredgeworks"]) then
	return
end

local m_lib = require("lib.manipulation")

m_lib.add_defer_operation("remove", function(prototype)
	m_lib.remove_item(prototype.name, {
        remove_from_technologies = { "floating-logistics-technology" },
	})
end)

local function is_floating_bioluminescent(prototype)
	return string.sub(prototype.name, 1, string.len("floating-bioluminescent-")) == "floating-bioluminescent-"
end

m_lib.defer("item", is_floating_bioluminescent, "remove")
