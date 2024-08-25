if not Framework.ESX() then return end

local ESX = exports.es_extended:getSharedObject()

function Framework.Salary(src, _type)
    local xPlayer = ESX.GetPlayerFromId(src)
    local money = Config.Shipments[_type].salary
    local group = exports["rep-tablet"]:getGroupByMembers(src)
    local mem = exports["rep-tablet"]:getGroupSize(group)
    if mem == 2 then
        money = math.floor(money * 1.5)
    end
    xPlayer.addAccountMoney('money', money, 'postop')
end

function Framework.Notification(src, msg, type , time)
    local xPlayer = ESX.GetPlayerFromId(src)
    xPlayer.showNotification(msg, type , time)
end

function Framework.getIdentifier(src)
    local xPlayer = ESX.GetPlayerFromId(src)
    return xPlayer.identifier
end