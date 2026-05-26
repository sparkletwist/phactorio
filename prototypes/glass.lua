if (not mods['crushing-industry']) then return end
if (not settings.startup["crushing-industry-glass"].value) then return end

local fds_recipe = require("__fdsl__.lib.recipe")

local glass = data.raw.recipe["glass"]
local improved_glass = util.table.deepcopy(glass)

glass.main_product = "glass"
glass.icon = nil
fds_recipe.modify_ingredient(glass, "sand", {amount=4})
fds_recipe.modify_result(glass, "glass", {amount=1})
data:extend({glass})

improved_glass.name = "s6x-improved-glass"
improved_glass.main_product = "glass"
improved_glass.always_show_products = true
fds_recipe.modify_result(improved_glass, "glass", {amount=1})
improved_glass.custom_tooltip_fields = {
	{
		name = { "gui-bonus.productivity-bonus" },
		value = { "", "+20%" }
	}
}

if (PHACTORIO.kiln_smelting) then
	fds_recipe.modify_ingredient(improved_glass, "sand", {amount=4})
	fds_recipe.add_ingredient(improved_glass, {type="item", name="ph-naoh", amount=1})
	improved_glass.icons = {
		{icon=data.raw.item["ph-naoh"].icon, scale = 0.4, shift = {-12, -12}},
		{icon=data.raw.item["glass"].icon, draw_background = true }
	}
	improved_glass.always_show_products = true
else
	improved_glass.ingredients = {{type="item", name="s6x-glass-batch", amount=2}}
	improved_glass.icons = {
		{icon="__pHactorio__/graphics/icons/glass-batch.png", scale = 0.4, shift = {-12, -12}},
		{icon=data.raw.item["glass"].icon, draw_background = true }
	}
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
				{type = "item", name = "sand", amount = 4},
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
