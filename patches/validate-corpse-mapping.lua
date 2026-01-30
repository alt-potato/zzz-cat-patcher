local logl = require("lib.log")

for corpse_name, corpse in pairs(data.raw["character-corpse"]) do
	if corpse and corpse.armor_picture_mapping and corpse.pictures then
		local num_pictures = #corpse.pictures
		for armor_name, index in pairs(corpse.armor_picture_mapping or {}) do
			if index > num_pictures then
				logl.info(
					corpse_name
						.. ": limiting armor_picture_mapping of "
						.. armor_name
						.. " ("
						.. index
						.. " -> "
						.. num_pictures
						.. ")..."
				)
				corpse.armor_picture_mapping[armor_name] = num_pictures
			end
		end
	else
		logl.warn("No armor_picture_mapping or no pictures for " .. corpse_name .. "?")
	end
end
