local lib = {}

local logl = require("lib.log")

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
---@field item_type string|string[]? -- The type of item to remove, defaults to "item". Certain special items are in multiple categories, eg. "cars", "inserters".
---@field quiet_miss boolean?
---@field hide_item_only boolean?
---@field remove_recipes string[]? -- The recipes to remove, defaults to { item_name }
---@field remove_recycling boolean? -- Whether to remove the automatically generated recycling recipe (highly recommended if called after data.lua)
---@field use_dummy_recipes boolean? -- Whether to replace the recipes with dummy recipes
---@field remove_from_technologies string[]? -- The technologies to remove the recipes from

-- Removes an item and its recipes from the game and any given technologies.
-- If use_dummy_recipes is true, the recipes will be replaced with empty recipes.
---@param item_name string
---@param opt? lib.remove_item_opt
lib.remove_item = function(item_name, opt)
	opt = opt or {}
	local item_types = opt.item_type or { "item" } ---@type string[] -- trust me bro
	if type(opt.item_type) == "string" then
		item_types = { opt.item_type } -- how do i get the parser to stop being mad at me
	end
	local recipes_to_remove = opt.remove_recipes or { item_name }

	logl.debug(
		'Removing "'
			.. item_name
			.. '" of type '
			.. serpent.line(item_types)
			.. " with recipe(s): "
			.. serpent.line(recipes_to_remove)
			.. "..."
	)

	for _, item_type in pairs(item_types) do
		local item_to_remove = data.raw[item_type][item_name]
		if not item_to_remove then
			if not opt.quiet_miss then
				logl.warn("\t" .. item_type .. ' "' .. item_name .. '" does not exist.')
			end
		elseif opt.hide_item_only then
			logl.trace("\tHiding " .. item_type .. ' "' .. item_name .. '"')

			item_to_remove.icon = "__base__/graphics/icons/signal/signal-deny.png"
			item_to_remove.icon_size = 64
			item_to_remove.hidden = true
			item_to_remove.hidden_in_factoriopedia = true
		else
			-- item_to_remove = nil
			data.raw[item_type][item_name] = nil
		end
	end

	for _, recipe_name in pairs(recipes_to_remove) do
		logl.trace('\tRemoving recipe "' .. recipe_name .. '"')
		data.raw.recipe[recipe_name] = nil

		if opt.use_dummy_recipes then
			logl.trace('\t\tCreating dummy recipe "' .. recipe_name .. '"')
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

		if opt.remove_recycling then
			if data.raw.recipe[item_name .. "-recycling"] then
				logl.trace('\t\tRemoving recycling recipe "' .. recipe_name .. '"')
				data.raw.recipe[item_name .. "-recycling"] = nil
			end
		end

		for _, technology_name in pairs(opt.remove_from_technologies or {}) do
			for i = 1, #data.raw.technology[technology_name].effects do
				if data.raw.technology[technology_name].effects[i].recipe == recipe_name then
					logl.trace('\t\tRemoving recipe from technology "' .. technology_name .. '"')
					table.remove(data.raw.technology[technology_name].effects, i)
					break
				end
			end
		end
	end
end

lib.remove_technology = function(technology_name)
	logl.debug('Removing technology "' .. technology_name .. '"...')

	if not data.raw.technology[technology_name] then
		logl.warn('\tTechnology "' .. technology_name .. '" does not exist.')
	end

	data.raw.technology[technology_name] = nil
end

---Replaces the top-level attributes of a prototype with the given modifiers.
---@param path string[] -- Path to the prototype, after data.raw
---@param modifiers table<string, any>
---@param create_if_missing? boolean
lib.overwrite = function(path, modifiers, create_if_missing)
	logl.debug('Modifying "' .. table.concat(path, ".") .. '" with ' .. table_size(modifiers) .. " modifiers...")

	-- traverse the path
	local current = data.raw
	for _, segment in pairs(path) do
		current = current[segment]

		if not current then
			logl.warn(
				'\tPath "'
					.. table.concat(path, ".")
					.. '" does not exist at segment "'
					.. segment
					.. '". No changes made.'
			)
			return
		end
	end
	local target = current

	for key, value in pairs(modifiers) do
		if (create_if_missing and not target[key]) or not create_if_missing then
			target[key] = value
		else
			logl.warn('\tKey "' .. key .. '" does not exist in ' .. table.concat(path, ".") .. ".")
		end
	end
end

---@class IngredientPrototype
---@field type "item"|"fluid"
---@field name string
---@field amount integer

---Modifies the ingredients of a recipe by adding the given amount of items or fluids.
---@param recipe_name string
---@param modifiers IngredientPrototype|IngredientPrototype[]
lib.modify_ingredients = function(recipe_name, modifiers)
	logl.debug('Modifying recipe "' .. recipe_name .. '"...')

	local recipe = data.raw.recipe[recipe_name]
	if not recipe or not recipe.ingredients then
		logl.warn('\tRecipe "' .. recipe_name .. '" does not exist.')
		return
	end
	if type(modifiers[1]) ~= "table" then
		modifiers = { modifiers }
	end
	if not modifiers or modifiers == {} then
		logl.warn("\tNo modifiers given.")
		return
	end
	assert(type(modifiers) == "table", "Modifiers must be an ingredient or table of ingredients.")
	assert(type(modifiers[1]) == "table", "Modifiers must be an ingredient or table of ingredients.")

	-- add to existing ingredients
	for _, ingredient in pairs(recipe.ingredients) do
		if modifiers[ingredient.name] and (modifiers[ingredient.name].type == ingredient.type) then
			logl.trace(
				'\tModifying "'
					.. ingredient.name
					.. '" (x'
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
			logl.trace('\tAdding "' .. modifier.name .. '" (' .. modifier.type .. " x" .. modifier.amount .. ")")
			table.insert(recipe.ingredients, modifier)
		end
	end
end

-- --- DEFER OPERATIONS ---

---@alias opcode string
---@type table<opcode, function<table>>
local defer_operations = {}

lib.add_defer_operation = function(opcode, operation)
	defer_operations[opcode] = operation
end

---@alias predicate function<boolean>
---@type table<string, table<predicate, opcode>>
local deferred = {}

---Collects prototypes to do an operation on and stores them, to be operated on later.
---@param category string
---@param predicate predicate
---@param opcode opcode
lib.defer = function(category, predicate, opcode)
	if not defer_operations[opcode] then
		error('no operation for opcode "' .. opcode .. '".')
		return
	end

	logl.debug('Deferring operation "' .. opcode .. '" on "' .. category .. '"...')

	if not deferred[category] then
		deferred[category] = {}
	end
	deferred[category][predicate] = opcode
end

lib.execute_deferred = function()
	for category, predicates in pairs(deferred) do
		logl.debug("Executing " .. table_size(predicates) .. ' deferred operations on "' .. category .. '"...')
		local total = 0

		for _, prototype in pairs(data.raw[category]) do
			for predicate, opcode in pairs(predicates) do
				if predicate(prototype) then
					logl.trace('\tExecuting deferred operation "' .. opcode .. '" on "' .. prototype.name .. '"...')
					defer_operations[opcode](prototype)
					total = total + 1
				end
			end
		end

		logl.debug("Executed " .. total .. " deferred operations!")
	end

	-- reset deferred
	deferred = {}
end

return lib
