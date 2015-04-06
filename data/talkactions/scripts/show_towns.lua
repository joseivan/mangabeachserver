function onSay(player, words, param)
	if not player:getGroup():getAccess() then
		return true
	end

	local msg = "Towns: "
	local towns = Game:getTowns()
	for k, v in pairs(towns) do

		local pos = v:getTemplePosition()
		msg = msg .. string.format(" {Name: %s, ID: %d, Temple { x: %d, y: %d, z: %d}}",
						v:getName(), v:getId(), pos.x, pos.y, pos.z)
	end

	player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, msg)			
	return true
end
