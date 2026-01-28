local modify_prototype = require("lib.manipulation").modify_prototype

if mods["Cerys-Moon-of-Fulgora"] then
	-- conflicts with overclock modules from metal-and-stars
	modify_prototype(
		{ "module", "cerys-overclock-module" },
		{ localised_name = { "cat-patch-item-name.cerys-overclock-module" } }
	)
end

if mods["rubia"] then
	-- conflicts with efficiency module 4 from secretas
	modify_prototype({ "module", "rubia-efficiency-module4" }, { localised_name = { "cat-patch-item-name.rubia-efficiency-module4" } })
end

if mods["metal-and-stars"] then
	-- capitalize first letter
	modify_prototype({ "ammo", "gauss-rocket" }, { localised_name = { "cat-patch-item-name.gauss-rocket" } })
end

if mods["NapalmArtillery"] then
	-- uncapitalize subsequent words
	modify_prototype({ "ammo", "napalm-artillery-shell" }, { localised_name = { "cat-patch-item-name.napalm-artillery-shell" } })
end
