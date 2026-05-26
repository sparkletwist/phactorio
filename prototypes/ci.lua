if (not mods['crushing-industry']) then return end
local fds_recipe = require("__fdsl__.lib.recipe")

if (settings.startup["crushing-industry-coal"].value) then
	fds_recipe.modify_ingredient("carbon", "crushed-coal", {amount=2})
end

