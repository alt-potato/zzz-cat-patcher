if not mods["metal-and-stars"] then
	return
end

local to_patch = {
	["ProtogenCharacterUpdated"] = { "protogen-skin-corpse", PROTOCHAR.protos, nil },
	["koboldengineer"] = { "koboldengineer-skin-corpse", KOBOLD, nil },
}

for mod_name, patch_data in pairs(to_patch) do
	if mods[mod_name] then
		log("patching " .. mod_name .. " with " .. patch_data[1])

		local corpse = data.raw["character-corpse"][patch_data[1]]

		-- just set them all to 1 (scuffed)
		corpse.armor_picture_mapping = {}
		for a_name, armor in pairs(data.raw.armor) do
			corpse.armor_picture_mapping[a_name] = to_patch[mod_name][3] or 1
		end

		-- let charactermodhelper know we changed stuff
		patch_data[2].corpse.armor_picture_mapping = table.deepcopy(corpse.armor_picture_mapping)
	end
end
