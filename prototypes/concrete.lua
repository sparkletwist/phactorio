local fds_recipe = require("__fdsl__.lib.recipe")

local concrete_recipe
if (mods['crushing-industry'] and settings.startup["crushing-industry-concrete-mix"].value) then
	concrete_recipe = data.raw.recipe["concrete-mix"]
	fds_recipe.replace_ingredient("concrete-mix", "iron-ore", "ph-cao")	
	fds_recipe.replace_ingredient("concrete-mix", "crushed-iron-ore", "ph-cao")
	if (mods['space-age']) then
		data.raw.recipe["concrete-mix-from-molten-iron"].hidden = true
	end
else
	concrete_recipe = data.raw.recipe["concrete"]
	fds_recipe.replace_ingredient("concrete", "iron-ore", "ph-cao")
	if (mods['crushing-industry']) then
		fds_recipe.replace_ingredient("concrete", "crushed-iron-ore", "ph-cao")
	end
	
	if (mods['space-age']) then
		data.raw.recipe["concrete-from-molten-iron"].hidden = true
	end
end
	
concrete_recipe.energy_required = concrete_recipe.energy_required * 2
for _,ing in pairs(concrete_recipe.ingredients) do
	if (ing.name ~= "ph-cao") then ing.amount = ing.amount * 2 end
end
for _,res in pairs(concrete_recipe.results) do
	res.amount = res.amount * 2
end

fds_recipe.replace_ingredient("refined-concrete", "steel-plate", {type="item", name="ph-naoh", amount=2})