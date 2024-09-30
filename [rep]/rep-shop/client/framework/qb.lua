if not Framework.QBCore() or Framework.QBox() then return end

local QBCore = exports['qb-core']:GetCoreObject()
local PlayerData = QBCore.Functions.GetPlayerData()

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    Wait(5000)
    PlayerData = QBCore.Functions.GetPlayerData()
    initShop()
end)

RegisterNetEvent('QBCore:Player:SetPlayerData', function(value)
    PlayerData = value
end)

function Framework.getWeight()
    if Config.OxInventory then
        return exports.ox_inventory:GetPlayerWeight()
    else
        local weight = 0
        local PlayerData = QBCore.Functions.GetPlayerData()
        for _, itemData in pairs(PlayerData.items) do
            if items[itemData.name] then
                weight += itemData.amount * items[itemData.name]['weight']
            end
        end
        return weight
    end
end

function Framework.checkJob(filters)
    local _type = type(filters)
    if _type == 'string' then
        return PlayerData.job.name == filters
    elseif _type == 'table' then
        local tabletype = table.type(filters)
        if tabletype == 'hash' then
            for name, grade in pairs(filters) do
                if PlayerData.job.name == name and grade <= PlayerData.job.grade.level then
                    return true
                end
            end
        elseif tabletype == 'array' then
            for j = 1, #filters do
                local name = filters[j]
                if PlayerData.job.name == name then
                    return true
                end
            end
        end
    end
end

function Framework.Notification(_msg, _type, _time)
    QBCore.Functions.Notify(_msg, _type, _time)
end


function Framework.getMoney(name)
    return QBCore.Functions.GetPlayerData().money[name] or 0
end