if not Framework.QBox() then return end

function Framework.Salary(src)
    local money = Config.Trash.payments
    local amount = Config.Trash.recyclablematerial.amount
    local player = exports.qbx_core:GetPlayer(src)
    -- if u want use psbuff
    -- local buff = exports['ps-buffs']:HasBuff(player.PlayerData.citizenid, "lucky")
    -- if buff then
    --     money = math.floor(money * 1.5)
    --     amount = math.floor(amount * Config.buffMatsMultiplier)
    -- end
    player.Functions.AddMoney('cash', money, 'sanitation')
    exports.ox_inventory:AddItem(src, Config.Trash.recyclablematerial.item, amount, {quality = 10})
end

function Framework.AddItem(src, item, amount)
    exports.ox_inventory:AddItem(src, item, amount)
end

function Framework.RemoveItem(src, item, amount)
    return exports.ox_inventory:RemoveItem(src, item, amount)
end

function Framework.Notification(src, _msg, _type, _time)
    exports.qbx_core:Notify(src, _msg, _type, _time)
end
