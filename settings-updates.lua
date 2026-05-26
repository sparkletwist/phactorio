if (mods['scrap-chemistry']) then
	
	data.raw["string-setting"]["scrap-chemistry-recipe-mode"].hidden = true
	data.raw["string-setting"]["scrap-chemistry-recipe-mode"].forced_value = "remix"
	data.raw["string-setting"]["scrap-chemistry-recipe-mode"].allowed_values = {"remix"}

	data.raw["bool-setting"]["scrap-chemistry-sulfur"].hidden = true
	data.raw["bool-setting"]["scrap-chemistry-sulfur"].forced_value = true

	data.raw["bool-setting"]["scrap-chemistry-butane-realism"].hidden = true
	data.raw["bool-setting"]["scrap-chemistry-butane-realism"].forced_value = true

	-- we do this update ourselves
	data.raw["bool-setting"]["scrap-chemistry-rocket-fuel"].hidden = true
	data.raw["bool-setting"]["scrap-chemistry-rocket-fuel"].forced_value = false	
	
	if (mods['space-age']) then
		data.raw["bool-setting"]["scrap-chemistry-thruster"].hidden = true
		data.raw["bool-setting"]["scrap-chemistry-thruster"].forced_value = false
	end
	
end	