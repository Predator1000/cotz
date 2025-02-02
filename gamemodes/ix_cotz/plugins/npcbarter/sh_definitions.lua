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

ix.npcbarter.Register("'Old Timer'", "testbarter", {
	name = "Shot for tails",
	description = "A box of .410 buck for 3 blind dog tails, or 1 pseudodog tail.",
	defaultActive = true,

	-- Item that will awarded when barter is completed
	barterItem = {"45acp41"},

	-- Only one type of item can be required at a time
	reqItem = {
		{"part_blinddog", 3},
		{"part_pseudodog", 1}
	}
})

ix.npcbarter.Register("'Old Timer'", "testbarter2", {
	name = "USSR Surplus",
	description = "10 shots of 7.62x54 for 4 capacitors.",
	defaultActive = true,

	-- Item that will awarded when barter is completed
	barterItem = {"762x54hp", 1, {["quantity"] = 10}},

	-- Only one type of item can be required at a time
	reqItem = {
		{"value_capacitors", 4},
	}
})

ix.npcbarter.Register("'Old Timer'", "testbarter3", {
	name = "Medical Bolts",
	description = "3 medkits for an anomalous bolt.",
	defaultActive = true,

	-- Item that will awarded when barter is completed
	barterItem = {"medic_medkit_1", 3},

	-- Only one type of item can be required at a time
	reqItem = {
		{"artifact_bolt"},
	}
})