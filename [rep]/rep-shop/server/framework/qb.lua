if not Framework.QBCore() or Framework.QBox() then return end

local QBCore = exports['qb-core']:GetCoreObject()

function Framework.Notification(src, msg, type , time)
    TriggerClientEvent('QBCore:Notify', src, msg, type, time)
end

function Framework.getMoney(src, _type)
    local Player = QBCore.Functions.GetPlayer(src)
    if _type == 'card' then
        _type = 'bank'
    end
    return Player.PlayerData.money[_type]
end

function Framework.removeMoney(src, _type, amount)
    local Player = QBCore.Functions.GetPlayer(src)
    if _type == 'card' then
        _type = 'bank'
    end
    Player.Functions.RemoveMoney(_type, amount, 'buy shop')
end

function Framework.AddItem(src, _item, _amount, info)
    if Config.Inventory == 'ox' then
        return exports.ox_inventory:AddItem(src, _item, _amount, info)
    elseif Config.Inventory == 'new_qb' then
        return exports['qb-inventory']:AddItem(src, _item, _amount, false, info)
    elseif Config.Inventory == 'old_qb' then
        local Player = QBCore.Functions.GetPlayer(src)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[_item], 'add', _amount)
        return Player.Functions.AddItem(_item, _amount, false, info)
    end
end

lib.callback.register('rep-shops:callback:getPlayerLicense', function(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    return Player.PlayerData.metadata["licences"]
end)