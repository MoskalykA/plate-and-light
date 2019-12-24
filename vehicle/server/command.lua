function cmd_v(player, model)
	if (model == nil) then
		return AddPlayerChat(player, "/v <model>")
	end

	model = tonumber(model)

	if (model < 1 or model > 25) then
		return AddPlayerChat(player, "The model does not exist")
	end

	local x, y, z = GetPlayerLocation(player)
	local h = GetPlayerHeading(player)

	local vehicle = CreateVehicle(model, x, y, z, h)
	if (vehicle == false) then
		return AddPlayerChat(player, "The vehicle does not know how to create!")
	end

	SetVehicleLicensePlate(vehicle, "AR-"..Random(10, 99).."-MO")
	AttachVehicleNitro(vehicle, true)

	SetPlayerInVehicle(player, vehicle)

end

function cmd_vcolor(player, r, g, b)
	if (r == nil or g == nil or b == nil) then
		return AddPlayerChat(player, "/vcolor <r> <g> <b>")
	end

	local vehicle = GetPlayerVehicle(player)

	if (vehicle == 0) then
		return AddPlayerChat(player, "You must be in a vehicle")
	end

	if (GetPlayerVehicleSeat(player) ~= 1) then
		return AddPlayerChat(player, "You must be the driver of the vehicle")
	end

	SetVehicleColor(vehicle, RGB(r, g, b))
end

AddCommand("v", cmd_v)
AddCommand("vcolor", cmd_vcolor)