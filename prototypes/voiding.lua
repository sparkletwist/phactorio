if (not settings.startup["s6x-ph-voiding-recipes"].value) then return end

data:extend({
	{
		type = "item-subgroup",
		name = "water-voiding",
		group = "intermediate-products",
		order = "zzz"
	},
	
	{
		type = "recipe",
		name = "s6x-water-voiding",
		icons = {
			{ icon = data.raw.fluid["water"].icon },
			{ icon = "__base__/graphics/icons/shapes/shape-diagonal-cross.png", tint = { 1.0, 0.5, 0.5, 0.5 } }
		},
		category = "chemistry",
		subgroup = "water-voiding",
		order = "a[water]",
		enabled = true,
		allow_productivity = false,
		allow_quality = false,
		hide_from_signal_gui = false,
		hide_from_player_crafting = true,
		allow_decomposition = false,
		auto_recycle = false,
		emissions_multiplier = 0.0,
		energy_required = 0.25,
		ingredients = {
			{type="fluid", name="water", amount=100}
		},
		--results = {},
		crafting_machine_tint = {
			primary = {r = 0.1, g = 0.4, b = 0.7, a = 1.0},
			secondary = {r = 0.66, g = 0.7, b = 0.7, a = 1.0}, 
			tertiary = {r = 0.7, g = 0.85, b = 0.85, a = 1.0},
			quaternary = {r = 0.85, g = 0.85, b = 0.85, a = 0.85},
		}
	},
	
	{
		type = "recipe",
		name = "s6x-steam-voiding",
		icons = {
			{ icon = data.raw.fluid["steam"].icon },
			{ icon = "__base__/graphics/icons/shapes/shape-diagonal-cross.png", tint = { 1.0, 0.5, 0.5, 0.5 } }
		},
		category = "chemistry",
		subgroup = "water-voiding",
		order = "b[steam]",
		enabled = true,
		allow_productivity = false,
		allow_quality = false,
		hide_from_signal_gui = false,
		hide_from_player_crafting = true,
		allow_decomposition = false,
		auto_recycle = false,
		emissions_multiplier = 0.0,
		energy_required = 0.125,
		ingredients = {
			{type="fluid", name="steam", amount=500}
		},
		--results = {},
		crafting_machine_tint = {
			primary = {r = 0.8, g = 0.8, b = 0.8, a = 0.75},
			secondary = {r = 0.85, g = 0.85, b = 0.85, a = 1.0}, 
			tertiary = {r = 0.85, g = 0.85, b = 0.88, a = 0.75},
			quaternary = {r = 0.9, g = 0.9, b = 0.9, a = 1.0},
		}
	}
})