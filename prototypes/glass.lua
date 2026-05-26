if (not mods['crushing-industry']) then return end
if (not settings.startup["crushing-industry-glass"].value) then return end

local old_simple = settings.startup["s6x-ph-restore-simple-glass"].value

local fds_recipe = require("__fdsl__.lib.recipe")

local simple_glass = data.raw.recipe["glass"]
local improved_glass = util.table.deepcopy(data.raw.recipe["glass"])

local sand_amount = 5

if (old_simple) then
	simple_glass.name = "s6x-simple-glass"
	simple_glass.main_product = "glass"
	simple_glass.icon = nil
	simple_glass.icons = {
		{icon=data.raw.item["sand"].icon, scale = 0.4, shift = {-12, -12}},
		{icon=data.raw.item["glass"].icon, draw_background = true }	
	}
end
simple_glass.energy_required = 6.4
fds_recipe.modify_ingredient(simple_glass, "sand", {amount=4})
fds_recipe.modify_result(simple_glass, "glass", {amount=1})
data:extend({simple_glass})

if (old_simple) then
	improved_glass.name = "glass"
else
	improved_glass.name = "s6x-improved-glass"
	improved_glass.main_product = "glass"
end
improved_glass.always_show_products = true
fds_recipe.modify_result(improved_glass, "glass", {amount=1})
improved_glass.custom_tooltip_fields = {
	{
		name = { "gui-bonus.productivity-bonus" },
		value = { "", "+20%" }
	}
}

if (PHACTORIO.kiln_smelting and not old_simple) then
	fds_recipe.modify_ingredient(improved_glass, "sand", {amount=sand_amount})
	fds_recipe.add_ingredient(improved_glass, {type="item", name="ph-naoh", amount=1})
	fds_recipe.modify_result(improved_glass, "glass", {amount=2})
	improved_glass.icons = {
		{icon=data.raw.item["ph-naoh"].icon, scale = 0.4, shift = {-12, -12}},
		{icon=data.raw.item["glass"].icon, draw_background = true }
	}
	improved_glass.always_show_products = true
else
	improved_glass.energy_required = 3.2
	improved_glass.ingredients = {{type="item", name="s6x-glass-batch", amount=1}}
	
	if (not old_simple) then
		improved_glass.icons = {
			{icon="__pHactorio__/graphics/icons/glass-batch.png", scale = 0.4, shift = {-12, -12}},
			{icon=data.raw.item["glass"].icon, draw_background = true }
		}
	end
	data:extend({
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
				{type = "item", name = "sand", amount = sand_amount},
				{type = "item", name = "ph-naoh", amount = 1}
			},
			results = {
				{type="item", name="s6x-glass-batch", amount=2}
			},
			always_show_products = true,
			show_amount_in_title = false,
			allow_productivity = true
		}
	})
end

data:extend({improved_glass})
