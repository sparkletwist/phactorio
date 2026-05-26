if (not mods['space-age']) then return end

local fds_recipe = require("__fdsl__.lib.recipe")

local fruits = { "yumako", "jellynut" }
local fruit_product = { "yumako-mash", "jelly" }
for i,name in pairs(fruits) do
	local p = util.table.deepcopy(data.raw.capsule[name])
	local pickled_name =  name .. "-pickled"
	p.name = pickled_name
	p.icon = "__pHactorio__/graphics/icons/" .. pickled_name .. ".png"
	p.pictures = {
		{ size = 64, filename = p.icon, scale = 0.5 },
		{ size = 64, filename = "__pHactorio__/graphics/icons/variation/" .. pickled_name .. "-1.png", scale = 0.5 },
		{ size = 64, filename = "__pHactorio__/graphics/icons/variation/" .. pickled_name .. "-2.png", scale = 0.5 },
		{ size = 64, filename = "__pHactorio__/graphics/icons/variation/" .. pickled_name .. "-3.png", scale = 0.5 },	
	}
	p.order = "c[pickled]-a[ph]-" .. p.order
	p.spoil_ticks = p.spoil_ticks * 100
	
	local pickle_rec = {
		type = "recipe",
		name = pickled_name,
		category = "organic",
		additional_categories = { "chemistry" },
		subgroup = "agriculture-processes",
		order = "a[seeds]-z[pickled]-a[pickling]-" .. p.order,
		enabled = false,
		allow_productivity = false,
		allow_quality = true,
		maximum_productivity = 0,
		energy_required = 10,
		ingredients = {
			{type = "item", name = name, amount = 10},
			{type = "item", name = "salt", amount = 1},
			{type = "fluid", name = "ph-ch3cooh", amount = 10},
			{type = "fluid", name = "water", amount = 50},
		},
		results = {
			{type = "item", name = pickled_name, amount = 10}
		},
		crafting_machine_tint =
		{
			primary = {r = 0.58, g = 0.36, b = 0.15 , a = 1.0},
			secondary = {r = 0.78, g = 0.66, b = 0.52, a = 1.0},
			tertiary = {r = 0.72, g = 0.74, b = 0.7, a = 0.55}, 
			quaternary = {r = 0.77, g = 0.77, b = 0.77, a = 0.65},
		}	
	}
	
	local rec = util.table.deepcopy(data.raw.recipe[name .. "-processing"])
	rec.name = "s6x-" .. rec.name .. "-pickled"
	rec.main_product = fruit_product[i]
	
	rec.icons = {
		{icon=p.icon, shift={-12,-12}, scale=0.4},
		{icon=data.raw.capsule[fruit_product[i]].icon, draw_background=true},		
	}
	rec.icon = nil
	
	fds_recipe.replace_ingredient(rec, name, pickled_name)
	fds_recipe.remove_result(rec, name .. "-seed")
	
	rec.order = "a[seeds]-z[pickled]-b[processing]-" .. rec.order
	
	data:extend({
		p, pickle_rec, rec,
	})
end

local fresh_p3 = util.table.deepcopy(data.raw.recipe["productivity-module-3"])
fresh_p3.name = "s6x-productivity-module-3-fresh"
fresh_p3.localised_name = {"recipe-name.s6x-recipe-live", { "item-name.productivity-module-3" }}
fresh_p3.icons = {
	{icon="__space-age__/graphics/icons/biter-egg.png", scale = 0.4, shift = {-12, -12}},
	{icon=data.raw.module["productivity-module-3"].icon, draw_background = true }	
}

fds_recipe.replace_ingredient("productivity-module-3", "biter-egg", "biter-egg-preserved")
fds_recipe.replace_ingredient("overgrowth-yumako-soil", "biter-egg", "biter-egg-preserved")
fds_recipe.replace_ingredient("overgrowth-jellynut-soil", "biter-egg", "biter-egg-preserved")

data:extend({
	fresh_p3,
	
	{
		type = "item",
		name = "biter-egg-preserved",
		icon = "__pHactorio__/graphics/icons/biter-egg-preserved.png",
		pictures =
		{
		  { size = 64, filename = "__pHactorio__/graphics/icons/biter-egg-preserved.png", scale = 0.5, mipmap_count = 4 },
		  { size = 64, filename = "__pHactorio__/graphics/icons/variation/biter-egg-preserved-1.png", scale = 0.5, mipmap_count = 4 },
		  { size = 64, filename = "__pHactorio__/graphics/icons/variation/biter-egg-preserved-2.png", scale = 0.5, mipmap_count = 4 },
		  { size = 64, filename = "__pHactorio__/graphics/icons/variation/biter-egg-preserved-3.png", scale = 0.5, mipmap_count = 4 },
		},
		
		fuel_category = "chemical",
		fuel_value = "6MJ",
		subgroup = "agriculture-products",
		order = "c[eggs]-a[biter-egg]-a[ph]-a[preserved]",
		
		inventory_move_sound = data.raw.item["biter-egg"].inventory_move_sound,
		pick_sound = data.raw.item["biter-egg"].pick_sound,
		drop_sound = data.raw.item["biter-egg"].drop_sound,
		stack_size = data.raw.item["biter-egg"].stack_size,
		weight = data.raw.item["biter-egg"].weight,
	},
	
	{
		type = "recipe",
		name = "biter-egg-preserved",
		category = "organic",
		additional_categories = { "chemistry" },
		subgroup = "agriculture-processes",
		order = "c[eggs]-a[biter-egg]-a[ph]-a[preserved]",
		enabled = false,
		allow_productivity = false,
		allow_quality = true,
		maximum_productivity = 0,
		energy_required = 10,
		ingredients = {
			{type = "item", name = "biter-egg", amount = 5},
			{type = "item", name = "salt", amount = 1},
			{type = "item", name = "ph-cao", amount = 1},
			{type = "fluid", name = "ph-ch3cooh", amount = 10},
		},
		results = {
			{type = "item", name = "biter-egg-preserved", amount = 5}
		},
		crafting_machine_tint =
		{
			primary = {r = 0.56, g = 0.4, b = 0.18 , a = 1.0},
			secondary = {r = 0.76, g = 0.68, b = 0.5, a = 1.0},
			tertiary = {r = 0.82, g = 0.66, b = 0.24, a = 0.65}, 
			quaternary = {r = 0.87, g = 0.87, b = 0.8, a = 1.0},
		}	
	}
})