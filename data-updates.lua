local fds_technology = require("__fdsl__.lib.technology")

if (mods['crushing-industry']) then
	-- Remove unnecessary iron crushing
	if (settings.startup["crushing-industry-ore"].value) then
		fds_technology.remove_unlock("concrete", "crushed-iron-ore")
	end
	
	-- Glass changes
	if (settings.startup["crushing-industry-glass"].value) then
		-- if (mods['alloy-smelting'] and settings.startup["alloy-smelting-glass"].value) then
		-- 	fds_technology.replace_unlock("kiln-smelting", "glass", "s6x-simple-glass")
		-- else
		-- 	fds_technology.replace_unlock("electronics", "glass", "s6x-simple-glass")
		-- end
	end
end

if (mods['any-planet-start']) then
	if (settings.startup["aps-planet"].value == "vulcanus") then
		table.insert(data.raw.technology["calcite-processing"].effects, 2, { type = "unlock-recipe", recipe = "s6x-electrolysis-plant" })
		table.insert(data.raw.technology["oil-processing"].effects, 3, { type = "unlock-recipe", recipe = "basic-oil-processing" })
		table.insert(data.raw.technology["oil-processing"].effects, 3, { type = "unlock-recipe", recipe = "s6x-simple-coal-liquefaction-hcl" })
		
		fds_technology.remove_unlock("calcite-processing", "s6x-simple-coal-liquefaction-hcl")
	end
end

