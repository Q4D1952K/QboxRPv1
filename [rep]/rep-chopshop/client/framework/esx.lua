if not Framework.ESX() then return end

local ESX = exports.es_extended:getSharedObject()

RegisterNetEvent("esx:playerLoaded", function(xPlayer, isNew)
    Wait(5000)
    if Config.UseTalkNPC then
        talkNPC()
    else
        targetNPC()
    end
    init()
end)

function Framework.GetCurrentCop()
    return lib.callback.await('rep-chopshop:callback:GetCurrentCop', false)
end

function Framework.Notification(_msg, _type, _time)
    ESX.ShowNotification(_msg, _type, _time)
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