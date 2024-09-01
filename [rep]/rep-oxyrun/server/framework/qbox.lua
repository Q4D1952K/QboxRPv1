if not Framework.QBox() then return end

lib.callback.register('rep-oxyrun:callback:GetCurrentCop', function()
    return exports.qbx_core:GetDutyCountType('leo')
end)

lib.callback.register('rep-oxyrun:callback:checkOwner', function(plate)
    MySQL.query('SELECT * FROM player_vehicles WHERE plate = ?',{plate}, function(result)
        if result[1] then
            return true
        else
            return false
        end
    end)
end)

function Framework.Notification(src, _msg, _type, _time)
    exports.qbx_core:Notify(src, _msg, _type, _time)
end

function Framework.AddItem(src, _item, _amount)
    if Config.Inventory == 'ox' then
        return exports.ox_inventory:AddItem(src, _item, _amount)
    elseif Config.Inventory == 'qs' then
        return exports['qs-inventory']:AddItem(src, _item, _amount)
    end
end

function Framework.RemoveItem(src, _item, _amount)
    if Config.Inventory == 'ox' then
        return exports.ox_inventory:RemoveItem(src, _item, _amount)
    elseif Config.Inventory == 'qs' then
        return exports['qs-inventory']:RemoveItem(src, _item, _amount)
    end
end

function Framework.Reward(src)
    local player = exports.qbx_core:GetPlayer(src)
    Framework.AddItem(src, 'oxy', math.random(1, 3))
    local chance = math.random(0 , 100)
    if chance <= 10 then
        Framework.AddItem(src, 'vpn', 1)
    end
    if chance <= 50 then
        local _amount = math.random(30, 60)
        if Framework.RemoveItem(src, 'rolls', _amount) then
            player.Functions.AddMoney('cash', _amount * math.random(45 , 100), 'oxyrun-cleanmoney')
        end
    end
    if chance > 45 and chance < 66 then
        local _amount = math.random(5, 10)
        if Framework.RemoveItem(src, 'bands', _amount) then
            player.Functions.AddMoney('cash', _amount * math.random(450 , 550), 'oxyrun-cleanmoney')
        end
    end
end

function Framework.finalReward(src)
    Framework.AddItem(src, 'rolls', math.random(10, 20))
end