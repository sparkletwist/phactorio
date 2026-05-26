if (not mods['crushing-industry']) then return end
if (not settings.startup["crushing-industry-glass"].value) then return end

local fds_recipe = require("__fdsl__.lib.recipe")

local simple_glass = util.table.deepcopy(data.raw.recipe["glass"])
simple_glass.name = "s6x-simple-glass"
simple_glass.main_product = "glass"
simple_glass.icon = nil
simple_glass.icons = {
	{icon=data.raw.item["sand"].icon, scale = 0.4, shift = {-12, -12}},
	{icon=data.raw.item["glass"].icon, draw_background = true }	
}
fds_recipe.modify_ingredient(simple_glass, "sand", {amount=4})
fds_recipe.modify_result(simple_glass, "glass", {amount=1})

local glass = data.raw.recipe["glass"]
glass.energy_required = 3.2
glass.ingredients = {
	{type="item", name="s6x-glass-batch", amount=1}
}
glass.results = {
	{type="item", name="glass", amount=1}
}

data:extend({
	simple_glass,
	
	{
		type = "item",
		name = "s6x-glass-batch",
		icon = "__pHactorio__/graphics/icons/glass-batch.png",
		subgroup = "raw-material",
		order = "a[smelting]-d[glass]-a[glass-batch]",
		stack_size = 50,
		weight = 5 * kg,
		random_tint_color = item_tints.bluish_science
	},
	
	{
		type = "recipe",
		name = "s6x-glass-batch",
		energy_required = 1,
		enabled = false,
		ingredients =
		{
			{type = "item", name = "sand", amount = 4},
			{type = "item", name = "ph-naoh", amount = 1}
		},
		results = {
			{type="item", name="s6x-glass-batch", amount=2}
		},
		always_show_products = true,
		show_amount_in_title = false,
		allow_productivity = true
	},	
	
})
