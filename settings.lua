data:extend({	
	{
		type = "bool-setting",
		name = "s6x-ph-voiding-recipes",
		setting_type = "startup",
		default_value = false,
		order = "ba"
	},
})

if (mods['crushing-industry']) then
	data:extend({
		{
			type = "bool-setting",
			name = "s6x-ph-restore-simple-glass",
			setting_type = "startup",
			default_value = false,
			order = "ca"
		},		
	})
end