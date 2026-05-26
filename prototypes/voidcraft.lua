if (not mods['Voidcraft']) then return end

local vcc = require("__Voidcraft__.prototypes.costs")

local acid_base_bad_product = "stone"
if (mods['crushing-industry']) then acid_base_bad_product = "sand" end

local calcite_bad_product = "carbon"
if (mods['space-age']) then calcite_bad_product = "calcite" end

local spoilage_or_coal = "coal"
if (mods['space-age']) then spoilage_or_coal = "spoilage" end

local ice_or_carbon = "carbon"
if (mods['space-age']) then ice_or_carbon = "ice" end

VOIDCRAFT.create_auto_groups({
	{ "voidcraft-acid-base", "vcac" }
})

local hcl_cost = vcc.medium_resource*5	-- 20
local naoh_cost = vcc.medium_resource	-- 4
local cao_cost = vcc.basic_resource*3+6	-- 12
local ammonia_cost = vcc.ammonia + 4	-- 8
local hno3_cost	= vcc.sulfuric_acid_rebalanced
local ch3cooh_cost = vcc.sulfuric_acid_rebalanced

local hf_cost = vcc.hf

local vc_recipes = {
	VOIDCRAFT.voidcraft_recipe({subgroup = "voidcraft-acid-base", icopy="fluid", fluid = 120, secondary_item = true },
		{"ph-hcl", "ph-naoh", "salt" }, "vcac-aa", hcl_cost, "s6x-void-acid-base", {0.5, 0.78, 0.275}),
		
	VOIDCRAFT.voidcraft_recipe({subgroup = "voidcraft-acid-base", icopy="item", secondary_fluid = true, amt2 = 60 },
		{"ph-naoh", "ph-hcl", "salt" }, "vcac-ba", naoh_cost, "s6x-void-acid-base", {0.525, 0.42, 0.4}),
		
	VOIDCRAFT.voidcraft_recipe({subgroup = "voidcraft-acid-base", icopy="item" },
		{"ph-cao", acid_base_bad_product, calcite_bad_product }, "vcac-bb", cao_cost, nil, {0.74, 0.71, 0.7}),
		
	VOIDCRAFT.voidcraft_recipe({prefix = (mods['space-age'] and "__space-age__") or "__pHactorio__", subgroup = "voidcraft-acid-base", fluid = 240, secondary_item = true},
		{"ammonia", ice_or_carbon, "stone"}, "vcac-bc", ammonia_cost, "s6x-void-ammonia-hno3", {0.1, 0.1, 0.62}),
		
	VOIDCRAFT.voidcraft_recipe({prefix = "__pHactorio__", subgroup = "voidcraft-acid-base", fluid = 120, secondary_fluid = true, amt2 = 120},
		{"ph-hno3", "ammonia", spoilage_or_coal}, "vcac-ab", hno3_cost, "s6x-void-ammonia-hno3", {0.84, 0.22, 0.1}),
}

if (mods['space-age']) then
	table.insert(vc_recipes, VOIDCRAFT.voidcraft_recipe({prefix = "__pHactorio__", subgroup = "voidcraft-acid-base", fluid = 120, secondary_item = true },
		{"ph-ch3cooh", spoilage_or_coal, "yumako-mash"}, "vcac-ac", ch3cooh_cost, nil, {0.5, 0.25, 0.05}))
		
	table.insert(vc_recipes, VOIDCRAFT.voidcraft_recipe({prefix = "__pHactorio__", subgroup = "voidcraft-acid-base", fluid = 120, secondary_fluid = true, amt2 = 120},
		{"ph-hf", "fluorine", "ice"}, "vcac-ad", hf_cost, nil, {0.04, 0.34, 0.14}))
end
data:extend(vc_recipes)

local vc_flux_coh_recipes = {}
for r, rd in pairs(vc_recipes) do
    if (rd.vc_fluxize) then
        local flx = VOIDCRAFT.fluxize(rd)        
        if (not data.raw.recipe[flx.name]) then table.insert(vc_flux_coh_recipes, flx) end
    end
    if (rd.vc_coherize) then
        local coh = VOIDCRAFT.coherize(rd)        
        if (not data.raw.recipe[coh.name]) then table.insert(vc_flux_coh_recipes, coh) end
    end
end
data:extend(vc_flux_coh_recipes)