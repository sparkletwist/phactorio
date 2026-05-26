local item_sounds = require("__base__.prototypes.item_sounds")

local iron_ore_ingredient = "iron-ore"
local iron_ore_prob = 0.05
if (mods['scrap-industry']) then
	iron_ore_ingredient = "iron-scrap"
	iron_ore_prob = 0.1
elseif (PHACTORIO.ore_crushing) then
	iron_ore_ingredient = "crushed-iron-ore"
	iron_ore_prob = 0.1
end 

if (not data.raw.item["salt"]) then
	data:extend({
		{
			type = "item",
			name = "salt",
			icon = "__pHactorio__/graphics/icons/salt.png",	
			subgroup = "raw-material",
			order = PHACTORIO.base_order .. "-x[salt]",
			inventory_move_sound = item_sounds.resource_inventory_move,
			pick_sound = item_sounds.resource_inventory_pickup,
			drop_sound = item_sounds.resource_inventory_move,
			stack_size = 50,
			weight = 1*kg,
			random_tint_color = item_tints.bluish_concrete
		},
	})
end

if (not data.raw.recipe["salt"]) then
	data:extend({
		{
			type = "recipe",
			name = "salt",
			category = "chemistry",
			enabled = false,
			auto_recycle = false,
			energy_required = 6,
			enabled = false,
			ingredients =
			{
				{type = "fluid", name = "water", amount = 600, ignored_by_stats = 300},
				{type = "item", name = PHACTORIO.stone_or_sand_ingredient, amount = 5 },
			},
			results =
			{
				{type = "item", name = "salt", amount = 5},
				{type = "fluid", name = "water", amount = 300, ignored_by_stats = 300, ignored_by_productivity = 300}
			},
			
			main_product = "salt",
			
			allow_productivity = true,
			allow_quality = true,
			
			always_show_products = true,
			show_amount_in_title = false,
			crafting_machine_tint =
			{
				primary = {r = 0.20, g = 0.5, b = 0.88, a = 1.0},
				secondary = {r = 0.88, g = 0.88, b = 0.9, a = 1.0},
				tertiary = {r = 0.8, g = 0.9, b = 0.9, a = 0.65}, 
				quaternary = {r = 0.91, g = 0.91, b = 0.91, a = 0.85}
			}
		},
	})
end

data:extend({
	{
		type = "recipe",
		name = "s6x-electrolysis-process",
		category = "ph-electrolysis",
		enabled = false,
		energy_required = 2,
		ingredients =
		{
			{type = "item", name = "salt", amount = 5},
			{type = "fluid", name = "water", amount = 100},
		},
		results = {
			{type = "item", name = "ph-naoh", amount = 5},
			{type = "fluid", name = "ph-hcl", amount = 50}
		},
		allow_productivity = true,
		main_product = "",
		icon = "__pHactorio__/graphics/icons/electrolysis-process.png",
		subgroup = "fluid-recipes",
		order = PHACTORIO.recipe_order .. "-a[electrolysis]-a[basic-electrolysis]",
		
		always_show_made_in = true,
		always_show_products = true,
		crafting_machine_tint = {
			primary = { r = 0.1, g = 0.7, b = 0.3, a = 0.2 },
		},
	},
}) 

if (mods['space-age']) then
	data:extend({
		{
			type = "recipe",
			name = "s6x-brine-electrolysis-process",
			category = "ph-electrolysis",
			enabled = false,
			energy_required = 2,
			ingredients =
			{
				{type = "fluid", name = "lithium-brine", amount = 50},
			},
			results = {
				{type = "item", name = "ph-naoh", amount = 5},
				{type = "item", name = iron_ore_ingredient, amount = 1, probability = iron_ore_prob},
				{type = "fluid", name = "ph-hcl", amount = 50}
			},
			allow_productivity = true,
			main_product = "",
			icon = "__pHactorio__/graphics/icons/brine-electrolysis-process.png",
			subgroup = "fluid-recipes",
			order = PHACTORIO.recipe_order .. "-a[electrolysis]-b[brine-electrolysis]",
			
			always_show_made_in = true,
			always_show_products = true,
			crafting_machine_tint = {
				primary = { r = 0.422, g = 0.6, b = 0.5, a = 0.25 },
			},
		},
	
		{
			type = "recipe",
			name = "s6x-vulcanus-electrolysis-process",
			category = "ph-electrolysis",
			enabled = false,
			energy_required = 2,
			
			ingredients = {
				{type = "fluid", name = "hot-brine", amount = 500},
			},
			
			results = {
				{type = "fluid", name = "steam", amount = 1000, temperature = 500},
				{type = "fluid", name = "sulfuric-acid", amount = 200},
				{type = "fluid", name = "ph-hcl", amount = 100},
				{type = "item", name = "ph-naoh", amount = 10},

			},
			allow_productivity = true,
			main_product = "",
			icon = "__pHactorio__/graphics/icons/vulcanus-electrolysis-process.png",
			subgroup = "fluid-recipes",
			order = PHACTORIO.recipe_order .. "-a[electrolysis]-c[vulcanus-electrolysis]",
			
			always_show_made_in = true,
			always_show_products = true,
			crafting_machine_tint = {
				primary = { r = 0.7, g = 0.75, b = 0.5, a = 0.3 },
			},
		},
		
		{
			type = "recipe",
			name = "s6x-fulgora-lightning-electrolysis-process",
			category = "ph-electrolysis",
			enabled = false,
			energy_required = 2,
			
			surface_conditions = {
				{ property = "magnetic-field", min = 99 }
			},
			vb_preserve_conditions = true,
			
			ingredients = {
				{type = "fluid", name = "water", amount = 10},
			},
			
			results = {
				{type = "fluid", name = "ph-hno3", amount = 10},

			},
			allow_productivity = true,
			main_product = "",
			icon = "__pHactorio__/graphics/icons/fulgora-lightning-electrolysis-process.png",
			subgroup = "fluid-recipes",
			order = PHACTORIO.recipe_order .. "-a[electrolysis]-d[fulgora-lightning-electrolysis]",
			
			always_show_made_in = true,
			always_show_products = true,
			crafting_machine_tint = {
				primary = { r = 0.6, g = 0.4, b = 0.8, a = 0.55 },
			},
		},
		
		{
			type = "recipe",
			name = "s6x-fulgora-holmium-electrolysis-process",
			category = "ph-electrolysis",
			enabled = false,
			energy_required = 2,
			
			ingredients = {
				{type = "fluid", name = "holmium-solution", amount = 50},
			},
			
			results = {
				{type = "fluid", name = "ph-hcl", amount = 20},
				{type = "item", name = "ph-naoh", amount = 2},
				{type = "item", name = "holmium-plate", amount = 1},

			},
			allow_productivity = true,
			main_product = "",
			icon = "__pHactorio__/graphics/icons/fulgora-holmium-electrolysis-process.png",
			subgroup = "fluid-recipes",
			order = PHACTORIO.recipe_order .. "-a[electrolysis]-e[fulgora-holmium-electrolysis]",
			
			always_show_made_in = true,
			always_show_products = true,
			crafting_machine_tint = {
				primary = { r = 0.8, g = 0.6, b = 0.67, a = 0.25 },
			},
		},
	})
end

if (mods['scrap-industry'] or mods['scrap-chemistry']) then
	ScrapIndustry.categories["ph-electrolysis"] = { ignore=true }
end

