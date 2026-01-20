local lib = {}

--
--     ⠀⠀⠀⠀⠀⠀⠀⠀⠀⡠⠔⠒⡒⢠⣩⣍⣁⠂⠠⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀
--     ⠀⠀⠀⠀⠀⠀⢀⠔⣡⣴⣾⣽⣹⣿⣿⣿⣿⣿⣦⡈⢂⠀⠀⠀⠀⠀⠀⠀⠀
--     ⠀⠀⠀⠀⢀⣤⣃⣶⣟⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡀⡆⠀⠀⠀⠀⠀⠀⠀
--     ⠀⠀⠀⡠⠒⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡅⢸⠀⠀⠀⠀⠀⠀⠀
--     ⠀⢀⣜⣤⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣜⢨⠄⠀⠀⠀⠀⠀⠀
--     ⢀⣞⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇⢸⠀⠀⠀⠀⠀⠀⠀
--     ⣾⠿⠛⠛⠛⡝⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢢⡇⠀⠀⠀⠀⠀⠀⠀
--     ⠀⠀⠀⠀⠀⠀⢽⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣹⠀⠀⠀⠀⠀⠀⠀⠀
--     ⠀⠀⠀⠀⠀⠀⠀⠙⠻⠿⢿⣿⡿⠟⠛⣿⣿⣿⣿⣿⡳⠀⠀⠀⠀⠀⠀⠀⠀
--     ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣿⣯⡆⠀⠀⢻⣿⡟⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀
--     ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⡿⡗⠀⠀⣼⣿⡅⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
--     ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣧⠁⠀⠀⣿⣿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
--     ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⢹⠀⠀⠀⢿⣿⢳⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
--     ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣾⠤⡄⣀⣚⣿⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
--     ⠈⠻⠿⠿⠷⠾⢥⣬⣴⣿⢿⣿⡟⢿⠉⠛⢻⡽⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
--     ⠀⠀⠀⠀⠀⠀⢀⡠⢊⣡⠞⠉⠿⣌⢷⡂⢼⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
--     ⠀⠀⠀⠀⢀⠔⣡⠔⠋⠀⠀⠀⠀⠘⢦⣝⣾⣿⣽⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
--     ⠀⠀⠀⣴⡡⠊⠀⠀⠀⠀⠀⢀⣀⢤⣔⣽⣿⡟⣷⣮⣔⡢⢄⡀⡀⠀⠀⠀⠀
--     ⠀⠀⠀⠀⠀⠀⣶⣖⣶⠭⠿⠶⠛⠛⠉⠁⢸⠅⡇⠀⠈⠙⠛⠳⠶⢯⣵⣲⠠
--     ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⢀⡇⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉
--     ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡜⣸⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
--     ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡧⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
--     ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡼⠃⠀⠀⠀⠀⠀⠀
--⠀⠀⠀⠀
--            MANIPULATION!!!
--

---@class lib.remove_item_opt
---@field item_type string?
---@field hide_item_only boolean?
---@field remove_recipes string[]? -- The recipes to remove, defaults to { item_name }
---@field use_dummy_recipes boolean? -- Whether to replace the recipes with dummy recipes
---@field remove_from_technologies string[]? -- The technologies to remove the recipes from

-- Removes an item and its recipes from the game and any given technologies.
-- If use_dummy_recipes is true, the recipes will be replaced with empty recipes.
---@param item_name string
---@param opt? lib.remove_item_opt
lib.remove_item = function(item_name, opt)
	opt = opt or {}
	local item_type = opt.item_type or "item"
	local recipes_to_remove = opt.remove_recipes or { item_name }

	log("Removing " .. item_type .. " \"" .. item_name .. "\" with recipe(s): " .. serpent.line(recipes_to_remove) .. "...")

	local item_to_remove = data.raw[item_type][item_name]

	if not item_to_remove then
		log("\tWARNING: Item \"" .. item_name .. "\" does not exist.")
	elseif opt.hide_item_only then
		log("\tHiding item \"" .. item_name .. "\"")

		item_to_remove.icon = "__base__/graphics/icons/signal/signal-deny.png"
		item_to_remove.icon_size = 64
		item_to_remove.hidden = true
		item_to_remove.hidden_in_factoriopedia = true
	else
		item_to_remove = nil
	end

	for _, recipe_name in pairs(recipes_to_remove) do
		log("\tRemoving recipe \"" .. recipe_name .. "\"")
		data.raw.recipe[recipe_name] = nil

		if opt.use_dummy_recipes then
			log("\t\tCreating dummy recipe \"" .. recipe_name .. "\"")
			data:extend({
				{
					type = "recipe",
					name = recipe_name,
					ingredients = {},
					results = {},
					hidden_in_factoriopedia = true,
					hide_from_player_crafting = true,
					hide_from_signal_gui = true,
					enabled = false,
					icon = "__base__/graphics/icons/signal/signal-deny.png",
				},
			})
		end

		for _, technology_name in pairs(opt.remove_from_technologies or {}) do
			for i = 1, #data.raw.technology[technology_name].effects do
				if data.raw.technology[technology_name].effects[i].recipe == recipe_name then
					log("\t\tRemoving recipe from technology \"" .. technology_name .. "\"")
					table.remove(data.raw.technology[technology_name].effects, i)
					break
				end
			end
		end
	end
end

lib.remove_technology = function(technology_name)
	log("Removing technology \"" .. technology_name .. "\"...")

	if not data.raw.technology[technology_name] then
		log("\tWARNING: Technology \"" .. technology_name .. "\" does not exist.")
	end

	data.raw.technology[technology_name] = nil
end

---@class IngredientPrototype
---@field type "item"|"fluid"
---@field name string
---@field amount integer

---Modifies the ingredients of a recipe by adding the given amount of items or fluids.
---@param recipe_name string
---@param modifiers IngredientPrototype|IngredientPrototype[]
lib.modify_ingredients = function(recipe_name, modifiers)
	log("Modifying recipe \"" .. recipe_name .. "\"...")

	local recipe = data.raw.recipe[recipe_name]
	if not recipe or not recipe.ingredients then
		log("\tWARNING: Recipe \"" .. recipe_name .. "\" does not exist.")
		return
	end
	if type(modifiers[1]) ~= "table" then
		modifiers = { modifiers }
	end
	if not modifiers or modifiers == {} then
		log("\tWARNING: No modifiers given.")
		return
	end
	assert(type(modifiers) == "table", "Modifiers must be an ingredient or table of ingredients.")
	assert(type(modifiers[1]) == "table", "Modifiers must be an ingredient or table of ingredients.")

	-- add to existing ingredients
	for _, ingredient in pairs(recipe.ingredients) do
		if modifiers[ingredient.name] and (modifiers[ingredient.name].type == ingredient.type) then
			log(
				"\tModifying \""
					.. ingredient.name
					.. "\" (x"
					.. ingredient.amount
					.. " + "
					.. modifiers[ingredient.name].amount
					.. ")"
			)
			ingredient.amount = math.max(ingredient.amount + modifiers[ingredient.name].amount, 0)
			modifiers[ingredient.name] = nil -- mark as done
		end
	end

	-- add new ingredients
	for _, modifier in pairs(modifiers) do
		if modifier and modifier.name and modifier.type and modifier.amount and modifier.amount > 0 then
			log("\tAdding \"" .. modifier.name .. "\" (" .. modifier.type .. " x" .. modifier.amount .. ")")
			table.insert(recipe.ingredients, modifier)
		end
	end
end

return lib
