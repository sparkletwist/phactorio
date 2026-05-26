if (not PHACTORIO) then PHACTORIO = {} end

PHACTORIO.acid_order = data.raw.fluid["sulfuric-acid"].order .. "-a[ph]-a[acids]"
PHACTORIO.base_order = data.raw.item["sulfur"].order .. "-a[ph]-a[bases]"

if (data.raw.recipe["sulfuric-acid"] and data.raw.recipe["sulfuric-acid"].order) then
	PHACTORIO.recipe_order = data.raw.recipe["sulfuric-acid"].order .. "-a[ph]"
else
	PHACTORIO.recipe_order = "c[oil-products]-b[sulfuric-acid]-a[ph]"
end

PHACTORIO.ore_crushing = mods["crushing-industry"] and settings.startup["crushing-industry-ore"].value

PHACTORIO.coal_ingredient = "coal"
if (mods["crushing-industry"] and settings.startup["crushing-industry-coal"].value) then PHACTORIO.coal_ingredient = "crushed-coal" end

PHACTORIO.stone_or_sand_ingredient = "stone"
if (mods["crushing-industry"]) then PHACTORIO.stone_or_sand_ingredient = "sand" end

PHACTORIO.kiln_smelting = false
if (mods["alloy-smelting"] and settings.startup["alloy-smelting-create-kilns"].value) then
	PHACTORIO.kiln_smelting = true
end

PHACTORIO.glass = false
if (mods["crushing-industry"] and settings.startup["crushing-industry-glass"].value) then
	PHACTORIO.glass = true
elseif (mods["IridescentIndustry"] and IRIDESCENT.glass == "glass") then
	PHACTORIO.glass = true
end	

PHACTORIO.thorium229 = false
if (mods["Bluetonium"]) then
	if (mods["IridescentIndustry"] or settings.startup["nfb-thorium-229"].value) then
		PHACTORIO.thorium229 = true
	end
end

require("prototypes/fds_util")

require("prototypes/groups")
require("prototypes/technology")
require("prototypes/acids")
require("prototypes/bases")
require("prototypes/electrolysis-plant")
require("prototypes/electrolysis-recipe")
require("prototypes/petrochem")
require("prototypes/steel")
require("prototypes/battery")
require("prototypes/concrete")
require("prototypes/explosives")
require("prototypes/glass")
require("prototypes/scrap-melting")
require("prototypes/space-age")
require("prototypes/pickling")
require("prototypes/voiding")
require("prototypes/bluetonium")
require("prototypes/ci")
require("prototypes/ii")
require("prototypes/scrap")
require("prototypes/voidcraft")

