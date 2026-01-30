if not (mods["metal-and-stars"] and mods["PlanetsLib"] and PlanetsLib) then
	return
end

local logl = require("lib.log")

local senestella_solar_power = 200 -- match gleba

logl.info("Balancing Calidus -> Senestella stargate space solar power to " .. senestella_solar_power .. "%...")
PlanetsLib:update({
	{
		type = "space-location",
		name = "calidus-senestella-gate-calidus",
		solar_power_in_space = senestella_solar_power,
	},
})
