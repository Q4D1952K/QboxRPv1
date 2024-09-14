if not Framework.QBCore() or Framework.QBox() then return end
local CurrentCops = 0
local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    Wait(5000)
    if Config.UseTalkNPC then
        talkNPC()
    else
        targetNPC()
    end
    init()
end)

RegisterNetEvent('police:SetCopCount', function(amount) -- Update your police count
    CurrentCops = amount
end)

function Framework.GetCurrentCop()
    return CurrentCops
end

function Framework.Notification(_msg, _type, _time)
    QBCore.Functions.Notify(_msg, _type, _time)
end

function Framework.Progressbar(_name, _label, _duration, _canCancel, _onFinish, _onCancel)
    if lib.progressCircle({
        duration = _duration,
        label = _label,
        position = 'bottom',
        useWhileDead = false,
        canCancel = _canCancel,
    }) then
        if _onFinish then
            _onFinish()
        end
    else
        if _onCancel then
            _onCancel()
        end
    end
end