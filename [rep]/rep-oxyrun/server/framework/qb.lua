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

function Framework.RemoveItem(src, _item, _amount)
    if Config.Inventory == 'ox' then
        return exports.ox_inventory:RemoveItem(src, _item, _amount)
    elseif Config.Inventory == 'qs' then
        return exports['qs-inventory']:RemoveItem(src, _item, _amount)
    elseif Config.Inventory == 'new_qb' then
        return exports['qb-inventory']:RemoveItem(src, _item, _amount)
    elseif Config.Inventory == 'old_qb' then
        local Player = QBCore.Functions.GetPlayer(src)
        return Player.Functions.RemoveItem(_item, _amount)
    end
end

function Framework.Reward(src)
    local Player = QBCore.Functions.GetPlayer(src)
    Framework.AddItem(src, 'oxy', math.random(1, 3))
    local chance = math.random(0 , 100)
    if chance <= 10 then
        Framework.AddItem(src, 'vpn', 1)
    end
    if chance <= 50 then
        local _amount = math.random(30, 60)
        if Framework.RemoveItem(src, 'rolls', _amount) then
            Player.Functions.AddMoney('cash', _amount * math.random(45 , 100), 'oxyrun-cleanmoney')
        end
    end
    if chance > 45 and chance < 66 then
        local _amount = math.random(5, 10)
        if Framework.RemoveItem(src, 'bands', _amount) then
            Player.Functions.AddMoney('cash', _amount * math.random(450 , 550), 'oxyrun-cleanmoney')
        end
    end
end

function Framework.finalReward(src)
    Framework.AddItem(src, 'rolls', math.random(10, 20))
end

lib.callback.register('rep-oxyrun:callback:checkOwner', function(source, plate)
    MySQL.query('SELECT * FROM player_vehicles WHERE plate = ?',{plate}, function(result)
        if result[1] then
            return true
        else
            return false
        end
    end)
end)