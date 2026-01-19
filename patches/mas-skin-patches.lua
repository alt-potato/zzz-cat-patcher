if not mods["metal-and-stars"] then
	return
end

---@class CorpsePatch
---@field corpse_name string
---@field prototype table -- from charactermodhelper
---@field armor_picture_mapping nil|table<string, number> -- note that "" is used as a fallback

---@type table<string, CorpsePatch>
local to_patch = {
	["ProtogenCharacterUpdated"] = { corpse_name = "protogen-skin-corpse", prototype = PROTOCHAR.protos },
	["koboldengineer"] = { corpse_name = "koboldengineer-skin-corpse", prototype = KOBOLD },
	["wickerbeast"] = {
		corpse_name = "_wickerbeast-corpse",
		prototype = _3aecca88_5f97_447e_b7dd_46f834ad3c03,
		armor_picture_mapping = {
			["light-armor"] = 1,
			[""] = 2,
		},
	},
	["lexxy-wickerbeast"] = {
		corpse_name = "_f42f38fb_b84e_4b34_8fd8_70cce8873d5b",
		prototype = _3aecca88_5f97_447e_b7dd_46f834ad3c03,
		armor_picture_mapping = {
			["light-armor"] = 1,
			[""] = 2,
		},
	},
}

for mod_name, patch_data in pairs(to_patch) do
	local corpse = data.raw["character-corpse"][patch_data.corpse_name]

	if mods[mod_name] and corpse then
		log("patching " .. mod_name .. " with corpse " .. patch_data.corpse_name .. "...")

		-- just set them all to 1 (scuffed) (unless a predefined mapping is given)
		corpse.armor_picture_mapping = {}
		for a_name, armor in pairs(data.raw.armor) do
			if patch_data.armor_picture_mapping then
				corpse.armor_picture_mapping[a_name] = patch_data.armor_picture_mapping[a_name]
					or patch_data.armor_picture_mapping[""]
					or 1
			else
				corpse.armor_picture_mapping[a_name] = 1
			end
		end

		-- let charactermodhelper know we changed stuff
		patch_data.prototype.corpse.armor_picture_mapping = table.deepcopy(corpse.armor_picture_mapping)
	elseif not corpse then
		log("no corpse " .. patch_data.corpse_name .. " for " .. mod_name .. ".")
	end
end
