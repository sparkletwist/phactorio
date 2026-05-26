if (not mods['IridescentIndustry']) then return end
local fds_recipe = require("__fdsl__.lib.recipe")

if (IRIDESCENT.air_purification) then
	local rf = data.raw.recipe["s6x-restore-used-pollution-filter"]
	rf.crafting_machine_tint.quaternary = {r = 0.92, g = 0.9, b = 0.8, a = 1.0}
	fds_recipe.modify_ingredient(rf, "sulfuric-acid", {type="item", name="ph-naoh", amount=2})
end

