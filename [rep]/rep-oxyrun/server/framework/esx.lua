if not Framework.ESX() then return end

local ESX = exports.es_extended:getSharedObject()

lib.callback.register('rep-oxyrun:callback:GetCurrentCop', function()
    local xPlayers = ESX.GetExtendedPlayers('job', 'police')
    return #xPlayers
 end)

 lib.callback.register('rep-oxyrun:callback:checkOwner', function(plate)
    MySQL.query('SELECT * FROM owned_vehicles WHERE plate = ?',{plate}, function(result)
        if result[1] then
            return true
        else
            return false
        end
    end)
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

function Framework.RemoveItem(src, _item, _amount)
    if Config.Inventory == 'ox' then
        return exports.ox_inventory:RemoveItem(src, _item, _amount)
    elseif Config.Inventory == 'qs' then
        return exports['qs-inventory']:RemoveItem(src, _item, _amount)
    else
        local xPlayer = ESX.GetPlayerFromId(src)
        local name, has = xPlayer.hasItem(_item)
        if name and amount >= has then
            xPlayer.removeInventoryItem(_item, amount)
            return true
        end
        return false
    end
end

function Framework.Reward(src)
    local xPlayer = ESX.GetPlayerFromId(src)
    Framework.AddItem(src, 'oxy', math.random(1, 3))
    local chance = math.random(0 , 100)
    if chance <= 10 then
        Framework.AddItem(src, 'vpn', 1)
    end
    if chance <= 50 then
        local _amount = math.random(30, 60)
        if Framework.RemoveItem(src, 'rolls', _amount) then
            xPlayer.addAccountMoney('money', _amount * math.random(45 , 100), 'oxyrun-cleanmoney')
        end
    end
    if chance > 45 and chance < 66 then
        local _amount = math.random(5, 10)
        if Framework.RemoveItem(src, 'bands', _amount) then
            xPlayer.addAccountMoney('money', _amount * math.random(450 , 550), 'oxyrun-cleanmoney')
        end
    end
end

function Framework.finalReward(src)
    Framework.AddItem(src, 'rolls', math.random(10, 20))
end
