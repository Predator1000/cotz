ITEM.name = "Pseudodog tail"
ITEM.model ="models/kek1ch/item_psevdodog_tail.mdl"
ITEM.description = "A pseudodog's tail."
ITEM.longdesc = "Rumor has it that a certain trend has recently taken over the fashion world: fur from the tails of pseudodogs. The fur is reportedly soft like no other. It is also said that it will keep you warm even in most vicious snowstorms and blizzards. For these reasons, pseudodog tails are in high demand."
ITEM.width = 1
ITEM.height = 1
ITEM.price = 2000
ITEM.flag = "A"
ITEM.attribBoosts = { ["luck"] = 3 }
ITEM.value = ITEM.price*1*1
ITEM.weight = 0.25

ITEM.pacData = {
[1] = {
	["children"] = {
		[1] = {
			["children"] = {
			},
			["self"] = {
				["OwnerName"] = "self",
				["Name"] = "",
				["UniqueID"] = "pseudodog1",
				["Bone"] = "pelvis",
				["ClassName"] = "model",
				["Position"] = Vector(-6.174, -2.35, 3.179),
				["Size"] = 0.5,
				["Angles"] = Angle(17.742, 90.732, -23.466),
				["Model"] = "models/kek1ch/item_psevdodog_tail.mdl",
			},
		},
	},
	["self"] = {
		["UniqueID"] = "pseudodog2",
		["Name"] = "",
		["ClassName"] = "group",
		["OwnerName"] = "self",
		["EditorExpand"] = true,
	},
},
}

-- On player uneqipped the item, Removes a weapon from the player and keep the ammo in the item.
ITEM.functions.EquipUn = { -- sorry, for name order.
	name = "Unequip",
	tip = "equipTip",
	icon = "icon16/stalker/unequip.png",
	OnRun = function(item)
		item:RemovePart(item.player)

		return false
	end,
	OnCanRun = function(item)
		local client = item.player

		return !IsValid(item.entity) and IsValid(client) and item:GetData("equip") == true and
			hook.Run("CanPlayerUnequipItem", client, item) != false and item.invID == client:GetCharacter():GetInventory():GetID()
	end
}

-- On player eqipped the item, Gives a weapon to player and load the ammo data from the item.
ITEM.functions.Equip = {
	name = "Equip",
	tip = "equipTip",
	icon = "icon16/stalker/equip.png",
	OnRun = function(item)
		local char = item.player:GetCharacter()
		local items = char:GetInventory():GetItems()

		for _, v in pairs(items) do
			if (v.id != item.id) then
				local itemTable = ix.item.instances[v.id]

				if (itemTable.pacData and v.outfitCategory == item.outfitCategory and itemTable:GetData("equip")) then
					item.player:Notify("You're already equipping this kind of outfit")

					return false
				end
			end
		end

		item:SetData("equip", true)
		item.player:AddPart(item.uniqueID, item)

		if (item.attribBoosts) then
			for k, v in pairs(item.attribBoosts) do
				char:AddBoost(item.uniqueID, k, v)
			end
		end

		item:OnEquipped()
		return false
	end,
	OnCanRun = function(item)
		local client = item.player

		return !IsValid(item.entity) and IsValid(client) and item:GetData("equip") != true and
			hook.Run("CanPlayerEquipItem", client, item) != false and item.invID == client:GetCharacter():GetInventory():GetID()
	end
}