function onSay(player, words, param)
	if not player:getGroup():getAccess() then
		return true
	end

	if player:getAccountType() < ACCOUNT_TYPE_GOD then
		return false
	end

	local params = param:split(" ")
	local ticks = -1
	if (#params > 1) then

		local v = tonumber(params[#params])
		if (v ~= nil) then

			ticks = 1000 * v
		end
		param = param:gsub(" " .. params[#params], "")
	end
		
	local itemType = ItemType(param)
	if itemType:getId() == 0 then
		itemType = ItemType(tonumber(param))
		if itemType:getId() == 0 then
			player:sendCancelMessage("There is no item with that id or name.")
			return false
		end
	end
	
	local condition = Condition(CONDITION_OUTFIT, CONDITIONID_COMBAT)
	condition:setTicks(ticks)
	
	condition:setOutfit(itemType:getId())
	player:addCondition(condition)
	return true
end
