if (not mods['IridescentIndustry']) then return end
local fds_recipe = require("__fdsl__.lib.recipe")

if (IRIDESCENT.air_purification) then
	local rf = data.raw.recipe["s6x-restore-used-pollution-filter"]
	rf.crafting_machine_tint.quaternary = {r = 0.92, g = 0.9, b = 0.8, a = 1.0}
	fds_recipe.modify_ingredient(rf, "sulfuric-acid", {type="item", name="ph-naoh", amount=2})
end

if (IRIDESCENT.azoth_enabled) then
	local clean = util.table.deepcopy(data.raw.recipe["s6x-clean-azoth"])
	
	clean.icon = "__pHactorio__/graphics/icons/fluid/azoth-clean-acid.png"
	clean.name = "s6x-clean-azoth-acid"
	clean.order = clean.order .. "-a[ph]-a[acid]"
	
	clean.energy_required = math.floor(clean.energy_required/2)
	
	fds_recipe.modify_ingredient(clean, "water", {type="fluid", name="ph-hno3", amount=10})
	
	data:extend({clean})
end

