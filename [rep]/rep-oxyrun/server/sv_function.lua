lib.callback.register('rep-oxyrun:callback:spawnObj', function(source, _model, _pos)
    local obj = CreateObject(joaat(_model), _pos, _pos, _pos, true, true, false)
    while not DoesEntityExist(obj) do Wait(0) end
    while NetworkGetEntityOwner(obj) ~= source do Wait(0) end
    return NetworkGetNetworkIdFromEntity(obj)
end)

lib.callback.register('rep-oxyrun:callback:vehSpawn', function(source, _model, _pos, _pedModel)
    local ped = GetPlayerPed(source)
    local coords = GetEntityCoords(ped)
    local veh = CreateVehicle(_model, coords.x, coords.y, coords.z + 7.5, _pos.w, true, true)
    while not DoesEntityExist(veh) do Wait(0) end
    SetEntityDistanceCullingRadius(veh, 30000.0) -- So this entity will be visible by all clients at any distance
    SetEntityCoords(veh, _pos.x, _pos.y, _pos.z)
    SetEntityHeading(veh, _pos.w)
    Wait(2000)
    local _ped = CreatePed(0, joaat(_pedModel), coords.x, coords.y, coords.z - 3.0, _pos.w, true, true)
    while not DoesEntityExist(_ped) do Wait(0) end
    SetEntityDistanceCullingRadius(_ped, 30000.0) -- So this entity will be visible by all clients at any distance
    SetEntityCoords(_ped, _pos.x, _pos.y, _pos.z)
    TaskWarpPedIntoVehicle(_ped, veh, -1)
    Wait(2000)
    return NetworkGetNetworkIdFromEntity(veh), NetworkGetNetworkIdFromEntity(_ped)
end)

lib.callback.register('rep-oxyrun:callback:spawnPed', function(source, _model, _pos)
    local ped = GetPlayerPed(source)
    local coords = GetEntityCoords(ped)
    local _ped = CreatePed(0, _model, coords.x, coords.y, coords.z - 3.0, _pos.w, true, true)
    while not DoesEntityExist(_ped) do Wait(0) end
    SetEntityDistanceCullingRadius(_ped, 30000.0) -- So this entity will be visible by all clients at any distance
    SetEntityCoords(_ped, _pos.x, _pos.y, _pos.z)
    SetEntityHeading(_ped, _pos.w)
    local idGroup = exports["rep-tablet"]:getGroupByMembers(source)
    local leader = exports["rep-tablet"]:GetGroupLeader(idGroup)
    Routes[leader].ped = _ped
    Wait(1000)
    return NetworkGetNetworkIdFromEntity(_ped)
end)

RegisterNetEvent('rep-oxyrun:server:delEntity', function (objId)
    local obj = NetworkGetEntityFromNetworkId(objId)
    if DoesEntityExist(obj) then
        DeleteEntity(obj)
    end
end)