if not Framework.QBox() then return end

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    if Config.UseTalkNPC then
        talkNPC()
    else
        targetNPC()
    end
end)

function Framework.Notification(_msg, _type, _time)
    exports.qbx_core:Notify(_msg, _type, _time)
end