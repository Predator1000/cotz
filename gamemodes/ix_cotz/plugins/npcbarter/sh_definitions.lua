--[[
	ix.npcbarter.Register("'Old Timer'", "testbarter", {
		name = "Shot for tails", -- Currently unused
		description = "A box of .410 buck for 3 blind dog tails, or 1 pseudodog tail.", -- Description that will be shown in the dialogue
		defaultActive = true, -- Is this active by default

		barterItem = {"45acp41", 1, {["quantity"] = 5}}, -- Item that will awarded when barter is completed

		-- Only one type of item can be required at a time
		reqItem = { -- This means that this configuration will add 2 barters, one requiring 3 dog tails and one requiring a single pseudodog tail
			{"part_blinddog", 3}, 
			{"part_pseudodog", 1}
		}
	})
]]--

-- ix.npcbarter.Register("'Old Timer'", "testbarter", {
-- 	name = "Shot for tails",
-- 	description = "A box of .410 buck for 3 blind dog tails, or 1 pseudodog tail.",
-- 	defaultActive = true,

-- 	-- Item that will awarded when barter is completed
-- 	barterItem = {"45acp41"},

-- 	-- Only one type of item can be required at a time
-- 	reqItem = {
-- 		{"part_blinddog", 3},
-- 		{"part_pseudodog", 1}
-- 	}
-- })

-- ix.npcbarter.Register("'Old Timer'", "testbarter2", {
-- 	name = "USSR Surplus",
-- 	description = "10 shots of 7.62x54 for 4 capacitors.",
-- 	defaultActive = true,

-- 	-- Item that will awarded when barter is completed
-- 	barterItem = {"762x54hp", 1, {["quantity"] = 10}},

-- 	-- Only one type of item can be required at a time
-- 	reqItem = {
-- 		{"value_capacitors", 4},
-- 	}
-- })

-- ix.npcbarter.Register("'Old Timer'", "testbarter3", {
-- 	name = "Medical Bolts",
-- 	description = "3 medkits for an anomalous bolt.",
-- 	defaultActive = true,

-- 	-- Item that will awarded when barter is completed
-- 	barterItem = {"medic_medkit_1", 3},

-- 	-- Only one type of item can be required at a time
-- 	reqItem = {
-- 		{"artifact_bolt"},
-- 	}
-- })

ix.npcbarter.Register("'Old Timer'", "newbiebarter1", {
	name = "Decomposing Bullets",
	description = "I'll give you a box of .410 Buckshot for 4 pieces of Decomposing Meat.",
	defaultActive = true,

	-- Item that will awarded when barter is completed
	barterItem = {"45acp41", 1},

	-- Only one type of item can be required at a time
	reqItem = {
		{"meat_human", 4},
	}
})

ix.npcbarter.Register("'Old Timer'", "newbiebarter2", {
	name = "Decomposing Bullets",
	description = "I'll give you a box of 22LR for 2 pieces of Decomposing Meat.",
	defaultActive = true,

	-- Item that will awarded when barter is completed
	barterItem = {"22lr", 1},

	-- Only one type of item can be required at a time
	reqItem = {
		{"meat_human", 2},
	}
})

ix.npcbarter.Register("'Old Timer'", "newbiebarter3", {
	name = "Decomposing Bullets",
	description = "I'll give you a box of .45ACP for 3 pieces of Decomposing Meat.",
	defaultActive = true,

	-- Item that will awarded when barter is completed
	barterItem = {"45acp", 1},

	-- Only one type of item can be required at a time
	reqItem = {
		{"meat_human", 3},
	}
})

ix.npcbarter.Register("'Old Timer'", "newbiebarter4", {
	name = "Decomposing Bullets",
	description = "I'll give you a box of 9x18mm for 2 pieces of Decomposing Meat.",
	defaultActive = true,

	-- Item that will awarded when barter is completed
	barterItem = {"9x18", 1},

	-- Only one type of item can be required at a time
	reqItem = {
		{"meat_human", 2},
	}
})

ix.npcbarter.Register("'Old Timer'", "newbiebarter5", {
	name = "Decomposing Gear",
	description = "I'll give you a bandage for 1 pieces of Decomposing Meat.",
	defaultActive = true,

	-- Item that will awarded when barter is completed
	barterItem = {"medic_bandage_1", 1},

	-- Only one type of item can be required at a time
	reqItem = {
		{"meat_human", 2},
	}
})

ix.npcbarter.Register("'Old Timer'", "newbiebarter6", {
	name = "Decomposing Gear",
	description = "I'll give you a bottle of dirty water for 1 piece of Decomposing Meat.",
	defaultActive = true,

	-- Item that will awarded when barter is completed
	barterItem = {"drink_bottlewaterdirty", 1},

	-- Only one type of item can be required at a time
	reqItem = {
		{"meat_human", 1},
	}
})



ix.npcbarter.Register("'Cleaner'", "newbiebartercleaner1", {
	name = "Eurofunny",
	description = "I'll give you a box of .22lr for 10 Euros.",
	defaultActive = true,

	-- Item that will awarded when barter is completed
	barterItem = {"22lr", 1},

	-- Only one type of item can be required at a time
	reqItem = {
		{"value_currency_euro", 10},
	}
})

ix.npcbarter.Register("'Cleaner'", "newbiebartercleaner2", {
	name = "Eurofunny 2",
	description = "I'll give you a box of 12 Gauge Buckshot for 35 Euros.",
	defaultActive = true,

	-- Item that will awarded when barter is completed
	barterItem = {"12gauge", 1},

	-- Only one type of item can be required at a time
	reqItem = {
		{"value_currency_euro", 35},
	}
})

ix.npcbarter.Register("'Cleaner'", "newbiebartercleaner3", {
	name = "Eurofunny 3",
	description = "I'll give you a box of .410 Buckshot for 20 Euros.",
	defaultActive = true,

	-- Item that will awarded when barter is completed
	barterItem = {"45acp41", 1},

	-- Only one type of item can be required at a time
	reqItem = {
		{"value_currency_euro", 20},
	}
})

ix.npcbarter.Register("'Cleaner'", "newbiebartercleaner4", {
	name = "Eurofunny",
	description = "I'll give you 10 Euro for a lost note.",
	defaultActive = true,

	-- Item that will awarded when barter is completed
	barterItem = {"value_currency_euro", 1, {["quantity"] = 10}},

	-- Only one type of item can be required at a time
	reqItem = {
		{"hidestash_1", 1},
	}
})

ix.npcbarter.Register("'Cleaner'", "newbiebartercleaner5", {
	name = "Eurofunny",
	description = "I'll give you 15 Euro for a lost rookie PDA.",
	defaultActive = true,

	-- Item that will awarded when barter is completed
	barterItem = {"value_currency_euro", 1, {["quantity"] = 25}},

	-- Only one type of item can be required at a time
	reqItem = {
		{"hidestash_2", 1},
	}
})

ix.npcbarter.Register("'Cleaner'", "newbiebartercleaner6", {
	name = "Eurofunny",
	description = "I'll give you 20 Euro for a lost veteran PDA.",
	defaultActive = true,

	-- Item that will awarded when barter is completed
	barterItem = {"value_currency_euro", 1, {["quantity"] = 50}},

	-- Only one type of item can be required at a time
	reqItem = {
		{"hidestash_3", 1},
	}
})

ix.npcbarter.Register("'Haggler'", "newbiebarterhaggler1", {
	name = "Ammo",
	description = "I'll give you a box of low tier ammo for some red gunpowder.",
	defaultActive = true,

	-- Item that will awarded when barter is completed
	barterItem = {"kit_reward_ammo_tier01", 1},

	-- Only one type of item can be required at a time
	reqItem = {
		{"value_gunpowder_red", 1},
	}
})

ix.npcbarter.Register("'Haggler'", "newbiebarterhaggler2", {
	name = "Ammo",
	description = "I'll give you a box of mid tier ammo for some green gunpowder.",
	defaultActive = true,

	-- Item that will awarded when barter is completed
	barterItem = {"kit_reward_ammo_tier02", 1},

	-- Only one type of item can be required at a time
	reqItem = {
		{"value_gunpowder_green", 1},
	}
})

ix.npcbarter.Register("'Haggler'", "newbiebarterhaggler3", {
	name = "Ammo",
	description = "I'll give you a box of high tier ammo for some blue gunpowder.",
	defaultActive = true,

	-- Item that will awarded when barter is completed
	barterItem = {"kit_reward_ammo_tier03", 1},

	-- Only one type of item can be required at a time
	reqItem = {
		{"value_gunpowder_blue", 1},
	}
})
