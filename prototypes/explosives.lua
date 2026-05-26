local fds_recipe = require("__fdsl__.lib.recipe")

fds_recipe.remove_ingredient("explosives", "water")
if (mods['scrap-chemistry']) then
	fds_recipe.remove_ingredient("explosives", "methane")
end

fds_recipe.add_ingredient("explosives", {type="fluid", name="ph-hno3", amount=5})
fds_recipe.add_ingredient("explosives", {type="fluid", name="ammonia", amount=5})

if (mods['space-age']) then
	fds_recipe.replace_ingredient("artillery-shell", "calcite", "ph-cao")
	fds_recipe.replace_ingredient("cliff-explosives", "calcite", {type="item", name="ph-cao", amount=5})
end