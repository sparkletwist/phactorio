-- Based on Krastorio 2
local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")

local empty_sprite = {
	filename = "__pHactorio__/graphics/entity/empty.png",
	priority = "extra-high",
	width = 1,
	height = 1,
	scale = 0.5,
	shift = { 0, 0 },
}

local k2pipepicture = {
	north = empty_sprite,
	east = empty_sprite,
	south = {
		filename = "__pHactorio__/graphics/entity/pipe-patch.png",
		priority = "high",
		width = 55,
		height = 50,
		scale = 0.5,
		shift = { 0.01, -0.58 },
	},
	west = empty_sprite,
}

local gear_or_glass = "iron-gear-wheel"
if (PHACTORIO.glass) then
	gear_or_glass = "glass"
end

data:extend({
  {
    type = "recipe",
    name = "s6x-electrolysis-plant",
    energy_required = 10,
    enabled = false,
    ingredients = {
		{ type = "item", name = "steel-plate", amount = 10 },
		{ type = "item", name = "electronic-circuit", amount = 2 },
		{ type = "item", name = "copper-plate", amount = 5 },
		{ type = "item", name = gear_or_glass, amount = 5 },
    },
    results = { { type = "item", name = "s6x-electrolysis-plant", amount = 1 } },
  },
  {
    type = "item",
    name = "s6x-electrolysis-plant",
    icon = "__pHactorio__/graphics/icons/electrolysis-plant.png",
    subgroup = "production-machine",
    order = "e[chemical-plant]-a[ph]-a[electrolysis]",
    place_result = "s6x-electrolysis-plant",
    stack_size = 50,
    weight = 40*kg,
  },
  {
    type = "assembling-machine",
    name = "s6x-electrolysis-plant",
    icon = "__pHactorio__/graphics/icons/electrolysis-plant.png",
    flags = { "placeable-neutral", "placeable-player", "player-creation" },
    minable = { mining_time = 0.2, result = "s6x-electrolysis-plant" },
    max_health = 500,
    heating_energy = (mods["space-age"] and "100kW") or nil,
    corpse = "oil-refinery-remnants",
    dying_explosion = "oil-refinery-explosion",
    resistances = {
      { type = "physical", percent = 50 },
      { type = "fire", percent = 50 },
      { type = "impact", percent = 50 },
    },
    fluid_boxes = {
      {
        production_type = "input",
        pipe_covers = pipecoverspictures(),
        pipe_picture = k2pipepicture,
        volume = 1000,
        pipe_connections = {
			{ flow_direction = "input-output", direction = defines.direction.west, position = { -2, -1 } },
			{ flow_direction = "input-output", direction = defines.direction.east, position = { 2, -1 } }
		},
      },
      {
        production_type = "input",
        pipe_covers = pipecoverspictures(),
        pipe_picture = k2pipepicture,
        volume = 1000,
        pipe_connections = {
			{ flow_direction = "input-output", direction = defines.direction.west, position = { -2, 1 } },
			{ flow_direction = "input-output", direction = defines.direction.east, position = { 2, 1 } }			
		},
      },
      
	  {
        production_type = "output",
        pipe_covers = pipecoverspictures(),
        pipe_picture = k2pipepicture,
        volume = 1000,
        pipe_connections = {
			{ flow_direction = "output", direction = defines.direction.north, position = { -1, -2 } },
		},
      },
	  
      {
        production_type = "output",
        pipe_covers = pipecoverspictures(),
        pipe_picture = k2pipepicture,
        volume = 1000,
        pipe_connections = {
			{ flow_direction = "output", direction = defines.direction.north, position = { 1, -2 } },
		},
      },
	  
	  {
        production_type = "output",
        pipe_covers = pipecoverspictures(),
        pipe_picture = k2pipepicture,
        volume = 1000,
        pipe_connections = {
			{ flow_direction = "output", direction = defines.direction.south, position = { -1, 2 } }
		},
      },
	  
      {
        production_type = "output",
        pipe_covers = pipecoverspictures(),
        pipe_picture = k2pipepicture,
        volume = 1000,
        pipe_connections = {
			{ flow_direction = "output", direction = defines.direction.south, position = { 1, 2 } }
		},
      },
	  
	  
    },
    collision_box = { { -2.4, -2.4 }, { 2.4, 2.4 } },
    selection_box = { { -2.5, -2.5 }, { 2.5, 2.5 } },
    damaged_trigger_effect = hit_effects.entity(),
    fast_replaceable_group = "electrolysis-plant",
    crafting_categories = { "ph-electrolysis" },
    crafting_speed = 1,
    return_ingredients_on_change = true,
    energy_source = {
		type = "electric",
		usage_priority = "secondary-input",
		emissions_per_minute = { pollution = 0.5 },
    },
    energy_usage = "800kW",
    module_slots = 2,
    allowed_effects = { "consumption", "speed", "productivity", "pollution" },
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    vehicle_impact_sound = { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound = {
		sound = { filename = "__pHactorio__/sounds/electrolysis-plant.ogg", volume = 0.8 },
		idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.5 },
    },
    graphics_set = {
      animation = {
        layers = {
          {
            filename = "__pHactorio__/graphics/entity/electrolysis-plant/electrolysis-plant.png",
            width = 380,
            height = 380,
            scale = 0.5,
            frame_count = 1,
            shift = { 0, 0 },
          },
          {
            filename = "__pHactorio__/graphics/entity/electrolysis-plant/electrolysis-plant-sh.png",
            width = 380,
            height = 380,
            scale = 0.5,
            frame_count = 1,
            draw_as_shadow = true,
            shift = { 0, 0 },
          },
        },
      },
      working_visualisations = {
        {
          apply_recipe_tint = "primary",
          animation = {
            filename = "__pHactorio__/graphics/entity/electrolysis-plant/electrolysis-plant-work.png",
            width = 380,
            height = 380,
            scale = 0.5,
            frame_count = 12,
            line_length = 6,
            animation_speed = 0.4,
            shift = { 0, 0 },
            blend_mode = "additive",
            draw_as_glow = true,
          },
        },
        {
          apply_recipe_tint = "primary",
          animation = {
            filename = "__pHactorio__/graphics/entity/electrolysis-plant/electrolysis-plant-work-light.png",
            width = 380,
            height = 380,
            scale = 0.5,
            frame_count = 12,
            line_length = 6,
            animation_speed = 0.4,
            shift = { 0, 0 },
            draw_as_light = true,
          },
        },
      },
      water_reflection = {
        pictures = {
          filename = "__pHactorio__/graphics/entity/electrolysis-plant/electrolysis-plant-reflection.png",
          priority = "extra-high",
          width = 42,
          height = 38,
          shift = util.by_pixel(0, 40),
          variation_count = 1,
          scale = 5,
        },
        rotate = false,
        orientation_to_variation = false,
      },
    },
    icon_draw_specification = { scale = 2, shift = { 0, -0.3 } },
    icons_positioning = { { inventory_index = defines.inventory.assembling_machine_modules, shift = { 0, 1.25 } } },

    circuit_wire_max_distance = default_circuit_wire_max_distance,
    circuit_connector = circuit_connector_definitions.create_vector(
      universal_connector_template, 
      {
        { variation = 26, main_offset = util.by_pixel_hr(4, 120), shadow_offset = util.by_pixel_hr(8, 120), show_shadow = false },
        { variation = 26, main_offset = util.by_pixel_hr(4, 120), shadow_offset = util.by_pixel_hr(8, 120), show_shadow = false },
        { variation = 26, main_offset = util.by_pixel_hr(4, 120), shadow_offset = util.by_pixel_hr(8, 120), show_shadow = false },
        { variation = 26, main_offset = util.by_pixel_hr(4, 120), shadow_offset = util.by_pixel_hr(8, 120), show_shadow = false }
      }
    )
  },
})
