if not Framework.ESX() then return end

local ESX = exports.es_extended:getSharedObject()

RegisterNetEvent("esx:playerLoaded", function(xPlayer, isNew)
    Wait(5000)
    initScript()
end)

function Framework.Notification(_msg, _type, _time)
    ESX.ShowNotification(_msg, _type, _time)
end