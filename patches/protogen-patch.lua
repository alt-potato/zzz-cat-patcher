local corpse = data.raw["character-corpse"]["protogen-skin-corpse"]

corpse.armor_picture_mapping = {}
for a_name, armor in pairs(data.raw.armor) do
	corpse.armor_picture_mapping[a_name] = 1
end

PROTOCHAR.protos.corpse.armor_picture_mapping = table.deepcopy(corpse.armor_picture_mapping)
