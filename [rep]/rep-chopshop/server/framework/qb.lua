if not Framework.QBCore() or Framework.QBox() then return end

local QBCore = exports['qb-core']:GetCoreObject()

function Framework.Notification(src, msg, type , time)
    TriggerClientEvent('QBCore:Notify', src, msg, type, time)
end

function Framework.AddItem(src, _item, _amount)
    if Config.Inventory == 'ox' then
        return exports.ox_inventory:AddItem(src, _item, _amount)
    elseif Config.Inventory == 'qs' then
        return exports['qs-inventory']:AddItem(src, _item, _amount)
    elseif Config.Inventory == 'new_qb' then
        return exports['qb-inventory']:AddItem(src, _item, _amount)
    elseif Config.Inventory == 'old_qb' then
        local Player = QBCore.Functions.GetPlayer(src)
        return Player.Functions.AddItem(_item, _amount)
    end
end

function Framework.AddReward(src, _type)
    if _type == 'tyre' then
        Framework.AddItem(src, 'car_wheel', 1)
    elseif _type == 'trunk' then
        Framework.AddItem(src, 'car_trunk', 1)
    elseif _type == 'door' then
        Framework.AddItem(src, 'car_door', 1)
    end
end