if (not mods['Bluetonium']) then return end
if (not PHACTORIO.thorium229) then return end

local fds_recipe = require("__fdsl__.lib.recipe")

fds_recipe.replace_ingredient("thorium-electronics", "sulfuric-acid", "ph-hno3")
