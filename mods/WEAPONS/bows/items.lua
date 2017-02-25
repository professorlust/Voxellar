
minetest.register_node("bows:target", {
	description = "Target",
	tiles = {"default_wood.png","default_wood.png","default_wood.png","default_wood.png","default_wood.png","default_wood.png^bows_target.png","default_wood.png"},
	groups = {choppy = 2, oddly_breakable_by_hand = 2,mesecon = 2},
	drawtype="nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.1875, 0.375, 0.5, 0.1875, 0.5},
			{-0.4375, -0.25, 0.375, 0.4375, 0.25, 0.5},
			{-0.375, -0.375, 0.375, 0.375, 0.375, 0.5},
			{-0.25, -0.4375, 0.375, 0.25, 0.4375, 0.5},
			{-0.125, -0.5, 0.375, 0.125, 0.5, 0.5},
		}
	},
	paramtype2="facedir",
	paramtype = "light",
	sunlight_propagates = true,
	mesecons = {receptor = {state = "off"}},
	on_timer = function (pos, elapsed)
		mesecon.receptor_off(pos)
		return false
	end,
})
minetest.register_craft({
	output = "bows:target",
	recipe = {
		{"","group:wood",""},
		{"group:wood","group:wood","group:wood"},
		{"","group:wood",""}
	}
})
minetest.register_craft({output = "default:cobble",recipe = {{"default:gravel"},}})
minetest.register_craft({output = "farming:cotton 4",recipe = {{"group:wool"},}})

bows.register_bow("bow_wood",{
	description="Wooden bow",
	texture="bows_bow.png",
	texture_loaded="bows_bow_loaded.png",
	uses=50,
	level=1,
	craft={
		{"","group:stick","farming:cotton"},
		{"group:stick","","farming:cotton"},
		{"","group:stick","farming:cotton"}
	},
})

bows.register_bow("bow_stone",{
	description="Stone bow",
	texture="bows_bow_stone.png",
	texture_loaded="bows_bow_loaded_stone.png",
	uses=70,
	level=4,
	craft={
		{"","default:cobble","farming:cotton"},
		{"default:cobble","","farming:cotton"},
		{"","default:cobble","farming:cotton"}
	},
})

bows.register_bow("bow_steel",{
	description="Steel bow",
	texture="bows_bow_steel.png",
	texture_loaded="bows_bow_loaded_steel.png",
	uses=140,
	level=8,
	craft={
		{"","default:steel_ingot","farming:cotton"},
		{"default:steel_ingot","","farming:cotton"},
		{"","default:steel_ingot","farming:cotton"}
	},
})

bows.register_bow("bow_bronze",{
	description="Bronze bow",
	texture="bows_bow_bronze.png",
	texture_loaded="bows_bow_loaded_bronze.png",
	uses=280,
	level=10,
	craft={
		{"","default:bronze_ingot","farming:cotton"},
		{"default:bronze_ingot","","farming:cotton"},
		{"","default:bronze_ingot","farming:cotton"}
	},
})

bows.register_bow("bow_obsidian",{
	description="Obsidian bow",
	texture="bows_bow_ob.png",
	texture_loaded="bows_bow_loaded_ob.png",
	uses=400,
	level=11,
	craft={
		{"","default:obsidian","farming:cotton"},
		{"default:obsidian","","farming:cotton"},
		{"","default:obsidian","farming:cotton"}
	},
})

bows.register_bow("bow_gold",{
	description="Gold bow",
	texture="bows_bow_gold.png",
	texture_loaded="bows_bow_loaded_gold.png",
	uses=500,
	level=13,
	craft={
		{"","default:gold_ingot","farming:cotton"},
		{"default:gold_ingot","","farming:cotton"},
		{"","default:gold_ingot","farming:cotton"}
	},
})

bows.register_bow("bow_diamond",{
	description="Diamond bow",
	texture="bows_bow_diamond.png",
	texture_loaded="bows_bow_loaded_diamond.png",
	uses=800,
	level=19,
	craft={
		{"","default:diamond","farming:cotton"},
		{"default:diamond","","farming:cotton"},
		{"","default:diamond","farming:cotton"}
	},
})

bows.register_bow("bow_rainbow",{
	description="Rainbow bow",
	texture="bows_bow_rain.png",
	texture_loaded="bows_bow_loaded_rain.png",
	uses=1100,
	level=19,
	craft={
		{"","default:nyancat_rainbow","farming:cotton"},
		{"default:nyancat_rainbow","","farming:cotton"},
		{"","default:nyancat_rainbow","farming:cotton"}
	},
})

bows.register_bow("bow_admin",{
	description="Admin bow (admin arrows = bows:arrow_admin)",
	texture="bows_bow_admin.png",
	texture_loaded="bows_bow_loaded_admin.png",
	level=39,
	uses=0,
})


bows.register_arrow("arrow",{
	description="Arrow",
	texture="bows_arrow_wood.png",
	damage=5,
	craft_count=8,
	craft={{"default:cobble","default:stick","group:leaves"},}
})

bows.register_arrow("arrow_admin",{
	description="Admin arrow",
	texture="bows_arrow_wood.png^[colorize:#ea00cccc",
	damage=9000,
	on_hit_object=bows.arrow_admin_object,
	on_hit_node=bows.arrow_remove,
})
minetest.override_item("bows:arrow_admin", {groups = {arrow=1,not_in_creative_inventory=1}})


bows.register_arrow("arrow_steel",{
	description="Steel arrow",
	texture="bows_arrow_wood.png^[colorize:#FFFFFFcc",
	damage=8,
	craft_count=8,
	craft={
		{"group:arrow","group:arrow","group:arrow"},
		{"group:arrow","default:steel_ingot","group:arrow"},
		{"group:arrow","group:arrow","group:arrow"},
	}
})

bows.register_arrow("arrow_gold",{
	description="Gold arrow",
	texture="bows_arrow_wood.png^[colorize:#d7c633cc",
	damage=10,
	craft_count=8,
	craft={
		{"group:arrow","group:arrow","group:arrow"},
		{"group:arrow","default:gold_ingot","group:arrow"},
		{"group:arrow","group:arrow","group:arrow"},
	}
})

bows.register_arrow("arrow_mese",{
	description="Mese arrow",
	texture="bows_arrow_wood.png^[colorize:#e3ff00cc",
	damage=12,
	craft_count=8,
	craft={
		{"group:arrow","group:arrow","group:arrow"},
		{"group:arrow","default:mese_crystal","group:arrow"},
		{"group:arrow","group:arrow","group:arrow"},
	}
})

bows.register_arrow("arrow_diamond",{
	description="Diamond arrow",
	texture="bows_arrow_wood.png^[colorize:#15d7c2cc",
	damage=15,
	craft_count=8,
	craft={
		{"group:arrow","group:arrow","group:arrow"},
		{"group:arrow","default:diamond","group:arrow"},
		{"group:arrow","group:arrow","group:arrow"},
	}
})


bows.register_arrow("arrow_fire",{
	description="Fire arrow",
	texture="bows_arrow_wood.png^[colorize:#ffb400cc",
	damage=10,
	craft_count=1,
	on_hit_node=bows.arrow_fire,
	on_hit_object=bows.arrow_fire_object,
	craft={
		{"group:arrow","default:torch"},
	}
})

bows.register_arrow("arrow_build",{
	description="Build arrow",
	texture="bows_arrow_wood.png^[colorize:#33336677",
	on_hit_node=bows.arrow_build,
	craft_count=8,
	damage=8,
	craft={
		{"group:arrow","group:arrow","group:arrow"},
		{"group:arrow","default:obsidian_shard","group:arrow"},
		{"group:arrow","group:arrow","group:arrow"}
	}
})

bows.register_arrow("arrow_dig",{
	description="Dig arrow",
	texture="bows_arrow_wood.png^[colorize:#333333aa",
	on_hit_node=bows.arrow_dig,
	craft_count=16,
	damage=8,
	craft={
		{"group:arrow","group:arrow","group:arrow"},
		{"group:arrow","default:pick_steel","group:arrow"},
		{"group:arrow","group:arrow","group:arrow"}
	}
})

bows.register_arrow("arrow_toxic",{
	description="Toxic arrow",
	texture="bows_arrow_wood.png^[colorize:#66aa11aa",
	on_hit_object=bows.arrow_toxic,
	craft_count=1,
	damage=0,
	craft={
		{"group:arrow","default:papyrus"},
	}
})

bows.register_arrow("arrow_Tetanus",{
	description="Tetanus arrow",
	texture="bows_arrow_wood.png^[colorize:#aa5500aa",
	on_hit_object=bows.arrow_tetanus,
	craft_count=4,
	damage=2,
	craft={
		{"","group:arrow",""},
		{"group:arrow","bucket:bucket_water","group:arrow"},
		{"","group:arrow",""}
	}
})


if bows.tnt then
bows.register_arrow("arrow_tnt",{
	description="TNT arrow",
	texture="bows_arrow_wood.png^[colorize:#aa0000aa",
	on_hit_object=bows.arrow_tnt_object,
	on_hit_node=bows.arrow_tnt_node,
	craft_count=1,
	damage=5,
	craft={
		{"","group:arrow",""},
		{"group:arrow","tnt:tnt","group:arrow"},
		{"","group:arrow",""}
	}
})
end