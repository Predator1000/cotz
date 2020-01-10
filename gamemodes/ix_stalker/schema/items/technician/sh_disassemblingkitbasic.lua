ITEM.name = "Basic Disassembling Kit"
ITEM.model = "models/kek1ch/ckit.mdl"
ITEM.description = "Tools for disassembling items into components."
ITEM.flag = "A"
ITEM.maxStack = 100
ITEM.compMultiplier = 1
ITEM.category = "Technician"
ITEM.sound = "stalkersound/inv_repair_kit_use_fast_2p8.mp3"
ITEM.weight = 0.25

function ITEM:GetDescription()
	local quant = math.Round(self:GetData("quantity", 1), 0)
	local str = self.description.."\n \nThis tool has "..quant.."/"..self.maxStack.." durability."

	return str
end

if (CLIENT) then
	function ITEM:PaintOver(item, w, h)
		draw.SimpleText(math.Round(item:GetData("quantity", 1), 0).."/"..item.maxStack, "DermaDefault", 3, h - 1, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, color_black)
	end
end

function ITEM:OnInstanced(invID, x, y)
	if !self:GetData("quantity") then
		self:SetData("quantity", 100)
	end
end

ITEM.functions.combine = {
	OnCanRun = function(item, data)
		if !data[1] then
			return false
		end
		
		local targetItem = ix.item.instances[data[1]]

		if targetItem.uniqueID == item.uniqueID then
			return true
		else
			return false
		end
	end,
	OnRun = function(item, data)
		local targetItem = ix.item.instances[data[1]]
		local localQuant = item:GetData("quantity", item.quantity)
		local targetQuant = targetItem:GetData("quantity", targetItem.quantity)
		local combinedQuant = (localQuant + targetQuant)

		item.player:EmitSound("stalkersound/inv_properties.mp3", 110)

		if combinedQuant <= item.maxStack then
			targetItem:SetData("quantity", combinedQuant)
			return true
		elseif localQuant >= targetQuant then
			targetItem:SetData("quantity",item.maxStack)
			item:SetData("quantity",(localQuant - (item.maxStack - targetQuant)))
			return false
		else
			targetItem:SetData("quantity",(targetQuant - (item.maxStack - localQuant)))
			item:SetData("quantity",item.maxStack)
			return false
		end
	end,
}

ITEM.functions.use = {
	name = "Disassemble",
	tip = "useTip",
	icon = "icon16/stalker/scrap.png",
	isMulti = true,
	multiOptions = function(item, client)
		local targets = {}
		local char = client:GetCharacter()         
		
		if (char) then
			local inv = char:GetInventory()

			if (inv) then
				local items = inv:GetItems()

				for k, v in pairs(items) do
					if (v.repairCost) then
						table.insert(targets, {
							name = L("Disassemble "..v.name.." | Yields "..(math.Round(math.sqrt( v.repairCost )*item.compMultiplier*(1+(client:GetCharacter():GetAttribute("technician", 0)/100)), 0)*2).." components"),
							data = {v:GetID()},
						})
					else
						continue
					end
				end
			end
		end

		return targets
		end,
	OnCanRun = function(item)
		return (!IsValid(item.entity)) and !(item:GetData("equip"))
	end,
	OnRun = function(item, data)
		local client = item.player
		local char = client:GetCharacter()
		local inv = char:GetInventory()
		local items = inv:GetItems()
		local target = data[1]
		local cost = 0

		for k, invItem in pairs(items) do
			if (data[1]) then
				if (invItem:GetID() == data[1]) then
					target = invItem

					break
				end
			else
				client:Notify("No item selected.")
				return false
			end
		end

		cost = target.repairCost

		if math.sqrt( cost )/10 < item:GetData("quantity", 1) then
			client:GetChar():GetInventory():Add("component", 1, {["quantity"] = math.Round( (math.sqrt( cost )*item.compMultiplier*(1+(client:GetCharacter():GetAttribute("technician", 0)/100))*2), 0)})
			item:SetData("quantity", item:GetData("quantity", 1) - math.sqrt( cost ))
			target:Remove()
			item.player:EmitSound(item.sound or "items/battery_pickup.wav")
			ix.chat.Send(item.player, "iteminternal", "uses their "..item.name.." to disassemble their "..target.name.." into components.", false)
		else
			client:Notify("Not enough tool durability.")
		end

		return false
	end,
}