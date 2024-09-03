if not Framework.QBox() then return end
local QBX = exports.qbx_core

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    Wait(5000)
    if Config.UseTalkNPC then
        talkNPC()
    else
        targetNPC()
    end
    if Config.Target == 'ox_target' then
        exports.ox_target:addGlobalVehicle({
            {
                icon = Lang.target.start_cornerselling.icon,
                label = Lang.target.start_cornerselling.label,
                distance = 1.5,
                onSelect = function(data)
                    startConnerSelling(data.entity)
                end,
                canInteract = function(entity, distance, coords, name, bone)
                    return not cornerselling and not IsPedInAnyVehicle(cache.ped, false) and hasItem(Config.Items['weedbaggie'], 1) and Config.Cornerselling.status
                end,
            },
            {
                icon = Lang.target.stop_cornerselling.icon,
                label = Lang.target.stop_cornerselling.label,
                distance = 1.5,
                onSelect = function(data)
                    stopConnerSelling()
                end,
                canInteract = function(entity, distance, coords, name, bone)
                    return cornerselling and not IsPedInAnyVehicle(cache.ped, false) and Config.Cornerselling.status
                end,
            },
        })
        exports.ox_target:addGlobalPed({
            {
                icon = Lang.target.cornerselling.icon,
                label = Lang.target.cornerselling.label,
                distance = 1.5,
                onSelect = function(data)
                    connerSelling(data.entity)
                end,
                canInteract = function(entity, distance, coords, name, bone)
                    return cornerselling and listPedsSelling[entity] and not IsPedInAnyVehicle(PlayerPedId(), false) and Config.Cornerselling.status
                end,
            },
        })
    else
        exports[Config.Target]:AddGlobalVehicle({
            options = {
                {
                    icon = Lang.target.start_cornerselling.icon,
                    label = Lang.target.start_cornerselling.label,
                    action = function(entity)
                        startConnerSelling(entity)
                    end,
                    canInteract = function()
                        return not cornerselling and not IsPedInAnyVehicle(cache.ped, false) and hasItem(Config.Items['weedbaggie'], 1) and Config.Cornerselling.status
                    end,
                },
                {
                    icon = Lang.target.stop_cornerselling.icon,
                    label = Lang.target.stop_cornerselling.label,
                    action = function(entity)
                        stopConnerSelling()
                    end,
                    canInteract = function()
                        return cornerselling and not IsPedInAnyVehicle(cache.ped, false) and Config.Cornerselling.status
                    end,
                }
            },
            distance = 1.5,
        })
        exports[Config.Target]:AddGlobalPed({
            options = {
                {
                    icon = Lang.target.start_cornerselling.icon,
                    label = Lang.target.start_cornerselling.label,
                    type = "client",
                    action = function(entity)
                        connerSelling(entity)
                    end,
                    canInteract = function(entity)
                        return cornerselling and listPedsSelling[entity] and not IsPedInAnyVehicle(PlayerPedId(), false) and Config.Cornerselling.status
                    end,
                },
            },
            distance = 1.5,
        })
    end
    for k,v in pairs (Config.TacoShop.points) do
        if Config.Target == 'ox_target' then
            exports.ox_target:addSphereZone({
                coords = vector3(v.pos.x, v.pos.y, v.pos.z + 1.0),
                radius = 1.0,
                debug =  Config.Debug,
                drawSprite = true,
                distance = 1.5,
                options = {
                    {
                        icon = Lang.target.droppack.icon,
                        label = Lang.target.droppack.label,
                        onSelect = function(data)
                            dropPackage()
                        end,
                        canInteract = function(entity, distance, coords, name, bone)
                            if onDuty and tacoIndex == k and Config.TacoShop.status then
                                return true
                            end
                            return false
                        end,
                    }
                }
            })
        else
            exports[Config.Target]:AddCircleZone("tacoshop_"..k, vector3(v.pos.x, v.pos.y, v.pos.z + 1.0), 1.0, {
                name = "tacoshop_"..k,
                debugPoly = Config.Debug,
            }, {
                options = {
                    {
                        icon = Lang.target.droppack.icon,
                        label = Lang.target.droppack.label,
                        action = function(entity)
                            dropPackage()
                        end,
                        canInteract = function(entity, distance, data)
                            if onDuty and tacoIndex == k and Config.TacoShop.status then
                                return true
                            end
                            return false
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
    local _model = {}
    for k,v in pairs(Config.Plant.growthObjects) do
        table.insert(_model, v.model)
    end
    if Config.Target == 'ox_target' then
        exports.ox_target:addModel(_model, {
                {
                    onSelect = function(data)
                        checkPlant(data.entity)
                    end,
                    icon = Lang.target.check.icon,
                    label = Lang.target.check.label,
                    distance = 1.5,
                },
                {
                    onSelect = function(data)
                        harvestPlant(data.entity)
                    end,
                    icon = Lang.target.harvest.icon,
                    label = Lang.target.harvest.label,
                    distance = 1.5,
                },
            }
        )
    else
        exports[Config.Target]:AddTargetModel(_model,{
            options =  {
                {
                    action = function(entity)
                        checkPlant(entity)
                    end,
                    icon = Lang.target.check.icon,
                    label = Lang.target.check.label,
                },
                {
                    action = function(entity)
                        harvestPlant(entity)
                    end,
                    icon = Lang.target.harvest.icon,
                    label = Lang.target.harvest.label,
                },
            },
            distance = 1.5
        })
    end
    if Config.HyperData then
        SendNUIMessage({
            event = "connect"
        })
    else
        TriggerServerEvent('rep-weed:join')
    end
    Config.TacoShop.points = lib.callback.await('rep-weed:callback:getConfigTaco', false)
end)

function Framework.Notification(_msg, _type, _time)
    exports.qbx_core:Notify(_msg, _type, _time)
end

function Framework.checkJob(filters)
    return QBX:HasGroup(filters)
end

function Framework.GetCurrentCop()
    return lib.callback.await('rep-weed:callback:GetCurrentCop', false)
end

function Framework.getIdentifier()
    return QBX.citizenid
end

function Framework.Progressbar(_name, _label, _duration, _canCancel, _onFinish, _onCancel)
    if lib.progressBar({
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