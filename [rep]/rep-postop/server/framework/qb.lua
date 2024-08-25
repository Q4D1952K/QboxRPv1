if not Framework.QBCore() then return end

local QBCore = exports['qb-core']:GetCoreObject()

function Framework.Salary(src, _type)
    local Player = QBCore.Functions.GetPlayer(src)
    local money = Config.Shipments[_type].salary
    local group = exports["rep-tablet"]:getGroupByMembers(src)
    local mem = exports["rep-tablet"]:getGroupSize(group)
    -- exports['Renewed-Banking']:addAccountMoney('postop', math.floor((money * 50) / 100)) -- If u want add money to PostOp
    if mem == 2 then
        money = math.floor(money * 1.5)
    end
    -- if u want use psbuff
    -- local buff = exports['ps-buffs']:HasBuff(Player.PlayerData.citizenid, "lucky")
    -- if buff then
    --     money = math.floor(money * 1.5)
    -- end
    Player.Functions.AddMoney('cash', money, 'postop')
    -- if u want to add rep for job
    -- local x = Player.Functions.GetRep('postop')
    -- Player.Functions.AddRep('postop', x + 1)
end

function Framework.Notification(src, msg, type , time)
    TriggerClientEvent('QBCore:Notify', src, msg, type, time)
end

function Framework.getIdentifier(src)
    local Player = QBCore.Functions.GetPlayer(src)
    return Player.PlayerData.citizenid
end