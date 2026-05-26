if (not data.raw.item["steel-plate"].weight) then
	data.raw.item["steel-plate"].weight = 2.5*kg
end

data:extend({
	{
		type = "item",
		name = "s6x-pickled-iron",
		icon = "__pHactorio__/graphics/icons/pickled.png",
		subgroup = "raw-material",
		order = "a[smelting]-c[steel-plate]-a[ph]-a[pickled-iron]",
		inventory_move_sound = data.raw.item["steel-plate"].inventory_move_sound,
		pick_sound = data.raw.item["steel-plate"].pick_sound,
		drop_sound = data.raw.item["steel-plate"].drop_sound,
		stack_size = data.raw.item["steel-plate"].stack_size,
		weight = data.raw.item["steel-plate"].weight,
		random_tint_color = item_tints.yellowing_coal
	},
	
	{
		type = "recipe",
		name = "s6x-pickled-iron",
		category = "chemistry",
		energy_required = 4,
		enabled = false,
		ingredients =
		{
			{type = "item", name = "iron-plate", amount = 5},
			{type = "fluid", name = "ph-hcl", amount = 5},
		},
		results = {{type="item", name="s6x-pickled-iron", amount=5}},
		crafting_machine_tint =
		{
			primary = {r = 0.63, g = 0.76, b = 0.52, a = 1.0},
			secondary = {r = 0.94, g = 0.98, b = 0.96, a = 1.0},
			tertiary = {r = 0.6, g = 0.85, b = 0.3, a = 1.0},
			quaternary = {r = 0.56, g = 0.58, b = 0.54, a = 1.0},
		},
		allow_productivity = true,
		always_show_products = true
	},
	
	{
		type = "recipe",
		name = "s6x-steel-plate-from-pickled",
		category = "smelting",
		enabled = false,
		energy_required = 8,
		ingredients = {{type = "item", name = "s6x-pickled-iron", amount = 5}},
		results = {{type="item", name="steel-plate", amount=1}},
		allow_productivity = true,
		allow_decomposition = false,
		main_product = "steel-plate",
		icons = {
			{icon="__pHactorio__/graphics/icons/pickled.png", shift={-12,-12}, scale=0.4},
			{icon="__base__/graphics/icons/steel-plate.png", draw_background=true},
		},

		custom_tooltip_fields = {
			{
				name = { "gui-bonus.productivity-bonus" },
				value = { "", "+20%" }
			}
		}
		
	},
})

if (mods['scrap-industry']) then
	ScrapIndustry.recipes["s6x-pickled-iron"] = { fake_ingredients = {{type="item", name = "steel-plate", amount = 1}} }
end

if (mods['space-age']) then
	table.insert(data.raw.technology["steel-plate-productivity"].effects, {type="change-recipe-productivity", recipe="s6x-steel-plate-from-pickled", change=0.1})
end