--------------------------------------------------------------------------------
--
-- Minetest Mod "Voidfill" Version 1.1                                2014-08-31
--
-- By Racso Rhodes
--
-- voidfill/readme.txt
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
--	1 Changelog
--
--	2 About Voidfill
--
--		2.1 Description
--
--		2.2 Intended Purpose
--
--		2.3 Safety Measures
--
--	3 Install
--
--	4 Textures
--
--	5 Nodes
--
--		5.1 voidfill:seed
--
--			A Recipe
--			B Refund
--
--		5.2 voidfill:revoider
--
--			A Recipe
--
--		5.3 voidfill:active_crystal
--
--		5.4 voidfill:inert_crystal
--
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
1 Changelog
--------------------------------------------------------------------------------

	1.1 2014-08-31
	
		+ Added recipe for "voidfill:revoider".
		+ Added node "voidfill:revoider".
		+ Added ABM for "voidfill:revoider".
		+ Added texture for "voidfill:revoider".
		+ Changed texture for "voidfill:seed/active_crystal/inert_crystal".

	1.0 2014-08-25

		! Initial release.

--------------------------------------------------------------------------------
2 About Travelpoints
--------------------------------------------------------------------------------

	2.1 Description

		This mod is intended for Singleplayer usage.

		It allows the player to make Crystal Seeds that can be placed in a cave
		that you wish to fill in.

		The placed Crystal Seed will "expand", filling open space around it with
		Active Crystals which will expand further.

		These crystals will expand out until they consume all open space, until
		they reach a light source, until they expand too far from the player or
		until they reach sea level. When expansion stops for any of these
		reasons the crystals become inert.

		If you later tunnel through a filled in cavern, you will recognize it by
		the Inert Crystals, which when dug will drop default:obsidian_shard.
		
		If you need to remove Inert Crystals, you can make a Revoider that can
		be placed on an Inert Crystal where it will expand out decaying all
		connected Inert Crystals to air.

	2.2 Intended Purpose

		After clearing a cavern of minerals, it may be useful to fill in the
		cave so you know it has been mined and it will no longer be visible when
		exploring in "no-clipping" mode.

		Most might do this with WorldEdit, but this mod fills only the confines
		of the given cavern and will not overwrite undug nodes. It may also add
		a fun or role play element.
		
	2.3 Safety Measures

		Crystals expand in darkness, below sea level.

		Crystals become inert when they can expand no further, coming into
		contact with anything other than air.

		Crystals become inert within 3 to 5 nodes of a light source, such as a
		torch or lava.

		Like any other active node, such as a furnace, if the player is too far
		from the Active Crystals they will become inert. Under default conf
		settings the Crystals go inert around 40 nodes away from the player.

		You can either fill a cave in segments, or use no-clipping mode to
		follow the expanding crystals.
		
		To reverse the process create and place a Revoider that will decay
		connected Inert Crystals.

--------------------------------------------------------------------------------
3 Install Mod
--------------------------------------------------------------------------------

	This mod was written with Minetest 0.4.10, but may work with builds as far
	back as 0.4.8 at least, as with future builds.

	Rename the extracted directory to "voidfill" and move it to the "mods"
	directory of your Minetest installation.

--------------------------------------------------------------------------------
4 Textures
--------------------------------------------------------------------------------

	While this mod ships with 16x16 textures, higher resolution textures are
	available:

	32x32

		https://github.com/RacsoRhodes/voidfill-textures-32/archive/master.zip

	64x64

		https://github.com/RacsoRhodes/voidfill-textures-64/archive/master.zip

	128x128

		https://github.com/RacsoRhodes/voidfill-textures-128/archive/master.zip

	256x256

		https://github.com/RacsoRhodes/voidfill-textures-256/archive/master.zip

	512x512

		https://github.com/RacsoRhodes/voidfill-textures-512/archive/master.zip

	Install your chosen textures by moving or copying the images from the
	extracted zip file to the directory of your active Minetest texture pack.

	Example:

		If you were using "HDX 128", extract "voidfill-textures-128-master.zip"
		and move the image files within to the textures/HDX_128px directory
		in your Mintest installation directory.

--------------------------------------------------------------------------------
5 Nodes
--------------------------------------------------------------------------------

	----------------------------------------------------------------------------
	5.1 voidfill:seed
	----------------------------------------------------------------------------

		Once placed under the correct conditions it will begin to "expand" by
		placing Active Crystals into adjacent spaces.

		When placed under light, above sea level, in water or lava the Crystal
		Seed will go inert.

		A Recipe

			OB default:obsidian 4
			MC default:mese_crystal 2
			DI default:diamond 2
			ST default:stone 1

			OB MC OB
			DI ST DI
			OB MC OB

		B Refund

			Crystal Seed can be converted to default:diamond x4.

	----------------------------------------------------------------------------
	5.2 voidfill:revoider
	----------------------------------------------------------------------------

		Once placed on an Inert Crystal it will begin to "expand" by replacing
		adjacent Inert Crystals with Revoiders.
		
		Each Revoider decays to air after attempting to expand one node from
		each of its six faces. 
		
		A Recipe

			CS voidfill:seed
			OS default:obsidian_shard
			-- nothing
			
			-- OS --
			OS CS OS
			-- OS --

	----------------------------------------------------------------------------
	5.3 voidfill:active_crystal
	----------------------------------------------------------------------------

		Placed by Crystal Seed, and other Active Crystals.

		Each Crystal Seed goes inert after attempting to expand one node from each
		of its six faces. Light, depth, lack of room, and distance from player
		will also cause Active Crystals to go inert.

		When dug Active Crystals will drop default:obsidian.

	----------------------------------------------------------------------------
	5.4 voidfill:inert_crystal
	----------------------------------------------------------------------------

		When a Crystal Seed or Active Crystal finishes expanding or is haulted
		for another reason it will become an Inert Crystal.

		When dug Inert Crystals will drop default:obsidian_shard.

--------------------------------------------------------------------------------
-- EOF
--------------------------------------------------------------------------------