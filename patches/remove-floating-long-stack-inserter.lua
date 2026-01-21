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

local m_lib = require("lib.manipulation")

-- you're killing me here moshine
m_lib.remove_item("floating-long-stack-inserter", { remove_from_technologies = { "floating-logistics-technology" } })
