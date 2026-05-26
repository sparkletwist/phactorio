if (mods['scrap-chemistry']) then
	if (mods['space-age']) then
		ScrapIndustry.products["calcite"] = {priority=1}
		ScrapIndustry.items["ph-cao"] = {scrap="calcite", scale=ScrapIndustry.FLAVOR, failrate=0.01}
		for _,name in pairs(PHACTORIO.lava_melting_recipes) do
			ScrapIndustry.recipes[name] = { ignore = true }
		end
	end
	
	ScrapIndustry.products["salt"] = {priority=1}
	ScrapIndustry.items["ph-naoh"] = {scrap="salt", scale=ScrapIndustry.CHEAP, failrate=0.01}
	ScrapIndustry.items["ph-hcl"] = {scrap="salt", scale=ScrapIndustry.CHEAP, failrate=0.01}
	
	ScrapIndustry.products["ph-naoh"] = {priority=2}
	ScrapIndustry.items["alkaline-battery"] = {scrap="ph-naoh", scale=ScrapIndustry.CHEAP, failrate=0.02}
	ScrapIndustry.items["battery-mk2-equipment"] = {scrap="ph-naoh", scale=ScrapIndustry.PRODUCT, failrate=0.01}
	
	ScrapIndustry.products["nitrate-waste"] = {priority=5, type="fluid"}
	ScrapIndustry.items["ammonia"] = {scrap="nitrate-waste", scale=ScrapIndustry.CHEAP, failrate=0.01}
	ScrapIndustry.items["ph-hno3"] = {scrap="nitrate-waste", scale=ScrapIndustry.CHEAP, failrate=0.01}
	
	data:extend({
		{
			type = "fluid",
			name = "nitrate-waste",
			default_temperature = 25,
			auto_barrel = true,
			base_color = { r = 0.5, g = 0.38, b = 0.3 },
			flow_color = { r = 0.74, g = 0.72, b = 0.7 },
			icon = "__pHactorio__/graphics/icons/fluid/nitrate-waste.png",
			icon_size = 64,
			subgroup = "fluid",
			order = PHACTORIO.acid_order .. "-z[nitrate-waste]"
		},
		
		{
			type = "recipe",
			name = "s6x-nitrate-waste-recovery",
			category = (mods['space-age'] and "chemistry-or-cryogenics") or "chemistry",
			subgroup = "fluid-recipes",
			order = PHACTORIO.recipe_order .. "-c[ammonia]-b[from-nitrate-waste]",
			enabled = false,
			auto_recycle = false,
				
			energy_required = 1,
			enabled = false,
			ingredients =
			{
				{type = "fluid", name = "nitrate-waste", amount = 50},
			},
			results =
			{
				{type = "fluid", name = "ammonia", amount = 20},
			},
			
			allow_decomposition = false,
			main_product = "ammonia",
			icons = {
				{icon="__pHactorio__/graphics/icons/fluid/nitrate-waste.png", shift={-12,-12}, scale=0.4},
				{icon=data.raw.fluid["ammonia"].icon, draw_background=true},
			},	
			
			allow_productivity = true,
			allow_quality = false,
			
			always_show_products = true,
			show_amount_in_title = false,
			crafting_machine_tint =
			{
				primary = {r = 0.16, g = 0.21, b = 0.625, a = 1.000},
				secondary = {r = 0.72, g = 0.75, b = 0.88, a = 1.000},
				tertiary = {r = 0.6, g = 0.45, b = 0.36, a = 1.000},
				quaternary = {r = 0.56, g = 0.45, b = 0.56, a = 1.000},
			}
		},
	})
end

if (mods['scrap-chemistry'] or mods['scrap-industry']) then
	ScrapIndustry.recipes["s6x-naoh-basic-oil-processing"] = { ignore = true }
	ScrapIndustry.recipes["s6x-naoh-advanced-oil-processing"] = { ignore = true }
	
	if (mods['space-age']) then
		ScrapIndustry.recipes["advanced-thruster-fuel"] = { ignore = true }
		ScrapIndustry.recipes["advanced-thruster-oxidizer"] = { ignore = true }
		
		ScrapIndustry.recipes["lithium"] = { ignore = true }
		ScrapIndustry.recipes["fluoroketone"] = { ignore = true }
		ScrapIndustry.recipes["ice-platform"] = { ignore = true }
		ScrapIndustry.recipes["solid-fuel-from-ammonia"] = { ignore = true }
	end
end