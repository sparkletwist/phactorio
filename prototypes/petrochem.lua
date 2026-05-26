local fds_recipe = require("__fdsl__.lib.recipe")

-- Plastic with HCl
fds_recipe.replace_ingredient("plastic-bar", PHACTORIO.coal_ingredient, {type="fluid", name="ph-hcl", amount=10})
data.raw.recipe["plastic-bar"].crafting_machine_tint.quaternary = {r = 0.6, g = 0.8, b = 0.5, a = 1.0}
if (mods['scrap-chemistry']) then
	if (data.raw.recipe["plastic-bar-from-butane"]) then
		PHACTORIO.add_or_replace_ingredient("plastic-bar-from-butane", PHACTORIO.coal_ingredient, {type="fluid", name="ph-hcl", amount=10})
		data.raw.recipe["plastic-bar-from-butane"].crafting_machine_tint.quaternary = {r = 0.65, g = 0.8, b = 0.5, a = 1.0}
	end
end

-- Oil processing with NaOH
local naoh_processing = util.table.deepcopy(data.raw.recipe["basic-oil-processing"])
naoh_processing.name = "s6x-naoh-basic-oil-processing"
naoh_processing.order = naoh_processing.order .. "-a[ph]-a[naoh]"

fds_recipe.add_ingredient(naoh_processing, {type="fluid", name="water", amount=10, fluidbox_index = 1}, true)
fds_recipe.add_ingredient(naoh_processing, {type="item", name="ph-naoh", amount=3}, true)

if (mods['scrap-chemistry']) then
	naoh_processing.icon = "__pHactorio__/graphics/icons/naoh-basic-oil-processing-remix.png"
	
	local _,heavy_oil = fds_recipe.get_result(naoh_processing, "heavy-oil")
	if (heavy_oil) then
		if (heavy_oil.amount) then
			heavy_oil.amount = heavy_oil.amount + 10
		elseif (heavy_oil.amount_min) then
			heavy_oil.amount_min = heavy_oil.amount_min + 8
			heavy_oil.amount_max = heavy_oil.amount_max + 12			
		end
	end
	
	fds_recipe.replace_result(naoh_processing, "sour-gas", "methane")
	fds_recipe.replace_result(naoh_processing, "tar", {type="item", name="sulfur", amount=1, probability=0.15})
else	
	naoh_processing.icon = "__pHactorio__/graphics/icons/naoh-basic-oil-processing.png"
	fds_recipe.modify_result(naoh_processing, "petroleum-gas", {amount=60})
end

--

local naoh_adv_processing = util.table.deepcopy(data.raw.recipe["advanced-oil-processing"])
naoh_adv_processing.name = "s6x-naoh-advanced-oil-processing"
naoh_adv_processing.order = naoh_adv_processing.order .. "-a[ph]-a[naoh]"

fds_recipe.modify_ingredient(naoh_adv_processing, "water", {amount=60})
fds_recipe.add_ingredient(naoh_adv_processing, {type="item", name="ph-naoh", amount=5}, true)

local _,heavy_oil = fds_recipe.get_result(naoh_adv_processing, "heavy-oil")
if (heavy_oil) then
	if (heavy_oil.amount) then
		heavy_oil.amount = heavy_oil.amount + 5
	elseif (heavy_oil.amount_min) then
		heavy_oil.amount_min = heavy_oil.amount_min + 4
		heavy_oil.amount_max = heavy_oil.amount_max + 6			
	end
end

if (mods['scrap-chemistry']) then
	naoh_adv_processing.icon = "__pHactorio__/graphics/icons/naoh-advanced-oil-processing-remix.png"
	
	fds_recipe.replace_result(naoh_adv_processing, "sour-gas", "methane")
	fds_recipe.replace_result(naoh_adv_processing, "tar", {type="item", name="sulfur", amount=1, probability=0.2})
else
	naoh_adv_processing.icon = "__pHactorio__/graphics/icons/naoh-advanced-oil-processing.png"
	fds_recipe.modify_result(naoh_adv_processing, "petroleum-gas", {amount=70})
end
data:extend({
	naoh_processing, naoh_adv_processing
})

-- Rocket fuel
local rocket_fuel_recipe = data.raw.recipe["rocket-fuel"]
if (rocket_fuel_recipe) then
	rocket_fuel_recipe.auto_recycle = false
	fds_recipe.add_category("rocket-fuel", "chemistry")
	fds_recipe.add_ingredient("rocket-fuel", {type="fluid", name="ph-hno3", amount=10})
	rocket_fuel_recipe.crafting_machine_tint = {
		primary = {r = 1.0, g = 0.7, b = 0.0, a = 1.000},
		secondary = {r = 0.996, g = 0.742, b = 0.408, a = 1.000},
		tertiary = {r = 0.75, g = 0.45, b = 0.25, a = 1.000},
		quaternary = {r = 0.656, g = 0.562, b = 0.264, a = 1.000},
	}
end
if (mods['space-age']) then
	fds_recipe.replace_ingredient("rocket-fuel-from-jelly", "water", {type="fluid", name="ammonia", amount=10})
end