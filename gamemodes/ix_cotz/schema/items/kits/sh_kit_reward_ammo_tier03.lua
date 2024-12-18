ITEM.name = "Professional Ammo Box"
ITEM.description= "The box rattles when you shake it."
ITEM.model = "models/lostsignalproject/items/misc/small_wood_box.mdl"

ITEM.width = 4
ITEM.height = 2
ITEM.flag = "A"

ITEM.exRender = true
ITEM.iconCam = {
	pos = Vector(0, -0.68, 200),
	ang = Angle(449.8, 90.22, 0),
	fov = 13.55
}

ITEM.upgradeItem = "kit_reward_ammo_tier04"
ITEM.upgradeCost = 15000

ITEM.items = {
	{
		{2, "task_reward_ammo_03_small"},
		{1, "task_reward_ammo_03_aphp"},
	},
	{
		{1, "task_reward_ammo_03"},
	},
}