ITEM.name = "Anti-radiation drugs"
ITEM.description = "Features anti-radiation signs on the package."
ITEM.longdesc = "Mexaminum radiation protection drugs are common in the Zone. When used, this drug induces contraction of peripheral blood vessels and oxygen deprivation, which serve to treat and prevent radiation exposure. The drug does not have severe side effects, although isolated cases of mild nausea, dizziness, cramps and stomach pain have been reported."
ITEM.model = "models/kek1ch/dev_antirad.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.category = "Aid"
ITEM.sound = "stalkersound/inv_eat_pills.mp3"
ITEM.price = "250"
ITEM.busflag = {"medical2"}
ITEM.quantity = 2
ITEM.weight = 0.05

function ITEM:GetDescription()
	if (!self.entity or !IsValid(self.entity)) then
		local quant = self:GetData("quantity", self.quantity)
		local str = self.longdesc.."\n \nThere's only "..quant.." uses left."

		return str
	else
		return self.desc
	end
end

if (CLIENT) then
	function ITEM:PaintOver(item, w, h)

		draw.SimpleText(item:GetData("quantity", item.quantity).."/"..item.quantity, "DermaDefault", 3, h - 1, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, color_black)
	end
end

ITEM.functions.use = {
	name = "Swallow",
	icon = "icon16/stalker/swallow.png",
	OnRun = function(item)
		local quantity = item:GetData("quantity", item.quantity)
		item.player:AddBuff("buff_radiationremoval", 5, { amount = 5 })

		quantity = quantity - 1

		if (quantity >= 1) then
			item:SetData("quantity", quantity)
			return false
		end
		
		ix.chat.Send(item.player, "iteminternal", "swallows some "..item.name..".", false)
		
		return true
	end,
	OnCanRun = function(item)
		return (!IsValid(item.entity))
	end
}

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