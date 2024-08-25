lib.callback.register('rep-postop:callback:vehSpawn', function(source, shipmentTypes)
    Config.Shipments[shipmentTypes].vehicle.model = type(Config.Shipments[shipmentTypes].vehicle.model) == 'string' and joaat(Config.Shipments[shipmentTypes].vehicle.model) or Config.Shipments[shipmentTypes].vehicle.model
    local veh = CreateVehicle(Config.Shipments[shipmentTypes].vehicle.model, Config.Shipments[shipmentTypes].vehicle.spawnpos.x, Config.Shipments[shipmentTypes].vehicle.spawnpos.y, Config.Shipments[shipmentTypes].vehicle.spawnpos.z, Config.Shipments[shipmentTypes].vehicle.spawnpos.w, true, true)
    while not DoesEntityExist(veh) do Wait(0) end
    while NetworkGetEntityOwner(veh) ~= source do Wait(0) end
    return NetworkGetNetworkIdFromEntity(veh)
end)

lib.callback.register('rep-postop:callback:spawnObj', function(source, _model)
    local ped = GetPlayerPed(source)
    local coord = GetEntityCoords(ped)
    local obj = CreateObject(joaat(_model), coord.x, coord.y, coord.z, true, true, false)
    while not DoesEntityExist(obj) do Wait(0) end
    while NetworkGetEntityOwner(obj) ~= source do Wait(0) end
    return NetworkGetNetworkIdFromEntity(obj)
end)

RegisterNetEvent('rep-postop:server:delObj', function (objId)
    local obj = NetworkGetEntityFromNetworkId(objId)
    if DoesEntityExist(obj) then
        DeleteEntity(obj)
    end
end)

lib.addCommand('postop', {
    help = "Assign tasks to your employees",
    params = {
        { name = 'shipmentTypes', help = "Shipment Types (expess, freight)" },
    },
}, function(source, args)
    if not args then return end
    if (not args['shipmentTypes']) or (args['shipmentTypes'] ~= 'express' and args['shipmentTypes'] ~= 'freight') then
        return
    end
    TriggerClientEvent('rep-postop:client:setShipmentTypes', source, args['shipmentTypes'])
end)

RegisterNetEvent('rep-postop:server:setShipmentTypes', function (targetId)
    TriggerClientEvent('rep-postop:client:shipmentTypes', targetId)
end)