lib.callback.register('rep-oxyrun:callback:spawnObj', function(source, _model, _pos)
    local obj = CreateObject(joaat(_model), _pos, _pos, _pos, true, true, false)
    while not DoesEntityExist(obj) do Wait(0) end
    while NetworkGetEntityOwner(obj) ~= source do Wait(0) end
    return NetworkGetNetworkIdFromEntity(obj)
end)

lib.callback.register('rep-oxyrun:callback:vehSpawn', function(source, _model, _pos)
    local veh = CreateVehicle(_model, _pos.x, _pos.y, _pos.z, _pos.w, true, true)
    while not DoesEntityExist(veh) do Wait(0) end
    while NetworkGetEntityOwner(veh) ~= source do Wait(0) end
    return NetworkGetNetworkIdFromEntity(veh)
end)

lib.callback.register('rep-oxyrun:callback:spawnPed', function(source, _model, _pos)
    local _ped = CreatePed(0, _model, _pos.x, _pos.y, _pos.z, _pos.w, true, true)
    while not DoesEntityExist(_ped) do Wait(0) end
    while NetworkGetEntityOwner(_ped) ~= source do Wait(0) end
    local idGroup = exports["rep-tablet"]:getGroupByMembers(source)
    local leader = exports["rep-tablet"]:GetGroupLeader(idGroup)
    Routes[leader].ped = _ped
    return NetworkGetNetworkIdFromEntity(_ped)
end)

lib.callback.register('rep-oxyrun:callback:spawnPedInCar', function(source, _model, car)
    local _ped = CreatePedInsideVehicle(NetworkGetEntityFromNetworkId(car), 26, _model, -1, true, true)
    while not DoesEntityExist(_ped) do Wait(0) end
    while NetworkGetEntityOwner(_ped) ~= source do Wait(0) end
    local idGroup = exports["rep-tablet"]:getGroupByMembers(source)
    local leader = exports["rep-tablet"]:GetGroupLeader(idGroup)
    Routes[leader].ped = _ped
    return NetworkGetNetworkIdFromEntity(_ped)
end)

RegisterNetEvent('rep-oxyrun:server:delEntity', function (objId)
    local obj = NetworkGetEntityFromNetworkId(objId)
    if DoesEntityExist(obj) then
        DeleteEntity(obj)
    end
end)

