if not Framework.ESX() then return end

local ESX = exports.es_extended:getSharedObject()

RegisterNetEvent("esx:playerLoaded", function(xPlayer, isNew)
    Wait(5000)
    if Config.UseTalkNPC then
        talkNPC()
    else
        targetNPC()
    end
    for _index, _value in pairs(Config.JobLocations) do
        if Config.Target == 'ox_target' then
            exports.ox_target:addSphereZone({
                coords = _value.pickupPackage,
                radius = 1.0,
                drawSprite = true,
                options = {
                    {
                        onSelect = function()
                            TriggerServerEvent('rep-oxyrun:server:stage3', dropPack)
                        end,
                        icon = Lang.target.getpack.icon,
                        label = Lang.target.getpack.label,
                        distance = 1.5,
                        canInteract = function(entity, distance, data)
                            return onJob and currentProgress == 'get' and pickUpPos == _index and not hasItem(Config.Items['package'], 1)
                        end,
                    },
                },
            })
        else
            exports[Config.Target]:AddCircleZone("oxyGetPack_".._index, _value.pickupPackage, 1.0, {
                name = "oxyGetPack_".._index,
                debugPoly = false,
            }, {
                options = {
                {
                    icon = Lang.target.droppack.icon,
                    label = Lang.target.droppack.label,
                    action = function(entity)
                        TriggerServerEvent('rep-oxyrun:server:stage3', dropPack)
                    end,
                    canInteract = function(entity, distance, data)
                        return onJob and currentProgress == 'get' and pickUpPos == _index and not hasItem(Config.Items['package'], 1)
                    end,
                    drawDistance = 10.0,
                    drawColor = {255, 255, 255, 255},
                    successDrawColor = {30, 144, 255, 255},
                }
                },
                distance = 1.5,
            })
        end
    end
end)

function Framework.GetCurrentCop()
    return lib.callback.await('rep-oxyrun:callback:GetCurrentCop', false)
end

function Framework.Notification(_msg, _type, _time)
    ESX.ShowNotification(_msg, _type, _time)
end