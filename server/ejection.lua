RegisterNetEvent('vehicle:player:eject', function (velocity)
    local playerPed = GetPlayerPed(source)
    local position = GetEntityCoords(playerPed)
    SetEntityCoords(playerPed, position.x, position.y, position.z - 0.5, true, true, true)
    SetEntityVelocity(playerPed, velocity)
    Wait(1)
    SetPedToRagdoll(playerPed, 1000, 1000, 0, false, false, false)
end)
