--------------------------------------------------------------------------------
--
-- Minetest Mod "Voidfill" Version 1.0                                2014-08-25
--
-- By Racso Rhodes
--
-- voidfill/init.lua
--
--------------------------------------------------------------------------------
-- License of source code and textures: WTFPL V2
--------------------------------------------------------------------------------
-- Copyright (C) 2014 Racso Rhodes <racso_rhodes@comcast.net>
-- This work is free. You can redistribute it and/or modify it under the
-- terms of the Do What The Fuck You Want To Public License, Version 2,
-- as published by Sam Hocevar. See the COPYING file for more details.
--------------------------------------------------------------------------------
-- TOC
--------------------------------------------------------------------------------
--
--	Recipes
--
--		voidfill:seed
--		default:diamond
--
--	Nodes
--
--		voidfill:seed
--		voidfill:active_crystal
--		voidfill:inert_crystal
--
--	ABMs
--
--		voidfill:seed/active_crystal
--
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Recipes
--------------------------------------------------------------------------------

--[voidfill:seed]---------------------------------------------------------------

minetest.register_craft({
	output = 'voidfill:seed 4',
	recipe = {
		{'default:obsidian', 'default:mese_crystal', 'default:obsidian'},
		{'default:diamond', 'default:stone', 'default:diamond'},
		{'default:obsidian', 'default:mese_crystal', 'default:obsidian'},
	}
})

--[voidfill:diamond]---------------------------------------------------------------

minetest.register_craft({
	output = 'default:diamond 4',
	recipe = {
		{'voidfill:seed'},
	}
})

--------------------------------------------------------------------------------
-- Nodes
--------------------------------------------------------------------------------

--[voidfill:seed]---------------------------------------------------------------

minetest.register_node("voidfill:seed", {
	description = "Crystal Seed",
	drawtype = "glasslike",
	tiles = {"voidfill_crystal.png"},
	inventory_image = minetest.inventorycube("voidfill_crystal.png"),
	paramtype = "light",
	light_source = 6,
	sunlight_propagates = true,
	is_ground_content = true,
	groups = {cracky=1,level=2},
	sounds = default.node_sound_glass_defaults(),
})

--[voidfill:active_crystal]-----------------------------------------------------

minetest.register_node("voidfill:active_crystal", {
	description = "Active Crystal",
	drawtype = "glasslike",
	tiles = {"voidfill_crystal.png"},
	inventory_image = minetest.inventorycube("voidfill_crystal.png"),
	paramtype = "light",
	light_source = 4,
	sunlight_propagates = true,
	is_ground_content = true,
	groups = {cracky=1,level=2, not_in_creative_inventory=1},
	drop = 'default:obsidian',
	sounds = default.node_sound_glass_defaults(),
})

--[voidfill:inert_crystal]------------------------------------------------------

minetest.register_node("voidfill:inert_crystal", {
	description = "Inert Crystal",
	tiles = {"voidfill_crystal.png"},
	inventory_image = minetest.inventorycube("voidfill_crystal.png"),
	is_ground_content = true,
	groups = {cracky=3, stone=1, not_in_creative_inventory=1},
	drop = 'default:obsidian_shard',
	sounds = default.node_sound_stone_defaults(),
})

--------------------------------------------------------------------------------
-- ABMs
--------------------------------------------------------------------------------

--[voidfill:seed/active_crystal]------------------------------------------------
--
--	Replaces adjacent "air" nodes with Active Crystals, then goes inert.
--
minetest.register_abm({
	nodenames = {"voidfill:seed", "voidfill:active_crystal"},
	interval = 1,
	chance = 4,
	action = function(pos, node)

		-- Verify Single Player and depth.
		if ( minetest.is_singleplayer() ) and ( pos.y < 1 ) then

			-- Declare table.
			local sides = { }

			-- Fill table with adjacent coords.
			sides.north = {x=pos.x, y=pos.y, z=pos.z+1}
			sides.east = {x=pos.x+1, y=pos.y, z=pos.z}
			sides.south = {x=pos.x, y=pos.y, z=pos.z-1}
			sides.west = {x=pos.x-1, y=pos.y, z=pos.z}
			sides.above = {x=pos.x, y=pos.y+1, z=pos.z}
			sides.below = {x=pos.x, y=pos.y-1, z=pos.z}

			-- Step through table of adjacent coords.
			for side, coords in pairs(sides) do

				-- Check if current coords contains "air".
				if minetest.get_node(coords).name == "air" then

					-- Check light intensity at current coords.
					if (minetest.get_node_light(coords) or 8) <= 7 then

						-- Place Active Crystal at current coords.
						minetest.set_node(coords, {name = "voidfill:active_crystal"})

					end

				end

			end

			-- Replace Active Crystal with Inert Crystal.
			minetest.set_node(pos, {name = "voidfill:inert_crystal"})

		else

			-- Replace Active Crystal with Inert Crystal.
			minetest.set_node(pos, {name = "voidfill:inert_crystal"})

		end

	end

})

--------------------------------------------------------------------------------
-- EOF
--------------------------------------------------------------------------------