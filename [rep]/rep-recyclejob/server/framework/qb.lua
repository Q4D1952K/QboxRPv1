if not Framework.QBCore() or Framework.QBox() then return end

local QBCore = exports['qb-core']:GetCoreObject()

function Framework.Notification(src, msg, type , time)
    TriggerClientEvent('QBCore:Notify', src, msg, type, time)
end

function Framework.AddItem(src, _item, _amount)
    if Config.Inventory == 'ox' then
        return exports.ox_inventory:AddItem(src, _item, _amount)
    elseif Config.Inventory == 'new-qb' then
        return exports['qb-inventory']:AddItem(src, _item, _amount)
    elseif Config.Inventory == 'old-qb' then
        local Player = QBCore.Functions.GetPlayer(src)
        return Player.Functions.AddItem(_item, _amount)
    end
end

function Framework.RemoveItem(src, _item, _amount)
    if Config.Inventory == 'ox' then
        return exports.ox_inventory:RemoveItem(src, _item, _amount)
    elseif Config.Inventory == 'new-qb' then
        return exports['qb-inventory']:RemoveItem(src, _item, _amount)
    elseif Config.Inventory == 'old-qb' then
        local Player = QBCore.Functions.GetPlayer(src)
        return Player.Functions.RemoveItem(_item, _amount)
    end
end
