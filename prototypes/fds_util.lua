local fds_recipe = require("__fdsl__.lib.recipe")

PHACTORIO.add_or_replace_ingredient = function(recipe, old_ingredient, new_ingredient, allow_combine)
	if (fds_recipe.get_ingredient(recipe, old_ingredient)) then
		fds_recipe.replace_ingredient(recipe, old_ingredient, new_ingredient, allow_combine)
	else
		fds_recipe.add_ingredient(recipe, new_ingredient, allow_combine)
	end
end