if not Framework.QBox() then return end

lib.callback.register('rep-chopshop:callback:GetCurrentCop', function()
    return exports.qbx_core:GetDutyCountType('leo')
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

function Framework.AddReward(src, _type)
    if _type == 'tyre' then
        Framework.AddItem(src, 'car_wheel', 1)
    elseif _type == 'trunk' then
        Framework.AddItem(src, 'car_trunk', 1)
    elseif _type == 'door' then
        Framework.AddItem(src, 'car_door', 1)
    end
end