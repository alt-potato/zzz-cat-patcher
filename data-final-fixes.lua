if settings.startup["cat-patcher-validate-corpse-mapping"].value then
	require("patches.validate-corpse-mapping")
end
