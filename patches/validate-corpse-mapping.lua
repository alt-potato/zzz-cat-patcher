for corpse_name, corpse in pairs(data.raw["character-corpse"]) do
	if corpse then
		local num_pictures = #corpse.pictures
		for armor_name, index in pairs(corpse.armor_picture_mapping or {}) do
			if index > num_pictures then
				log(
				"For "
						.. corpse_name
						.. ", limiting armor_picture_mapping of "
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
	end
end
