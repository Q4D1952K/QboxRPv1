if not Framework.QBox() then return end
local QBX = exports.qbx_core

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    Wait(5000)
    initScript()
end)

function Framework.Notification(_msg, _type, _time)
    QBX:Notify(_msg, _type, _time)
end