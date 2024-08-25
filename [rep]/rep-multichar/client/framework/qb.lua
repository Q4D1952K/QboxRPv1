if not Framework.QBCore() then return end

local QBCore = exports['qb-core']:GetCoreObject()

Framework.PlayerData = QBCore.Functions.GetPlayerData()

function Framework.GetPlayerGender()
    Framework.PlayerData = QBCore.Functions.GetPlayerData()
    if tonumber(Framework.PlayerData.charinfo.gender) == 1 then
        return "Female"
    end
    return "Male"
end
