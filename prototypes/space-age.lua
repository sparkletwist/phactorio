if (not mods['space-age']) then return end

PHACTORIO.lava_melting_recipes = {"molten-iron-from-lava", "molten-copper-from-lava"}

local fds_recipe = require("__fdsl__.lib.recipe")

local metallic_result = "lithium-brine"
local carbonic_result = "petroleum-gas"
local oxide_result = "ammonia"

if (mods['scrap-chemistry']) then
	carbonic_result = "methane"
end

data.raw.fluid["lithium-brine"].auto_barrel = true
data.raw.fluid["electrolyte"].auto_barrel = true

fds_recipe.replace_ingredient("fluoroketone", "fluorine", "ph-hf")
fds_recipe.remove_ingredient("fluoroketone", "solid-fuel")
if (mods['scrap-chemistry']) then
	fds_recipe.add_ingredient("fluoroketone", {type="fluid", name="ph-hcl", amount=50})
end

local lithium = data.raw.recipe["lithium"]
fds_recipe.replace_ingredient(lithium, "holmium-plate", {type="item", name="ph-naoh", amount=5})
fds_recipe.add_result(lithium, {type="fluid", name="water", amount=10})
lithium.main_product = "lithium"

fds_recipe.modify_ingredient("quantum-processor", "fluoroketone-cold", {amount=5})
fds_recipe.add_ingredient("quantum-processor", {type="fluid", name="ph-hf", amount=5})

fds_recipe.modify_ingredient("cryogenic-science-pack", "fluoroketone-cold", {amount=3})
fds_recipe.add_ingredient("cryogenic-science-pack", {type="fluid", name="ph-hf", amount=3})

local adv_fuel = data.raw.recipe["advanced-thruster-fuel"]
local adv_oxy = data.raw.recipe["advanced-thruster-oxidizer"]

fds_recipe.replace_ingredient(adv_fuel, "carbon", {type="fluid", name=carbonic_result, amount=20})
fds_recipe.replace_ingredient(adv_fuel, "calcite", {type="item", name="ph-naoh", amount=2})
fds_recipe.replace_ingredient(adv_fuel, "water", {type="fluid", name="ammonia", amount=50})
adv_fuel.icon = "__pHactorio__/graphics/icons/advanced-thruster-fuel.png"
if (mods['scrap-chemistry']) then
	adv_fuel.icon = "__pHactorio__/graphics/icons/advanced-thruster-fuel-methane.png"
end

local iron_ore_ingredient = "iron-ore"
if (PHACTORIO.ore_crushing) then iron_ore_ingredient = "crushed-iron-ore" end
fds_recipe.replace_ingredient(adv_oxy, iron_ore_ingredient, {type="fluid", name="ph-hcl", amount=20})
fds_recipe.replace_ingredient(adv_oxy, "water", {type="fluid", name="ph-hno3", amount=50})
fds_recipe.remove_ingredient(adv_oxy, "calcite")
adv_oxy.icon = "__pHactorio__/graphics/icons/advanced-thruster-oxidizer.png"

-- Gleba changes
fds_recipe.add_ingredient("bioflux", {type="item", name="ph-cao", amount=1})

fds_recipe.modify_ingredient("carbon-fiber", "yumako-mash", {amount=8})
fds_recipe.add_ingredient("carbon-fiber", {type="fluid", name="ph-ch3cooh", amount=20})

-- Vulcanus changes
local geyser = data.raw.resource["sulfuric-acid-geyser"]
if (geyser) then
	geyser.localised_name = {"entity-name.s6x-hot-brine-geyser"}
	if (geyser.minable) then
		for _,result in pairs(geyser.minable.results or {}) do
			if (result.name == "sulfuric-acid") then
				result.name = "hot-brine"
			end
		end
	end
	if (geyser.stateless_visualisation) then
		geyser.stateless_visualisation[1].animation.tint = util.multiply_color({r=0.86, g=0.88, b=0.7}, 0.3)
		geyser.stateless_visualisation[2].animation.tint = util.multiply_color({r=0.88, g=1.0, b=0.1}, 0.6)
	end
end
fds_recipe.modify_ingredient("foundry", "refined-concrete", {amount=10})
fds_recipe.add_ingredient("foundry", {type="item", name="ph-cao", amount=10})

for _,name in pairs(PHACTORIO.lava_melting_recipes) do
	fds_recipe.replace_ingredient(name, "calcite", "ph-cao")
	fds_recipe.add_ingredient(name, {type="item", name="ph-naoh", amount=1})
end

data.raw.recipe["acid-neutralisation"].hidden = true
data.raw.recipe["acid-neutralisation"].enabled = false

fds_recipe.add_ingredient("tungsten-plate", {type="fluid", name="ph-hcl", amount=2})

local scl = data.raw.recipe["simple-coal-liquefaction"]
scl.icons = {
	{icon = scl.icon},
	{icon = "__base__/graphics/icons/fluid/sulfuric-acid.png", icon_size = 64, scale = 0.25, shift = {-8, -8} }
}
scl.icon = nil
scl.localised_name = { "recipe-name.s6x-recipe-h2so4", { "recipe-name.simple-coal-liquefaction" } }
fds_recipe.replace_ingredient(scl, "calcite", "ph-cao")

local sclhcl = util.table.deepcopy(scl)
sclhcl.name = "s6x-simple-coal-liquefaction-hcl"
sclhcl.localised_name = { "recipe-name.s6x-recipe-hcl", { "recipe-name.simple-coal-liquefaction" } }
sclhcl.icons[2].icon = "__pHactorio__/graphics/icons/fluid/ph-hcl.png"
sclhcl.order = scl.order .. "-a[ph]-a[hcl]"
fds_recipe.replace_ingredient(sclhcl, "sulfuric-acid", "ph-hcl")

if (mods['scrap-industry'] or mods['scrap-chemistry']) then
	ScrapIndustry.recipes["s6x-simple-coal-liquefaction-hcl"] = { ignore = true }
end

data:extend({
	sclhcl,
	
	{
		type = "fluid",
		name = "hot-brine",
		default_temperature = 500,
		max_temperature = 500,
		auto_barrel = false,
		base_color = { r = 0.75, g = 0.78, b = 0.4 },
		flow_color = { r = 0.85, g = 0.9, b = 0.66 },
		icon = "__pHactorio__/graphics/icons/fluid/hot-brine.png",
		icon_size = 64,
		subgroup = "fluid",
		order = data.raw.fluid["lava"].order .. "-a[ph]-z[hot-brine]"
	},
	
	{
		type = "recipe",
		name = "s6x-metallic-asteroid-melting",
		icons = {
			{icon="__space-age__/graphics/icons/metallic-asteroid-chunk.png", shift={-12,-12}, scale=0.4},
			{icon=data.raw.fluid[metallic_result].icon, draw_background=true},
		},
		category = "chemistry",
		subgroup="space-crushing",
		order = "a[ph]-a[asteroid-melting]-a[metallic]",
		auto_recycle = false,
		enabled = false,
		ingredients =
		{
			{type = "item", name = "metallic-asteroid-chunk", amount = 1}
		},
		energy_required = 5,
		results =
		{
			{type = "fluid", name = metallic_result, amount = 50},
		},
		main_product = metallic_result,
		allow_productivity = true,
		allow_decomposition = false,
		always_show_products = true,
		show_amount_in_title = false,
		
		crafting_machine_tint = {
			primary = {r = 0.82, g = 0.88, b = 0.82, a = 1.0},
			secondary = {r = 0.25, g = 0.42, b = 0.3, a = 1.0},
			tertiary = {r = 0.35, g = 0.5, b = 0.8, a = 0.68},
			quaternary = {r = 0.4, g = 0.4, b = 0.42, a = 0.8},
		}
	},

	{
		type = "recipe",
		name = "s6x-carbonic-asteroid-melting",
		icons = {
			{icon="__space-age__/graphics/icons/carbonic-asteroid-chunk.png", shift={-12,-12}, scale=0.4},
			{icon=data.raw.fluid[carbonic_result].icon, draw_background=true},
		},
		category = "chemistry",
		subgroup="space-crushing",
		order = "a[ph]-a[asteroid-melting]-b[carbonic]",
		auto_recycle = false,
		enabled = false,
		ingredients =
		{
			{type = "item", name = "carbonic-asteroid-chunk", amount = 1}
		},
		energy_required = 5,
		results =
		{
			{type = "fluid", name = carbonic_result, amount = 50},
		},
		main_product = carbonic_result,
		allow_productivity = true,
		allow_decomposition = false,
		always_show_products = true,
		show_amount_in_title = false,

		crafting_machine_tint = {
			primary = (mods["scrap-chemistry"] and {r = 0.5, g = 0.52, b = 0.96, a = 1.0}) or {r = 0.764, g = 0.596, b = 0.780, a = 1.0},
			secondary = {r = 0.2, g = 0.2, b = 0.2, a = 1.0},
			tertiary = {r = 0.1, g = 0.12, b = 0.0, a = 0.68},
			quaternary = {r = 0.36, g = 0.38, b = 0.1, a = 0.8},
		}
	},
	
	{
		type = "recipe",
		name = "s6x-oxide-asteroid-melting",
		icons = {
			{icon="__space-age__/graphics/icons/oxide-asteroid-chunk.png", shift={-12,-12}, scale=0.4},
			{icon=data.raw.fluid[oxide_result].icon, draw_background=true},
		},
		category = "chemistry",
		subgroup="space-crushing",
		order = "a[ph]-a[asteroid-melting]-c[oxide]",
		auto_recycle = false,
		enabled = false,
		ingredients =
		{
			{type = "item", name = "oxide-asteroid-chunk", amount = 1}
		},
		energy_required = 5,
		results =
		{
			{type = "fluid", name = oxide_result, amount = 50},
		},
		main_product = oxide_result,
		allow_productivity = true,
		allow_decomposition = false,
		always_show_products = true,
		show_amount_in_title = false,
		
		crafting_machine_tint = {
			primary = {r = 0.12, g = 0.22, b = 0.65, a = 1.0},
			secondary = {r = 0.7, g = 0.7, b = 0.78, a = 1.0},
			tertiary = {r = 0.5, g = 0.52, b = 0.56, a = 0.68},
			quaternary = {r = 0.5, g = 0.8, b = 0.8, a = 0.8},
		}
	},
	
	{
		type = "recipe",
		name = "s6x-bioammonia",
		icon = "__pHactorio__/graphics/icons/bioammonia.png",
		category = "organic",
		subgroup = "agriculture-products",
		order = "a[organic-products]-d[biosulfur]-a[ph]-a[bioammonia]",
		auto_recycle = false,
		enabled = false,
		allow_productivity = true,
		energy_required = 2,
		main_product = "ammonia",
		ingredients =
		{
		  {type = "item", name = "spoilage", amount = 2},
		  {type = "item", name = "bioflux", amount = 1},
		  {type = "fluid", name = "water", amount = 50},		  
		},
		results = {{type="fluid", name="ammonia", amount=50}},
		crafting_machine_tint =
		{
		  primary = {r = 0, g = 0.25, b = 1, a = 1.000},
		  secondary = {r = 0.693, g = 0.449, b = 0.0, a = 1.000},
		}
	},
	
	{
		type = "recipe",
		name = "s6x-nitrate-nutrients",
		icon = "__pHactorio__/graphics/icons/nitrate-nutrients.png",
		category = "organic",
		additional_categories = { "chemistry" },
		subgroup = "agriculture-products",
		order = "c[nutrients]-f[new]-a[ph]-a[nitrate-nutrients]",
		auto_recycle = false,
		enabled = false,
		allow_productivity = true,
		energy_required = 4,
		ingredients = {
			{type = "fluid", name = "ammonia", amount = 50},
			{type = "fluid", name = "ph-hno3", amount = 50},
		},
		
		results = {{type="item", name="nutrients", amount = 20}},
		crafting_machine_tint =
		{
			primary = {r = 0.8, g = 0.9, b = 1, a = 1.000},
			secondary = {r = 0.9, g = 0.56, b = 0.5, a = 1.000},
			tertiary = {r = 0.6, g = 0.5, b = 0.75, a = 1.0}, 
			quaternary = {r = 0.76, g = 0.4, b = 0.4, a = 1.0}
		}
	},
})

local blue = util.table.deepcopy(data.raw.recipe["processing-unit"])
blue.name = "s6x-processing-unit-hf"
blue.icons = {
	{icon = data.raw.item["processing-unit"].icon},
	{icon = data.raw.fluid["ph-hf"].icon, icon_size = 64, scale = 0.25, shift = {-8, -8} }
}
blue.subgroup = "aquilo-processes"
blue.order = "x[misc]-a[ph]-a[processing-unit-hf]"
blue.main_product = "processing-unit"
blue.allow_decomposition = false
blue.auto_recycle = false
blue.energy_required = 8
blue.custom_tooltip_fields = {
	{
		name = { "gui-bonus.productivity-bonus" },
		value = { "", "+20%" }
	}
}
fds_recipe.replace_ingredient(blue, "sulfuric-acid", "ph-hf")

data:extend({blue})
if (mods['space-age']) then
	table.insert(data.raw.technology["processing-unit-productivity"].effects, {
		type = "change-recipe-productivity",
		recipe = "s6x-processing-unit-hf",
		change = 0.1
	})
end