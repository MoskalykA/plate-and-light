AddEvent("OnKeyRelease", function(player, key, vehicle)
    if GetPlayerVehicle(player) == 0 then
        return
    end

    if GetVehicleDriver(vehicle) == false then
        return
    end

    if key == "L" then
        SetVehicleLightEnabled(vehicle, true)
    end

end)