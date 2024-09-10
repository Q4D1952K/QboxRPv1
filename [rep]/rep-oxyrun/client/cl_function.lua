
function talkNPC()
    local _model, _pos = lib.callback.await('rep-oxyrun:callback:bossNPC', false)
    bossNpc = exports['rep-talkNPC']:CreateNPC({
        npc = _model,
        coords = _pos,
        name = Lang.bossNpc.name,
        animScenario = Lang.bossNpc.animScenario,
        tag = Lang.bossNpc.tag,
        color = Lang.bossNpc.color,
        startMSG = Lang.bossNpc.startMSG
    }, {
        [1] = {
            label = Lang.bossNpc.button1[1],
            shouldClose = false,
            action = function()
                exports['rep-talkNPC']:changeDialog(
                  Lang.bossNpc.button1[2],
                    {
                        [1] = {
                            label = Lang.bossNpc.button1[3],
                            shouldClose = false,
                            action = function()
                                if onDuty == false then
                                    if LocalPlayer.state.nghe == nil or LocalPlayer.state.nghe == "oxyrun" then
                                        exports['rep-talkNPC']:updateMessage(Lang.bossNpc.button1[4])
                                        Wait(1000)
                                        TriggerEvent('rep-talkNPC:client:close')
                                        TriggerEvent('rep-oxyrun:client:onDuty')
                                    else
                                        Framework.Notification(Lang.error.own_job.label, Lang.error.own_job.type, Lang.error.own_job.time)
                                    end
                                else
                                    exports['rep-talkNPC']:updateMessage(Lang.bossNpc.button1[5])
                                end
                            end
                        },
                        [2] = {
                            label = Lang.bossNpc.button1[6],
                            shouldClose = true,
                            action = function()
                            end
                        }
                    }
                )
            end,
        },
        [2] = {
            label = Lang.bossNpc.button2[1],
            shouldClose = true,
            action = function()
                TriggerEvent('rep-oxyrun:client:onDuty')
            end,
            canInteract = function()
                return not onDuty
            end,
        },
        [3] = {
            label = Lang.bossNpc.button3[1],
            shouldClose = true,
            action = function()
                TriggerEvent('rep-oxyrun:client:offDuty')
            end,
            canInteract = function()
                return onDuty
            end,
        },
        [4] = {
            label = Lang.bossNpc.button4[1],
            shouldClose = true,
            action = function()
            end
        }
    })
end

function targetNPC()
    local _model, _pos = lib.callback.await('rep-oxyrun:callback:bossNPC', false)
    lib.requestModel(_model)
    bossNpc = CreatePed(0, _model, _pos.x, _pos.y, _pos.z, _pos.w, false, true)
    SetPedFleeAttributes(bossNpc, 0, false)
    SetPedDiesWhenInjured(bossNpc, false)
    TaskStartScenarioInPlace(bossNpc, Lang.bossNpc.animScenario, 0, true)
    SetPedKeepTask(bossNpc, true)
    SetBlockingOfNonTemporaryEvents(bossNpc, true)
    SetEntityInvincible(bossNpc, true)
    FreezeEntityPosition(bossNpc, true)
    if Config.Target == 'ox_target' then
        exports.ox_target:addLocalEntity(bossNpc,
        {
            {
                onSelect = function(entity)
                    TriggerEvent('rep-oxyrun:client:onDuty')
                end,
                icon = Lang.target.signin.icon,
                label = Lang.target.signin.label,
                distance = 1.5,
                canInteract = function()
                    return not onDuty
                end,
            },
            {
                onSelect = function(entity)
                    TriggerEvent('rep-oxyrun:client:offDuty')
                end,
                icon = Lang.target.signout.icon,
                label = Lang.target.signout.label,
                distance = 1.5,
                canInteract = function()
                    return onDuty
                end,
            },
        })
    else
        exports[Config.Target]:AddTargetEntity(bossNpc, {
            options =  {
                {
                    action = function()
                        TriggerEvent('rep-oxyrun:client:onDuty')
                    end,
                    icon = Lang.target.signin.icon,
                    label = Lang.target.signin.label,
                    canInteract = function()
                        return not onDuty and Config.TacoShop.status
                    end,
                },
                {
                    action = function()
                        TriggerEvent('rep-oxyrun:client:offDuty')
                    end,
                    icon = Lang.target.signout.icon,
                    label = Lang.target.signout.label,
                    canInteract = function()
                        return onDuty and Config.TacoShop.status
                    end,
                },
            },
            distance = 1.5
        })
    end
end

function hasItem(_item, _count)
    if not _count then
        _count = 1
    end
    if Config.Inventory == 'ox' then
        local count = exports.ox_inventory:Search('count', _item)
        if count >= _count then
            return true
        else
            return false
        end
    elseif Config.Inventory == 'qs' then
        local count = exports['qs-inventory']:Search(_item)
        if count >= _count then
            return true
        else
            return false
        end
    elseif Config.Inventory == 'old_qb' or Config.Inventory == 'new_qb' then
        return exports['qb-inventory']:HasItem(_item)
    end
end

local function policeAlert()
    --exports['ps-dispatch']:SuspiciousActivity()
end

RegisterNetEvent('rep-oxyrun:client:chiduong', function ()
    local _pPos = GetEntityCoords(bossNpc)
    SetNewWaypoint(_pPos.x, _pPos.y)
end)

AddEventHandler('onResourceStart', function(r)
    if r == cache.resource then
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
    end
end)

RegisterNetEvent('rep-oxyrun:client:syncTarget', function (amount, netIdCar)
    if Config.Target == 'ox_target' then
        if currentProgress == 'route1' then
            exports.ox_target:addEntity(netIdCar,
                {
                    {
                        onSelect = function(entity)
                            if math.random(1, 100) < Config.CallCopsChance then
                                policeAlert()
                            end
                            TriggerServerEvent('rep-oxyrun:server:stage5', dropPack)
                        end,
                        icon = Lang.target.deliver.icon,
                        label = Lang.target.deliver.label,
                        distance = 1.5,
                        canInteract = function()
                            return dropPack == amount and hasItem(Config.Items['package'], 1)
                        end,
                    },
                }
            )
        else
            exports.ox_target:addEntity(netIdCar,
                {
                    {
                        onSelect = function(entity)
                            if math.random(1, 100) < Config.CallCopsChance then
                                policeAlert()
                            end
                            TriggerServerEvent('rep-oxyrun:server:stage7', dropPack)
                        end,
                        icon = Lang.target.deliver.icon,
                        label = Lang.target.deliver.label,
                        distance = 1.5,
                        canInteract = function()
                            return dropPack == amount and hasItem(Config.Items['package'], 1)
                        end,
                    },
                }
            )
        end
    else
        if currentProgress == 'route1' then
            exports[Config.Target]:AddTargetEntity(netIdCar, {
                options = {
                    {
                        action = function ()
                            if math.random(1, 100) < Config.CallCopsChance then
                                policeAlert()
                            end
                            TriggerServerEvent('rep-oxyrun:server:stage5', dropPack)
                        end,
                        icon = Lang.target.deliver.icon,
                        label = Lang.target.deliver.label,
                        canInteract = function()
                            return dropPack == amount and hasItem(Config.Items['package'], 1)
                        end,
                    }
                },
                distance = 3.0,
            })
        else
            exports[Config.Target]:AddTargetEntity(netIdCar, {
                options = {
                    {
                        action = function ()
                            if math.random(1, 100) < Config.CallCopsChance then
                                policeAlert()
                            end
                            TriggerServerEvent('rep-oxyrun:server:stage7', dropPack)
                        end,
                        icon = Lang.target.deliver.icon,
                        label = Lang.target.deliver.label,
                        canInteract = function()
                            return dropPack == amount and hasItem(Config.Items['package'], 1)
                        end,
                    }
                },
                distance = 3.0,
            })
        end
    end
end)


AddEventHandler('onResourceStop', function(r)
    if r == cache.resource then
        DeleteEntity(bossNpc)
    end
end)