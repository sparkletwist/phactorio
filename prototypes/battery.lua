local fds_recipe = require("__fdsl__.lib.recipe")

if (not data.raw.item["battery"].weight) then
	data.raw.item["battery"].weight = 2.5*kg
end

local carbon_ingredient, recycling_carbon_ingredient
if (mods['space-age'] or mods['Voidcraft']) then
	carbon_ingredient = {type = "item", name = "carbon", amount = 1}
	recycling_carbon_ingredient = {type = "item", name = "carbon", amount = 1, probability = 0.25, show_details_in_recipe_tooltip = false}
else
	carbon_ingredient = {type = "item", name = PHACTORIO.coal_ingredient, amount = 2}
	recycling_carbon_ingredient = {type = "item", name = PHACTORIO.coal_ingredient, amount = 1, probability = 0.5, show_details_in_recipe_tooltip = false}
end

local alk_acc = util.table.deepcopy(data.raw.recipe["accumulator"])
alk_acc.name = "s6x-alkaline-accumulator"
alk_acc.order = data.raw.item["accumulator"].order .. "-a[ph]-a[alkaline-accumulator]"
alk_acc.main_product = "accumulator"
alk_acc.icons = {
	{ icon = data.raw.item["accumulator"].icon },
	{ icon = "__pHactorio__/graphics/icons/alkaline-battery.png", icon_size = 64, scale = 0.25, shift = {-8, -8} }
}
alk_acc.allow_decomposition = false
alk_acc.auto_recycle = false
fds_recipe.replace_ingredient(alk_acc, "battery", {type="item", name="alkaline-battery", amount=3})

local alk_robot = util.table.deepcopy(data.raw.recipe["flying-robot-frame"])
alk_robot.name = "s6x-alkaline-robot-frame"
alk_robot.order = data.raw.item["flying-robot-frame"].order .. "-a[ph]-a[alkaline-robot-frame]"
alk_robot.main_product = "flying-robot-frame"
alk_robot.icons = {
	{ icon = data.raw.item["flying-robot-frame"].icon },
	{ icon = "__pHactorio__/graphics/icons/alkaline-battery.png", icon_size = 64, scale = 0.25, shift = {-8, -8} }
}
alk_robot.allow_decomposition = false
alk_robot.auto_recycle = false
fds_recipe.replace_ingredient(alk_robot, "battery", {type="item", name="alkaline-battery", amount=1})

data:extend({
	alk_acc, alk_robot,
	
	{
		type = "recipe",
		name = "alkaline-battery",
		category = (mods['space-age'] and "chemistry-or-cryogenics") or "chemistry",
		energy_required = 4,
		enabled = false,
		ingredients =
		{
			{type = "fluid", name = "light-oil", amount = 20},
			{type = "item", name = "iron-plate", amount = 1},
			carbon_ingredient,
			{type = "item", name = "ph-naoh", amount = 1}
		},
		results = {{type="item", name="alkaline-battery", amount=1}},
		crafting_machine_tint =
		{
			primary = {r = 0.78, g = 0.66, b = 0.52, a = 1.000},
			secondary = {r = 0.831, g = 0.560, b = 0.222, a = 1.000},
			tertiary = {r = 0.895, g = 0.773, b = 0.596, a = 1.000},
			quaternary = {r = 0.56, g = 0.58, b = 0.54, a = 1.000},
		},
		allow_productivity = true
	},	
	
	{
		type = "item",
		name = "alkaline-battery",
		icon = "__pHactorio__/graphics/icons/alkaline-battery.png",
		subgroup = "raw-material",
		order = "b[chemistry]-d[battery]-a[ph]-a[alkaline-battery]",
		inventory_move_sound = data.raw.item["battery"].inventory_move_sound,
		pick_sound = data.raw.item["battery"].pick_sound,
		drop_sound = data.raw.item["battery"].drop_sound,
		stack_size = 200,
		weight = data.raw.item["battery"].weight
	},
})

if (mods["quality"]) then
	data:extend({
		{
			type = "recipe",
			name = "alkaline-battery-recycling",
			localised_name = {"recipe-name.recycling", {"item-name.alkaline-battery"}},
			icons = {
			  {
				icon = "__quality__/graphics/icons/recycling.png"
			  },
			  {
				icon = "__pHactorio__/graphics/icons/alkaline-battery.png",
				scale = 0.4
			  },
			  {
				icon = "__quality__/graphics/icons/recycling-top.png"
			  }
			},
			subgroup = "other",
			category = "recycling",
			hidden = true,
			enabled = true,
			unlock_results = false,
			auto_recycle = false,
			allow_decomposition = false,
			energy_required = 0.25,
			ingredients = {{type = "item", name = "alkaline-battery", amount = 1}},
			results =
			{
			  {type = "item", name = "iron-plate", amount = 1, probability = 0.25, show_details_in_recipe_tooltip = false},
			  recycling_carbon_ingredient,
			  {type = "item", name = "ph-naoh", amount = 1, probability = 0.25, show_details_in_recipe_tooltip = false},
			}
		},
	})
end

data.raw.item["battery-mk2-equipment"].icon = "__pHactorio__/graphics/icons/battery-mk2-equipment.png"
data.raw["battery-equipment"]["battery-mk2-equipment"].sprite.filename = "__pHactorio__/graphics/equipment/battery-mk2-equipment.png"

fds_recipe.replace_ingredient("battery-mk2-equipment", "battery-equipment", {type="item", name="alkaline-battery", amount=30})
fds_recipe.add_ingredient("battery-mk2-equipment", {type="item", name="steel-plate", amount=20})

fds_recipe.replace_ingredient("personal-roboport-equipment", "battery", {type="item", name="alkaline-battery", amount=30})

if (mods['space-age']) then
	data.raw.item["battery-mk3-equipment"].icon = "__pHactorio__/graphics/icons/battery-mk3-equipment.png"
	data.raw["battery-equipment"]["battery-mk3-equipment"].sprite.filename = "__pHactorio__/graphics/equipment/battery-mk3-equipment.png"

	fds_recipe.replace_ingredient("battery-mk3-equipment", "battery-mk2-equipment", {type="item", name="lithium-battery", amount=100})
	fds_recipe.add_ingredient("battery-mk3-equipment", {type="item", name="steel-plate", amount=200})
	fds_recipe.add_ingredient("battery-mk3-equipment", {type="item", name="processing-unit", amount=50})

	data:extend({
		{
			type = "recipe",
			name = "lithium-battery",
			category = "chemistry-or-cryogenics",
			energy_required = 8,
			enabled = false,
			ingredients =
			{
				{type = "fluid", name = "electrolyte", amount = 10},
				{type = "fluid", name = "ph-hf", amount = 10},
				{type = "item", name = "copper-plate", amount = 1},
				{type = "item", name = "plastic-bar", amount = 1},
				{type = "item", name = "superconductor", amount = 1},
				{type = "item", name = "lithium", amount = 2}
			},
			results = {{type="item", name="lithium-battery", amount=1}},
			crafting_machine_tint =
			{
				primary = {r = 0.82, g = 0.05, b = 0.22, a = 1.000},
				secondary = {r = 0.455, g = 0.837, b = 0.563, a = 1.0},
				tertiary = {r = 0.77, g = 0.32, b = 0.15, a = 1.0},
				quaternary = {r = 0.6, g = 0.52, b = 0.56, a = 1.0},
			},
			allow_productivity = true
		},	
		
		{
			type = "item",
			name = "lithium-battery",
			icon = "__pHactorio__/graphics/icons/lithium-battery.png",
			subgroup = "raw-material",
			order = "b[chemistry]-d[battery]-a[ph]-b[lithium-battery]",
			inventory_move_sound = data.raw.item["battery"].inventory_move_sound,
			pick_sound = data.raw.item["battery"].pick_sound,
			drop_sound = data.raw.item["battery"].drop_sound,
			stack_size = 100,
			weight = data.raw.item["battery"].weight*2
		},	
	
		{
			type = "recipe",
			name = "lithium-battery-recycling",
			localised_name = {"recipe-name.recycling", {"item-name.lithium-battery"}},
			icons = {
			  {
				icon = "__quality__/graphics/icons/recycling.png"
			  },
			  {
				icon = "__pHactorio__/graphics/icons/lithium-battery.png",
				scale = 0.4
			  },
			  {
				icon = "__quality__/graphics/icons/recycling-top.png"
			  }
			},
			subgroup = "other",
			category = "recycling",
			hidden = true,
			enabled = true,
			unlock_results = false,
			auto_recycle = false,
			allow_decomposition = false,
			energy_required = 0.5,
			ingredients = {{type = "item", name = "lithium-battery", amount = 1}},
			results =
			{
				{type = "item", name = "copper-plate", amount = 1, probability = 0.25, show_details_in_recipe_tooltip = false},				
				{type = "item", name = "low-density-structure", amount = 1, probability = 0.25, show_details_in_recipe_tooltip = false},
				{type = "item", name = "superconductor", amount = 1, probability = 0.25, show_details_in_recipe_tooltip = false},
				{type = "item", name = "lithium", amount = 1, probability = 0.5, show_details_in_recipe_tooltip = false},
			}
		},
	})


end