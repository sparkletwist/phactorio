plastic_scrap = {type="item", name="plastic-bar", amount=1, probability = 0.25}
if (mods['scrap-industry'] and settings.startup["scrap-industry-plastic"].value) then
	plastic_scrap = {type="item", name="plastic-bits", amount=1, probability = 0.5}
end

if (mods['scrap-industry']) then
	data:extend({
		{
			type = "recipe",
			name = "s6x-circuit-scrap-melting",
			icon = "__pHactorio__/graphics/icons/circuit-scrap-melting.png",
			category = "chemistry",
			subgroup = "production-scrap",
			order = "z[other]-a[ph]-a[circuit-scrap-melting]",
			enabled = false,
			allow_productivity = true,
			auto_recycle = false,
			allow_decomposition = false,
			hide_from_signal_gui = false,
			hide_from_player_crafting = true,
			energy_required = 5,
			ingredients = {
				{type="item", name="circuit-scrap", amount=10},
				{type="fluid", name="ph-hcl", amount=10}
			},
			
			results = {
				{type="item", name="iron-scrap", amount_min=6, amount_max=10},	--8
				{type="item", name="copper-scrap", amount_min=8, amount_max=16}, --12
				plastic_scrap
			},
			
			main_product = "",
			
			crafting_machine_tint = {
				primary = {r=0.54, g=0.78, b=0.22, a=1.0},
				secondary = {r=0.15, g=0.65, b=0.12, a=1.0}, 
				tertiary = {r =0.6, g = 0.85, b = 0.3, a = 1.0},
				quaternary = {r=0.64, g=0.34, b=0.12, a=1.0},  
			}
		}
	})
	
	ScrapIndustry.recipes["s6x-circuit-scrap-melting"] = { ignore = true }
end

if (mods['space-age']) then
	data:extend({
		{
			type = "recipe",
			name = "s6x-fulgora-scrap-melting",
			icon = "__pHactorio__/graphics/icons/fulgora-scrap-melting.png",
			category = "chemistry",
			subgroup = (mods['scrap-industry'] and "production-scrap") or "fulgora-processes",
			order = "z[other]-a[ph]-b[fulgora-scrap-melting]",
			enabled = false,
			allow_productivity = true,
			auto_recycle = false,
			allow_decomposition = false,
			hide_from_signal_gui = false,
			hide_from_player_crafting = true,
			energy_required = 10,
			ingredients = {
				{type="item", name="scrap", amount=10},
				{type="fluid", name="ph-hno3", amount=10},
				{type="fluid", name="ph-hf", amount=10},
			},
			
			results = {
				{type="fluid", name="holmium-solution", amount=20},
				{type="fluid", name=(mods['scrap-chemistry'] and "fulgora-oil") or "heavy-oil", amount=50}, 
			},
			
			main_product = "holmium-solution",
			
			crafting_machine_tint = {
				primary = {r = 0.9, g = 0.21, b = 0.0, a = 1.0},
				secondary = {r = 0.4, g = 0.75, b = 0.684, a = 1.0},
				tertiary = {r =0.8, g = 0.5, b = 0.2, a = 1.0},
				quaternary = {r=0.9, g=0.35, b=0.74, a=1.0},  
			}
		}
	})
	
	if (mods['scrap-industry'] or mods['scrap-chemistry']) then
		ScrapIndustry.recipes["s6x-fulgora-scrap-melting"] = { ignore = true }
	end
end