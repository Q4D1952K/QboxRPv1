if not Framework.ESX() then return end

local ESX = exports.es_extended:getSharedObject()

function Framework.Salary(src)
    local xPlayer = ESX.GetPlayerFromId(src)
    xPlayer.addAccountMoney('money', Config.Trash.payments, 'sanitation')
    if Config.OxInventory then
        exports.ox_inventory:AddItem(src, Config.Trash.recyclablematerial.item, Config.Trash.recyclablematerial.amount, {quality = 10})
    else
        xPlayer.addInventoryItem(Config.Trash.recyclablematerial.item, Config.Trash.recyclablematerial.amount)
    end
end

function Framework.AddItem(src, item, amount)
    local xPlayer = ESX.GetPlayerFromId(src)
    if Config.OxInventory then
        exports.ox_inventory:AddItem(src, item, amount)
    else
        xPlayer.addInventoryItem(item, amount)
    end
end

function Framework.RemoveItem(src, item, amount)
    local xPlayer = ESX.GetPlayerFromId(src)
    if Config.OxInventory then
        return exports.ox_inventory:RemoveItem(src, item, amount)
    else
        local name, has = xPlayer.hasItem(item)
        if name and amount >= has then
            xPlayer.removeInventoryItem(item, amount)
            return true
        end
        return false
    end
end

lib.callback.register('rep-sanitation:callback:getItems', function(source, cb)
    local items = {}
    local response = MySQL.query.await('SELECT `name`, `label` FROM `items`')
    if response then
        for i = 1, #response do
            local row = response[i]
            items[#items+1] = {name = row.name, label = row.label}
        end
    end
    return items
end)

function Framework.Notification(src, msg, type , time)
    local xPlayer = ESX.GetPlayerFromId(src)
    xPlayer.showNotification(msg, type , time)
end