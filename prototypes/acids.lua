data:extend({
	{
		type = "fluid",
		name = "ph-hcl",
		default_temperature = 25,
		max_temperature = 100,
		auto_barrel = true,
		base_color = { r = 0.50, g = 0.75, b = 0.30 },
		flow_color = { r = 0.48, g = 0.95, b = 0.28 },
		icon = "__pHactorio__/graphics/icons/fluid/ph-hcl.png",
		icon_size = 64,
		subgroup = "fluid",
		order = PHACTORIO.acid_order .. "-a[hcl]"
	},
	
	{
		type = "fluid",
		name = "ph-hno3",
		default_temperature = 25,
		max_temperature = 100,
		auto_barrel = true,
		base_color = { r = 0.84, g = 0.2, b = 0.0 },
		flow_color = { r = 0.82, g = 0.3, b = 0.57 },
		icon = "__pHactorio__/graphics/icons/fluid/ph-hno3.png",
		icon_size = 64,
		subgroup = "fluid",
		order = PHACTORIO.acid_order .. "-b[hno3]"
	},
				
	{
		type = "recipe",
		name = "ph-hno3",
		category = (mods['space-age'] and "chemistry-or-cryogenics") or "chemistry",
		subgroup = "fluid-recipes",
		order = PHACTORIO.recipe_order .. "-b[hno3]",
		enabled = false,
		auto_recycle = false,
			
		energy_required = 1,
		enabled = false,
		ingredients =
		{
			{type = "item", name = "copper-plate", amount = 1},
			{type = "fluid", name = "ammonia", amount = 50},
			{type = "fluid", name = "water", amount = 10}
		},
		results =
		{
			{type = "fluid", name = "ph-hno3", amount = 50}
		},
		
		allow_productivity = true,
		allow_quality = false,
		
		always_show_products = true,
		show_amount_in_title = false,
		crafting_machine_tint =
		{
			primary = {r = 0.94, g = 0.25, b = 0.06, a = 1.0},
			secondary = {r = 1.0, g = 0.6, b = 0.1, a = 1.0},
			tertiary = {r = 0.5, g = 0.5, b = 0.75, a = 1.0}, 
			quaternary = {r = 0.3, g = 0.3, b = 0.82, a = 1.0}
		}
	},
})

if (mods['space-age']) then
	data:extend({
		{
			type = "fluid",
			name = "ph-ch3cooh",
			default_temperature = 25,
			max_temperature = 100,
			auto_barrel = true,
			base_color = { r = 0.45, g = 0.25, b = 0.0 },
			flow_color = { r = 0.75, g = 0.68, b = 0.55 },
			icon = "__pHactorio__/graphics/icons/fluid/ph-ch3cooh.png",
			icon_size = 64,
			subgroup = "fluid",
			order = PHACTORIO.acid_order .. "-c[ch3cooh]"
		},
	
		{
			type = "fluid",
			name = "ph-hf",
			default_temperature = 25,
			max_temperature = 100,
			auto_barrel = true,
			base_color = {0.0, 0.28, 0.14},
			flow_color = {0.1, 0.7, 0.44},
			icon = "__pHactorio__/graphics/icons/fluid/ph-hf.png",
			icon_size = 64,
			subgroup = "fluid",
			order = PHACTORIO.acid_order .. "-d[hf]"
		},
		
		{
			type = "recipe",
			name = "ph-ch3cooh",
			category = "chemistry",
			additional_categories = { "organic" },
			subgroup = "fluid-recipes",
			order = PHACTORIO.recipe_order .. "-c[ch3cooh]",
			enabled = false,
			auto_recycle = false,
				
			energy_required = 10,
			enabled = false,
			ingredients =
			{
				{type = "item", name = "yumako-mash", amount = 5},
				{type = "item", name = "spoilage", amount = 2},
				{type = "fluid", name = "water", amount = 100},
			},
			
			results =
			{
				{type = "fluid", name = "ph-ch3cooh", amount = 50}
			},
			
			allow_productivity = true,
			allow_quality = false,
			
			always_show_products = true,
			show_amount_in_title = false,
			
			crafting_machine_tint = {
				primary = {r = 0.51, g = 0.28, b = 0.1 , a = 1.0},
				secondary = {r = 0.74, g = 0.64, b = 0.5, a = 1.0},
				tertiary = {r = 0.44, g = 0.5, b = 0.41, a = 1.0}, 
				quaternary = {r = 0.35, g = 0.2, b = 0.15, a = 1.0},
			}
		},
	
		{
			type = "recipe",
			name = "ph-hf",
			category = "cryogenics",
			subgroup = "fluid-recipes",
			order = PHACTORIO.recipe_order .. "-d[hf]",
			enabled = false,
			auto_recycle = false,
				
			energy_required = 2,
			enabled = false,
			ingredients =
			{
				{type = "fluid", name = "fluorine", amount = 50},
				{type = "fluid", name = "water", amount = 10},
				{type = "fluid", name = "sulfuric-acid", amount = 10}
			},
			
			results =
			{
				{type = "fluid", name = "ph-hf", amount = 50}
			},
			
			allow_productivity = true,
			allow_quality = false,
			
			always_show_products = true,
			show_amount_in_title = false,
			
			crafting_machine_tint = {
				primary = {r = 0.455, g = 0.837, b = 0.563, a = 1.0},
				secondary = {r = 0.398, g = 0.732, b = 0.681, a = 1.0},
				tertiary = {r = 0.44, g = 0.36, b = 0.12, a = 1.0}, 
				quaternary = {r = 0.4, g = 0.8, b = 0.66, a = 1.0},
			}
		},
	})
	
	if (mods['scrap-industry'] or mods['scrap-chemistry']) then
		ScrapIndustry.recipes["ph-hf"] = { ignore = true }
	end
end