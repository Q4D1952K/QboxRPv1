if not Framework.QBox() then return end

function Framework.Notification(src, _msg, _type, _time)
    exports.qbx_core:Notify(src, _msg, _type, _time)
end

function Framework.getMoney(src, _type)
    local player = exports.qbx_core:GetPlayer(src)
    if _type == 'card' then
        _type = 'bank'
    end
    return player.Functions.GetMoney(_type)
end

function Framework.removeMoney(src, _type, amount)
    local player = exports.qbx_core:GetPlayer(src)
    if _type == 'card' then
        _type = 'bank'
    end
    player.Functions.RemoveMoney(_type, amount, 'buy shop')
end

function Framework.AddItem(src, _item, _amount, info)
    if Config.Inventory == 'ox' then
        return exports.ox_inventory:AddItem(src, _item, _amount, info)
    end
end

lib.callback.register('rep-shops:callback:getPlayerLicense', function(source)
    local src = source
    local player = exports.qbx_core:GetPlayer(src)
    return player.PlayerData.metadata["licences"]
end)