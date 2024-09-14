if not Framework.ESX() then return end

local ESX = exports.es_extended:getSharedObject()

lib.callback.register('rep-chopshop:callback:GetCurrentCop', function()
    local xPlayers = ESX.GetExtendedPlayers('job', 'police')
    return #xPlayers
end)

function Framework.Notification(src, msg, type , time)
    local xPlayer = ESX.GetPlayerFromId(src)
    xPlayer.showNotification(msg, type , time)
end

function Framework.AddItem(src, item, amount)
    local xPlayer = ESX.GetPlayerFromId(src)
    if Config.OxInventory then
        return exports.ox_inventory:AddItem(src, item, amount)
    elseif Config.Inventory == 'qs' then
        return exports['qs-inventory']:AddItem(src, item, amount)
    else
        xPlayer.addInventoryItem(item, amount)
        return true
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