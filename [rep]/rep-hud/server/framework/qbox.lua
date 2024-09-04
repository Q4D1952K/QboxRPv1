AddEventHandler('ox_inventory:openedInventory', function(source)
    TriggerClientEvent('rep-hud:client:hideHud', source)
end)

AddEventHandler('ox_inventory:closedInventory', function(source)
    TriggerClientEvent('rep-hud:client:showHud', source)
end)

lib.addCommand('cinematic', {
    help = 'Toggle Cinematic',
    params = {},
}, function(source, args, raw)
    TriggerClientEvent('rep-hud:client:toogleCinematic', source)
end)

RegisterNetEvent('hud:server:GainStress', function(amount)
    local src = source
    local player = exports.qbx_core:GetPlayer(src)
    local newStress
    if not player or (Config.DisablePoliceStress and player.PlayerData.job.type == 'leo') then return end
    if not player.PlayerData.metadata.stress then
        player.PlayerData.metadata.stress = 0
    end
    newStress = player.PlayerData.metadata.stress + amount
    if newStress <= 0 then newStress = 0 end
    if newStress > 100 then
        newStress = 100
    end
    player.Functions.SetMetaData('stress', newStress)
    TriggerClientEvent('hud:client:UpdateStress', src, newStress)
    exports.qbx_core:Notify(src, "Feeling More Stressed!", 'error', 2500, nil, nil, {'#141517', '#ffffff'}, 'brain', '#C53030')
end)

RegisterNetEvent('hud:server:RelieveStress', function(amount)
    local src = source
    local player = exports.qbx_core:GetPlayer(src)
    local newStress
    if not player then return end
    if not player.PlayerData.metadata.stress then
        player.PlayerData.metadata.stress = 0
    end
    newStress = player.PlayerData.metadata.stress - amount
    if newStress <= 0 then newStress = 0 end
    player.Functions.SetMetaData('stress', newStress)
    TriggerClientEvent('hud:client:UpdateStress', src, newStress)
    exports.qbx_core:Notify(src, "Feeling More Relaxed!", 'success', 2500, nil, nil, {'#141517', '#ffffff'}, 'brain', '#0F52BA')
end)

lib.callback.register('rep-hud:callback:getMem', function ()
    return #exports.qbx_core:GetQBPlayers()
end)