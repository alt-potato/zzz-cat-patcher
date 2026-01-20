if not (mods["aai-programmable-vehicles"] and mods["vtk-cannon-turret"]) then
    return
end

local lib = require("lib.manipulation")

-- remove aai precision cannon shells
local unsafe_to_remove = mods["RegularRecipeList-Compatible_with_AAI"] or mods["aai-vehicles-ironclad"] or false
---@type lib.remove_item_opt
local opt = {
    item_type = "ammo",
    hide_item_only = unsafe_to_remove,
    use_dummy_recipes = true,
}
lib.remove_item("cannon-shell-precision", opt)
lib.remove_item("explosive-cannon-shell-precision", opt)

-- allow vtk cannon shells in all cannons
data.raw.ammo["cannon-shell-magazine"].ammo_category = "cannon-shell"
data.raw.ammo["explosive-cannon-shell-magazine"].ammo_category = "cannon-shell"
data.raw.ammo["uranium-cannon-shell-magazine"].ammo_category = "cannon-shell"
data.raw.ammo["explosive-uranium-cannon-shell-magazine"].ammo_category = "cannon-shell"
