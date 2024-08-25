lib.callback.register('rep-sanitation:callback:vehSpawn', function(source)
    Config.Vehicle.model = type(Config.Vehicle.model) == 'string' and joaat(Config.Vehicle.model) or Config.Vehicle.model
    local veh = CreateVehicle(Config.Vehicle.model, Config.Vehicle.spawnpos.x, Config.Vehicle.spawnpos.y, Config.Vehicle.spawnpos.z, Config.Vehicle.spawnpos.w, true, true)
    while not DoesEntityExist(veh) do Wait(0) end
    while NetworkGetEntityOwner(veh) ~= source do Wait(0) end
    return NetworkGetNetworkIdFromEntity(veh)
end)

lib.callback.register('rep-sanitation:callback:spawnObj', function(source)
    local ped = GetPlayerPed(source)
    local coord = GetEntityCoords(ped)
    local obj = CreateObject(joaat('prop_cs_rub_binbag_01'), coord.x, coord.y, coord.z, true, true, false)
    while not DoesEntityExist(obj) do Wait(0) end
    while NetworkGetEntityOwner(obj) ~= source do Wait(0) end
    return NetworkGetNetworkIdFromEntity(obj)
end)

RegisterNetEvent('rep-sanitation:server:delObj', function (objId)
    local obj = NetworkGetEntityFromNetworkId(objId)
    if DoesEntityExist(obj) then
        DeleteEntity(obj)
    end
end)