local item_sounds = require("__base__.prototypes.item_sounds")

local calcium_oxide_recipe = "ph-cao"
if (mods['space-age']) then
	calcium_oxide_recipe = "calcite"
end

if (mods['space-age']) then
	data.raw.fluid["ammonia"].auto_barrel = true
	
	data:extend({
		{
			type = "recipe",
			name = "ph-cao",
			category = "smelting",
			auto_recycle = false,
			energy_required = 3.2,
			ingredients = {{type = "item", name = "calcite", amount = 1}},
			results = {{type="item", name="ph-cao", amount=1}},
			allow_productivity = true,
			enabled = false
		},
	})
	
else
	data:extend({
		{
			type = "fluid",
			name = "ammonia",
			subgroup = "fluid",
			icon = "__pHactorio__/graphics/icons/fluid/ammonia.png",
			order = "b[new]-a[ph]-a[ammonia]",
			default_temperature = 0,
			max_temperature = 0,
			heat_capacity = "0.2kJ",
			base_color = {r = 0.2, g = 0.2, b = 0.65},
			flow_color = {r = 0.0, g = 0.0, b = 0.8},
			auto_barrel = true
		},
	})
end

data:extend({
	{
		type = "item",
		name = "ph-naoh",
		icon = "__pHactorio__/graphics/icons/ph-naoh.png",
		pictures = {
			{filename="__pHactorio__/graphics/icons/ph-naoh.png", size=64, scale=0.5},
			{filename="__pHactorio__/graphics/icons/variation/ph-naoh-1.png", size=64, scale=0.5},
			{filename="__pHactorio__/graphics/icons/variation/ph-naoh-2.png", size=64, scale=0.5},
		},		
		subgroup = "raw-material",
		order = PHACTORIO.base_order .. "-a[naoh]",
		inventory_move_sound = item_sounds.sulfur_inventory_move,
		pick_sound = item_sounds.resource_inventory_pickup,
		drop_sound = item_sounds.sulfur_inventory_move,
		stack_size = 50,
		weight = 1*kg
	},
	
	{
		type = "item",
		name = "ph-cao",
		icon = "__pHactorio__/graphics/icons/ph-cao.png",
		pictures = {
			{filename="__pHactorio__/graphics/icons/ph-cao.png", size=64, scale=0.5},
			{filename="__pHactorio__/graphics/icons/variation/ph-cao-1.png", size=64, scale=0.5},
			{filename="__pHactorio__/graphics/icons/variation/ph-cao-2.png", size=64, scale=0.5},
		},		
		subgroup = "raw-material",
		order = PHACTORIO.base_order .. "-b[cao]",
		inventory_move_sound = item_sounds.resource_inventory_move,
		pick_sound = item_sounds.resource_inventory_pickup,
		drop_sound = item_sounds.resource_inventory_move,
		stack_size = 50,
		weight = 2*kg
	},
	
	{
		type = "recipe",
		name = calcium_oxide_recipe,	
		enabled = false,
		auto_recycle = false,
		energy_required = 1 + ((mods['space-age'] and 0) or 4),
		category = (mods['space-age'] and "chemistry-or-cryogenics") or "chemistry",
		ingredients =
		{
			{type = "fluid", name = "water", amount = 20},
			{type = "item", name = "stone", amount = 2},
			{type = "item", name = "coal", amount = 2},			
		},
		results =
		{
			{type = "item", name = calcium_oxide_recipe, amount = 1},
		},
		auto_recycle = false,
		allow_productivity = true,
		allow_quality = true,
		always_show_made_in = true,
		crafting_machine_tint =
		{
			primary = {r = 0.72, g = 0.72, b = 0.7, a = 1.000},
			secondary = {r = 0.94, g = 0.96, b = 0.78, a = 1.000},
			tertiary = {r = 0.82, g = 0.64, b = 0.38, a = 0.85},
			quaternary = {r = 0.32, g = 0.32, b = 0.3, a = 1.000},
		}
	},
	
	{
		type = "recipe",
		name = "ammonia",
		category = (mods['space-age'] and "chemistry-or-cryogenics") or "chemistry",
		subgroup = "fluid-recipes",
		order = PHACTORIO.recipe_order .. "-c[ammonia]",
		enabled = false,
		auto_recycle = false,
		energy_required = 1,
		ingredients =
		{
			{type = "fluid", name = "water", amount = 100},
			{type = "fluid", name = "petroleum-gas", amount = 20}
		},
		results =
		{
			{type = "fluid", name = "ammonia", amount = 50},
		},
		allow_productivity = true,
		allow_quality = false,
		always_show_made_in = true,
		always_show_products = true,			
		crafting_machine_tint =
		{
			primary = {r = 0.12, g = 0.2, b = 0.625, a = 1.000},
			secondary = {r = 0.62, g = 0.75, b = 1.0, a = 1.000},
			tertiary = {r = 0.774, g = 0.735, b = 0.766, a = 1.000},
			quaternary = {r = 0.564, g = 0.364, b = 0.564, a = 1.000},
		},
		
		surface_conditions = (mods['space-age'] and {
			{ property = "pressure", min = 800 }	
		}) or nil,
	},
})

if (mods['scrap-chemistry']) then
	data:extend({
		{
			type = "recipe",
			name = "s6x-ammonia-from-methane",
			icons = {
				{icon=data.raw.fluid["methane"].icon, shift={-12,-12}, scale=0.4},
				{icon=data.raw.fluid["ammonia"].icon, draw_background=true},
			},	
			category = (mods['space-age'] and "chemistry-or-cryogenics") or "chemistry",
			subgroup = "fluid-recipes",
			order = PHACTORIO.recipe_order .. "-c[ammonia]-a[methane]",
			enabled = false,
			auto_recycle = false,
			energy_required = 1,
			ingredients =
			{
				{type = "fluid", name = "water", amount = 100},
				{type = "fluid", name = "methane", amount = 30}
			},
			results =
			{
				{type = "fluid", name = "ammonia", amount = 50},
			},
			allow_productivity = true,
			allow_quality = false,
			always_show_made_in = true,
			always_show_products = true,			
			crafting_machine_tint =
			{
				primary = {r = 0.12, g = 0.25, b = 0.68, a = 1.000},
				secondary = {r = 0.62, g = 0.76, b = 1.0, a = 1.000},
				tertiary = {r = 0.75, g = 0.75, b = 0.83, a = 1.000},
				quaternary = {r = 0.4, g = 0.4, b = 0.8, a = 1.000},
			},
			
			surface_conditions = data.raw.recipe["ammonia"].surface_conditions
		},
	})
end