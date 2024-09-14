function spawnVeh(src, _index)
    local ped = GetPlayerPed(src)
    local coords = GetEntityCoords(ped)
    local randomIndex = math.random(1, #Config.CustomerCars)
    local randomCar = Config.CustomerCars[randomIndex]
    local _pos = Config.JobLocations[_index].pos
    local veh = CreateVehicle(joaat(randomCar), coords.x, coords.y, coords.z + 7.5, _pos.w, true, true)
    while not DoesEntityExist(veh) do Wait(0) end
    SetEntityDistanceCullingRadius(veh, 30000.0) -- So this entity will be visible by all clients at any distance
    SetEntityCoords(veh, _pos.x, _pos.y, _pos.z)
    SetEntityHeading(veh, _pos.w)
    SetVehicleDoorsLocked(veh, 2)
    return veh
end