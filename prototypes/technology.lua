local fds_technology = require("__fdsl__.lib.technology")

local planet_discovery = require("planet-discovery-common")

data:extend({
	{
		type = "technology",
		name = "s6x-electrolysis",
		icon = "__pHactorio__/graphics/technology/electrolysis.png",
		icon_size = 256,
		prerequisites = {"oil-processing"},
		effects =
		{
			{ type = "unlock-recipe", recipe = "salt" },
			{ type = "unlock-recipe", recipe = "s6x-electrolysis-plant" },
			{ type = "unlock-recipe", recipe = "s6x-electrolysis-process" },
		},
		unit =
		{
			count = 50,
			ingredients = {{"automation-science-pack", 1}, {"logistic-science-pack", 1}},
			time = 30
		}
	},
	
	{
		type = "technology",
		name = "s6x-nitric-acid",
		icon = "__pHactorio__/graphics/technology/nitric-acid.png",
		icon_size = 256,
		prerequisites = {"oil-processing"},
		effects =
		{
			{ type = "unlock-recipe", recipe = "ammonia" },
			{ type = "unlock-recipe", recipe = "ph-hno3" },
		},
		unit =
		{
			count = 50,
			ingredients = {{"automation-science-pack", 1}, {"logistic-science-pack", 1}},
			time = 30
		}
	},

	{
		type = "technology",
		name = "s6x-hydrodesulfurization",
		icon = "__pHactorio__/graphics/technology/hydrodesulfurization.png",
		icon_size = 256,
		prerequisites = {"s6x-electrolysis"},
		effects =
		{
			{ type = "unlock-recipe", recipe = "s6x-naoh-basic-oil-processing" },
		},
		unit =
		{
			count = 50,
			ingredients = {{"automation-science-pack", 1}, {"logistic-science-pack", 1}},
			time = 30
		}
	},
	
	{
		type = "technology",
		name = "s6x-hydrodesulfurization-adv",
		icon = "__pHactorio__/graphics/technology/hydrodesulfurization-adv.png",
		icon_size = 256,
		prerequisites = {"s6x-hydrodesulfurization", "advanced-oil-processing"},
		effects =
		{
			{ type = "unlock-recipe", recipe = "s6x-naoh-advanced-oil-processing" },
		},
		unit =
		{
			count = 50,
			ingredients = {{"automation-science-pack", 1}, {"logistic-science-pack", 1}, {"chemical-science-pack", 1}},
			time = 30
		}
	},
	
	{
		type = "technology",
		name = "s6x-steel-acid-treatment",
		icon = "__pHactorio__/graphics/technology/steel-acid-treatment.png",
		icon_size = 256,
		prerequisites = {"s6x-electrolysis"},
		effects =
		{
			{ type = "unlock-recipe", recipe = "s6x-pickled-iron" },
			{ type = "unlock-recipe", recipe = "s6x-steel-plate-from-pickled" },
			{ type = "change-recipe-productivity", recipe = "s6x-steel-plate-from-pickled", change=0.2, hidden=true}
		},
		unit =
		{
			count = 100,
			ingredients = {{"automation-science-pack", 1}, {"logistic-science-pack", 1}},
			time = 30
		}
	},

	{
		type = "technology",
		name = "s6x-alkaline-battery",
		icon = "__pHactorio__/graphics/technology/alkaline-battery.png",
		icon_size = 256,
		prerequisites = {"s6x-electrolysis", "advanced-oil-processing", "battery"},
		effects =
		{
			{ type = "unlock-recipe", recipe = "alkaline-battery" },
		},
		unit =
		{
			count = 100,
			ingredients = {{"automation-science-pack", 1}, {"logistic-science-pack", 1}, {"chemical-science-pack", 1}},
			time = 30
		}
	},

	{
		type = "technology",
		name = "s6x-alkaline-accumulators",
		icon = "__pHactorio__/graphics/technology/alkaline-accumulators.png",
		icon_size = 256,
		prerequisites = {"s6x-alkaline-battery", "electric-energy-accumulators"},
		effects =
		{
			{ type = "unlock-recipe", recipe = "s6x-alkaline-accumulator" },
		},
		unit =
		{
			count = 50,
			ingredients = {{"automation-science-pack", 1}, {"logistic-science-pack", 1}, {"chemical-science-pack", 1}},
			time = 30
		}
	},

	{
		type = "technology",
		name = "s6x-alkaline-robotics",
		icon = "__pHactorio__/graphics/technology/alkaline-robotics.png",
		icon_size = 256,
		prerequisites = {"s6x-alkaline-battery", "robotics"},
		effects =
		{
			{ type = "unlock-recipe", recipe = "s6x-alkaline-robot-frame" },
		},
		unit =
		{
			count = 50,
			ingredients = {{"automation-science-pack", 1}, {"logistic-science-pack", 1}, {"chemical-science-pack", 1}},
			time = 30
		}
	},
})

if (mods['space-age']) then
	data:extend({
		{
			type = "technology",
			name = "s6x-asteroid-melting",
			icon = "__pHactorio__/graphics/technology/asteroid-melting.png",
			icon_size = 256,
			prerequisites = {"space-science-pack"},
			effects = {
				{
					type = "unlock-recipe",
					recipe = "s6x-metallic-asteroid-melting"
				},
				{
					type = "unlock-recipe",
					recipe = "s6x-carbonic-asteroid-melting"
				},
				{
					type = "unlock-recipe",
					recipe = "s6x-oxide-asteroid-melting"
				},
	
				{
					type = "unlock-recipe",
					recipe = "s6x-brine-electrolysis-process"
				},		  
			},
			unit =
			{
				count = 100,
				ingredients = {{"automation-science-pack", 1}, {"logistic-science-pack", 1}, {"chemical-science-pack", 1}, {"space-science-pack", 1}},
				time = 60
			}
		},
		
		{
			type = "technology",
			name = "s6x-nitrate-nutrients",
			icon = "__pHactorio__/graphics/technology/nitrate-nutrients.png",
			icon_size = 256,
			prerequisites = {"agricultural-science-pack", "s6x-nitric-acid"},
			effects = {
				{
					type = "unlock-recipe",
					recipe = "s6x-nitrate-nutrients"
				},	  
			},
			unit = {
				ingredients =
				{
					{"automation-science-pack", 1},
					{"logistic-science-pack", 1},
					{"chemical-science-pack", 1},
					{"space-science-pack", 1},
					{"agricultural-science-pack", 1}
				},
				time = 60,
				count = 500
			}
		},
		
		{
			type = "technology",
			name = "s6x-gleba-pickling",
			icon = "__pHactorio__/graphics/technology/gleba-pickling.png",
			icon_size = 256,
			prerequisites = {"agricultural-science-pack"},
			effects = {
				{
					type = "unlock-recipe",
					recipe = "yumako-pickled"
				},
				{
					type = "unlock-recipe",
					recipe = "jellynut-pickled"
				},
				{
					type = "unlock-recipe",
					recipe = "s6x-yumako-processing-pickled"
				},	
				{
					type = "unlock-recipe",
					recipe = "s6x-jellynut-processing-pickled"
				},				
			},
			unit = {
				ingredients =
				{
					{"automation-science-pack", 1},
					{"logistic-science-pack", 1},
					{"chemical-science-pack", 1},
					{"space-science-pack", 1},
					{"agricultural-science-pack", 1}
				},
				time = 60,
				count = 500
			}
		},
		
		{
			type = "technology",
			name = "s6x-egg-preservation",
			icon = "__pHactorio__/graphics/technology/egg-preservation.png",
			icon_size = 256,
			prerequisites = {"biter-egg-handling"},
			effects = {
				{
					type = "unlock-recipe",
					recipe = "biter-egg-preserved"
				},			
			},
			unit = {
				ingredients =
				{
					{"automation-science-pack", 1},
					{"logistic-science-pack", 1},
					{"chemical-science-pack", 1},
					{"space-science-pack", 1},
					{"agricultural-science-pack", 1}
				},
				time = 60,
				count = 100
			}
		},
		
		{
			type = "technology",
			name = "s6x-fulgora-scrap-melting",
			icon = "__pHactorio__/graphics/technology/fulgora-scrap-melting.png",
			icon_size = 256,
			prerequisites = {"cryogenic-science-pack"},
			effects = {
				{
					type = "unlock-recipe",
					recipe = "s6x-fulgora-scrap-melting"
				},	  
			},
			unit = {
				ingredients = {
					{"automation-science-pack", 1},
					{"logistic-science-pack", 1},
					{"chemical-science-pack", 1},
					{"production-science-pack", 1},
					{"utility-science-pack", 1},
					{"space-science-pack", 1},
					{"electromagnetic-science-pack", 1},
					{"cryogenic-science-pack", 1}
				},
				time = 60,
				count = 1000
			}
		},
		
		{
			type = "technology",
			name = "s6x-processing-unit-hf",
			icon = "__pHactorio__/graphics/technology/processing-unit-hf.png",
			icon_size = 256,
			prerequisites = {"cryogenic-science-pack"},
			effects = {
				{
					type = "unlock-recipe",
					recipe = "s6x-processing-unit-hf"
				},
				
				{
					hidden = true,
					type = "change-recipe-productivity",
					recipe = "s6x-processing-unit-hf",
					change = 0.2
				}				
			},
			unit = {
				ingredients = {
					{"automation-science-pack", 1},
					{"logistic-science-pack", 1},
					{"chemical-science-pack", 1},
					{"production-science-pack", 1},
					{"utility-science-pack", 1},
					{"space-science-pack", 1},
					{"electromagnetic-science-pack", 1},
					{"cryogenic-science-pack", 1}
				},
				time = 60,
				count = 200
			}
		},
		
	})
	
	local battery3 = data.raw.technology["battery-mk3-equipment"]
	battery3.icons = util.technology_icon_constant_equipment("__pHactorio__/graphics/technology/battery-mk3-equipment.png")
	fds_technology.add_prereq(battery3, "cryogenic-science-pack")
	table.insert(battery3.unit.ingredients, {"cryogenic-science-pack", 1}) 
	battery3.unit.count = 200
	table.insert(battery3.effects, 1, { type = "unlock-recipe", recipe = "lithium-battery" })

	if (not mods['scrap-chemistry'] and not mods['Voidcraft']) then
		fds_technology.add_unlock("sulfur-processing", "carbon")
	end
	
	fds_technology.add_prereq("advanced-asteroid-processing", "s6x-asteroid-melting")
	
	fds_technology.add_prereq("overgrowth-soil", "s6x-egg-preservation")
	fds_technology.add_prereq("productivity-module-3", "s6x-egg-preservation")
	table.insert(data.raw.technology["productivity-module-3"].effects, { type = "unlock-recipe", recipe = "s6x-productivity-module-3-fresh" })
	
	table.insert(data.raw.technology["bioflux-processing"].effects, 4, { type = "unlock-recipe", recipe = "s6x-bioammonia" })
	table.insert(data.raw.technology["cryogenic-plant"].effects, 2, { type = "unlock-recipe", recipe = "ph-hf" })
	
	table.insert(data.raw.technology["biochamber"].effects, { type = "unlock-recipe", recipe = "ph-ch3cooh" })
	
	table.insert(data.raw.technology[planet_discovery.fulgora].effects, { type = "unlock-recipe", recipe = "s6x-fulgora-lightning-electrolysis-process" })
	table.insert(data.raw.technology["holmium-processing"].effects, { type = "unlock-recipe", recipe = "s6x-fulgora-holmium-electrolysis-process" })
	
	fds_technology.replace_unlock("calcite-processing", "acid-neutralisation", "s6x-vulcanus-electrolysis-process")
	table.insert(data.raw.technology["calcite-processing"].effects, { type = "unlock-recipe", recipe = "s6x-simple-coal-liquefaction-hcl" })
end

if (mods['scrap-industry']) then
	data:extend({
		{
			type = "technology",
			name = "s6x-circuit-scrap-melting",
			icon = "__pHactorio__/graphics/technology/circuit-scrap-melting.png",
			icon_size = 256,
			prerequisites = {"chemical-science-pack"},
			effects = {
				{
					type = "unlock-recipe",
					recipe = "s6x-circuit-scrap-melting"
				},	  
			},
			unit = {
				ingredients =
				{
					{"automation-science-pack", 1},
					{"logistic-science-pack", 1},
					{"chemical-science-pack", 1},
				},
				time = 30,
				count = 100
			}
		},
	})
end

if (mods['crushing-industry'] and settings.startup["crushing-industry-glass"].value) then
	data:extend({
		{
			type = "technology",
			name = "s6x-glass-improved",
			icon = "__pHactorio__/graphics/technology/glass-improved.png",
			icon_size = 256,
			prerequisites = {"s6x-electrolysis"},
			effects = {
				{ type = "unlock-recipe", recipe = "s6x-glass-batch" },
				{ type = "unlock-recipe", recipe = "s6x-improved-glass" },
				{ type = "change-recipe-productivity", recipe = "s6x-improved-glass", change=0.2, hidden=true}

			},
			unit = {
				ingredients =
				{
					{"automation-science-pack", 1},
					{"logistic-science-pack", 1},
				},
				time = 30,
				count = 50
			}
		},
	})

	fds_technology.add_prereq("rocket-silo", "s6x-glass-improved")

	if (PHACTORIO.kiln_smelting) then
		fds_technology.remove_unlock("s6x-glass-improved", "s6x-glass-batch")
	end
end

fds_technology.add_prereq("plastics", "s6x-electrolysis")

fds_technology.add_prereq("rocket-fuel", "s6x-nitric-acid")
fds_technology.add_prereq("explosives", "s6x-nitric-acid")

fds_technology.add_prereq("battery-mk2-equipment", "s6x-alkaline-battery")
data.raw.technology["battery-mk2-equipment"].icons = util.technology_icon_constant_equipment("__pHactorio__/graphics/technology/battery-mk2-equipment.png")

fds_technology.add_prereq("personal-roboport-equipment", "s6x-alkaline-battery")

fds_technology.add_prereq("concrete", "s6x-electrolysis")
table.insert(data.raw.technology["concrete"].effects, 1, { type = "unlock-recipe", recipe = "ph-cao" })
if (mods['space-age']) then
	table.insert(data.raw.technology["concrete"].effects, 1, { type = "unlock-recipe", recipe = "calcite" })
end

if (mods['crushing-industry'] and settings.startup["crushing-industry-concrete-mix"].value) then
	if (mods['space-age']) then
		fds_technology.remove_unlock("foundry", "concrete-mix-from-molten-iron")
	end
elseif (mods['space-age']) then
	fds_technology.remove_unlock("foundry", "concrete-from-molten-iron")
end

if (mods['scrap-chemistry']) then
	fds_technology.add_prereq("s6x-hydrodesulfurization", "sulfur-processing")
	table.insert(data.raw.technology["s6x-nitric-acid"].effects, 2, { type = "unlock-recipe", recipe = "s6x-ammonia-from-methane" })
	table.insert(data.raw.technology["s6x-nitric-acid"].effects, { type = "unlock-recipe", recipe = "s6x-nitrate-waste-recovery" })
end

local plasu = data.raw.technology["plastics"].unit
if (plasu and plasu.count) then
	plasu.count = plasu.count - 50
	if (plasu.count < 50) then plasu.count = 50 end
end

if (PHACTORIO.thorium229) then
	fds_technology.add_prereq("s6x-thorium-electronics", "s6x-nitric-acid")
end

if (PHACTORIO.kiln_smelting) then
	local steel_acid_technology = fds_technology.find("s6x-steel-acid-treatment")
	fds_technology.add_cost_ingredient(steel_acid_technology, "chemical-science-pack")
	fds_technology.add_prereq(steel_acid_technology, "advanced-material-processing-2")
	fds_technology.remove_unlock(steel_acid_technology, "s6x-pickled-iron")
end

if (mods['Voidcraft']) then
	data:extend({
		VOIDCRAFT.std_voidtech("acid-base", "s6x-electrolysis", 100, nil, { prefix = "__pHactorio__" }),
		VOIDCRAFT.std_voidtech("ammonia-hno3", "s6x-nitric-acid", 100, nil, { prefix = "__pHactorio__" })
	})
	
	table.insert(data.raw.technology["s6x-void-concrete"].effects, 1, { type = "unlock-recipe", recipe = "s6xvc-ph-cao" })	
	
	if (mods['space-age']) then
		if (data.raw.technology["s6x-void-gleba"]) then
			table.insert(data.raw.technology["s6x-void-gleba"].effects, { type = "unlock-recipe", recipe = "s6xvc-ph-ch3cooh" })
		end
		if (data.raw.technology["s6x-void-aquilo"]) then
			table.insert(data.raw.technology["s6x-void-aquilo"].effects, 4, { type = "unlock-recipe", recipe = "s6xvc-ph-hf" })
		end
	end
end