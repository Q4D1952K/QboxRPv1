lib.callback.register('rep-recyclejob:callback:spawnObj', function(source)
    local ped = GetPlayerPed(source)
    local coord = GetEntityCoords(ped)
    local obj = CreateObject(joaat('prop_cs_cardbox_01'), coord.x, coord.y, coord.z, true, true, false)
    while not DoesEntityExist(obj) do Wait(0) end
    while NetworkGetEntityOwner(obj) ~= source do Wait(0) end
    return NetworkGetNetworkIdFromEntity(obj)
end)
