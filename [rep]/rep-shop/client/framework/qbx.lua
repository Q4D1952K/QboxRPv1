if not Framework.QBox() then return end
local QBX = exports.qbx_core

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    Wait(5000)
    initShop()
end)

function Framework.getWeight()
    return exports.ox_inventory:GetPlayerWeight()
end
function Framework.checkJob(filters)
    return QBX:HasGroup(filters)
end

function Framework.Notification(_msg, _type, _time)
    QBX:Notify(_msg, _type, _time)
end

function Framework.getMoney(name)
    return QBX:GetPlayerData().money[name] or 0
end