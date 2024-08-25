if not Framework.QBox() then return end

function Framework.Salary(src, _type)
    local player = exports.qbx_core:GetPlayer(src)
    local money = Config.Shipments[_type].salary
    local group = exports["rep-tablet"]:getGroupByMembers(src)
    local mem = exports["rep-tablet"]:getGroupSize(group)
    -- exports['Renewed-Banking']:addAccountMoney('postop', math.floor((money * 50) / 100)) -- If u want add money to PostOp
    if mem == 2 then
        money = math.floor(money * 1.5)
    end
    -- if u want use psbuff
    -- local buff = exports['ps-buffs']:HasBuff(player.PlayerData.citizenid, "lucky")
    -- if buff then
    --     money = math.floor(money * 1.5)
    -- end
    player.Functions.AddMoney('cash', money, 'postop')
    -- if u want to add rep for job
    -- local x = Player.Functions.GetRep('postop')
    -- Player.Functions.AddRep('postop', x + 1)
end

function Framework.Notification(src, _msg, _type, _time)
    exports.qbx_core:Notify(src, _msg, _type, _time)
end

function Framework.getIdentifier(src)
    local player = exports.qbx_core:GetPlayer(src)
    return player.PlayerData.citizenid
end