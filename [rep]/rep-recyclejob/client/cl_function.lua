local blip = nil
local bossNpc, machineObj = nil, nil
items = {}
local warehouseObjects = {}
function initScript()
    blip = AddBlipForCoord(Config.Location.enter.x, Config.Location.enter.y, Config.Location.enter.z)
    SetBlipSprite(blip, Lang.blip.sprite)
    SetBlipColour(blip, Lang.blip.colour)
    SetBlipScale(blip, Lang.blip.scale)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentString(Lang.blip.label)
    EndTextCommandSetBlipName(blip)
    if Config.Inventory == 'ox' then
        for item, data in pairs(exports.ox_inventory:Items()) do
            items[data.name] = {
                name = data.name,
                label = data.label,
                image = (data.client and data.client.image) and data.client.image or Config.ImgLink..data.name..".png",
            }
        end
    elseif Framework.ESX() then
        local esxitems = lib.callback.await('rep-recyclejob:callback:getItems', false)
        for item, data in pairs(esxitems) do
            items[data.name] = {
                name = data.name,
                label = data.label,
                image = Config.ImgLink..data.name..".png",
            }
        end
    elseif Framework.QBCore() then
        local QBCore = exports['qb-core']:GetCoreObject()
        for item, data in pairs(QBCore.Shared.Items) do
            items[data.name] = {
                name = data.name,
                label = data.label,
                image = Config.ImgLink..data.image,
            }
        end
    end
    for _index, _value in pairs(Config.Location.pickup) do
        local model = GetHashKey(Config.Location.warehouseObjects[math.random(1, #Config.Location.warehouseObjects)])
        lib.requestModel(model, 5000)
        warehouseObjects[_index] = CreateObject(model, _value.x, _value.y, _value.z, false, true, true)
        SetModelAsNoLongerNeeded(model)
        PlaceObjectOnGroundProperly(warehouseObjects[_index])
        SetEntityInvincible(warehouseObjects[_index], true)
        FreezeEntityPosition(warehouseObjects[_index], true)
        if Config.Target == 'ox_target' then
            exports.ox_target:addSphereZone({
                coords = _value,
                radius = 1.0,
                drawSprite = true,
                options = {
                    {
                        onSelect = function()
                            getBox()
                        end,
                        icon = Lang.target.get.icon,
                        label = Lang.target.get.label,
                        distance = 2.0,
                        canInteract = function(entity, distance, data)
                            return packageCoords == _index and not carryPackage
                        end,
                    },
                },
            })
        else
            exports[Config.Target]:AddCircleZone("recyclejob_".._index, _value, 1.0, {
                name = "recyclejob_".._index,
                debugPoly = false,
            }, {
                options = {
                {
                    icon = Lang.target.get.icon,
                    label = Lang.target.get.label,
                    action = function(entity)
                        getBox()
                    end,
                    canInteract = function(entity, distance, data)
                        return packageCoords == _index and not carryPackage
                    end,
                    drawDistance = 10.0,
                    drawColor = {255, 255, 255, 255},
                    successDrawColor = {30, 144, 255, 255},
                }
                },
                distance = 2.0,
            })
        end
    end
    if Config.Target == 'ox_target' then
        exports.ox_target:addSphereZone({
            coords = Config.Location.drop,
            radius = 2.0,
            drawSprite = true,
            options = {
                {
                    onSelect = function()
                        dropBox()
                    end,
                    icon = Lang.target.drop.icon,
                    label = Lang.target.drop.label,
                    distance = 2.0,
                    canInteract = function(entity, distance, data)
                        return carryPackage
                    end,
                },
            },
        })
        exports.ox_target:addSphereZone({
            coords = Config.Location.enter,
            radius = 1.0,
            drawSprite = true,
            options = {
                {
                    onSelect = function()
                        enterWarehouse()
                    end,
                    icon = Lang.target.enter.icon,
                    label = Lang.target.enter.label,
                    distance = 2.0,
                },
            },
        })
        exports.ox_target:addSphereZone({
            coords = Config.Location.exit,
            radius = 1.0,
            drawSprite = true,
            options = {
                {
                    onSelect = function()
                        exitWarehouse()
                    end,
                    icon = Lang.target.exit.icon,
                    label = Lang.target.exit.label,
                    distance = 2.0,
                },
            },
        })
    else
        exports[Config.Target]:AddCircleZone("recyclejob_drop", Config.Location.drop, 1.0, {
            name = "recyclejob_drop",
            debugPoly = false,
        }, {
            options = {
            {
                icon = Lang.target.drop.icon,
                label = Lang.target.drop.label,
                action = function(entity)
                    dropBox()
                end,
                canInteract = function(entity, distance, data)
                    return carryPackage
                end,
                drawDistance = 10.0,
                drawColor = {255, 255, 255, 255},
                successDrawColor = {30, 144, 255, 255},
            }
            },
            distance = 1.5,
        })
        exports[Config.Target]:AddCircleZone("recyclejob_enter", Config.Location.enter, 1.0, {
            name = "recyclejob_enter",
            debugPoly = false,
        }, {
            options = {
            {
                icon = Lang.target.enter.icon,
                label = Lang.target.enter.label,
                action = function(entity)
                    enterWarehouse()
                end,
                drawDistance = 10.0,
                drawColor = {255, 255, 255, 255},
                successDrawColor = {30, 144, 255, 255},
            }
            },
            distance = 1.5,
        })
        exports[Config.Target]:AddCircleZone("recyclejob_exit", Config.Location.exit, 1.0, {
            name = "recyclejob_exit",
            debugPoly = false,
        }, {
            options = {
            {
                icon = Lang.target.exit.icon,
                label = Lang.target.exit.label,
                action = function(entity)
                    exitWarehouse()
                end,
                drawDistance = 10.0,
                drawColor = {255, 255, 255, 255},
                successDrawColor = {30, 144, 255, 255},
            }
            },
            distance = 2.0,
        })
    end
    lib.requestModel('s_m_m_dockwork_01')
    bossNpc = CreatePed(0, 's_m_m_dockwork_01', Config.Exchange.ped.x, Config.Exchange.ped.y, Config.Exchange.ped.z, Config.Exchange.ped.w, false, true)
    SetPedFleeAttributes(bossNpc, 0, false)
    SetPedDiesWhenInjured(bossNpc, false)
    lib.requestAnimDict('mp_arresting')
    TaskPlayAnim(bossNpc, 'mp_arresting', 'a_uncuff', 3.0, 1.0, -1, 49, 0, false, false, false)
    SetPedKeepTask(bossNpc, true)
    SetBlockingOfNonTemporaryEvents(bossNpc, true)
    SetEntityInvincible(bossNpc, true)
    FreezeEntityPosition(bossNpc, true)
    lib.requestModel('prop_planer_01')
    machineObj = CreateObject(joaat("prop_planer_01"), Config.Exchange.obj.x, Config.Exchange.obj.y, Config.Exchange.obj.z, false, false, false)
    SetEntityHeading(machineObj,  Config.Exchange.obj.w)
    SetEntityInvincible(machineObj, true)
    FreezeEntityPosition(machineObj, true)
    if Config.Target == 'ox_target' then
        exports.ox_target:addLocalEntity(bossNpc,
            {
                {
                    onSelect = function(data)
                        exchangeSystem()
                    end,
                    icon = Lang.target.exchange.icon,
                    label = Lang.target.exchange.label,
                    distance = 1.5,
                },
            }
        )
    else
        exports[Config.Target]:AddTargetEntity(bossNpc, {
            options = {
                {
                    action = function (entity)
                        exchangeSystem()
                    end,
                    icon = Lang.target.exchange.icon,
                    label = Lang.target.exchange.label,
                },
            },
            distance = 1.5,
        })
    end
end

CreateThread(function ()
    while true do
        if packageCoords ~= 0 then
            DrawMarker(2, Config.Location.pickup[packageCoords].x, Config.Location.pickup[packageCoords].y, Config.Location.pickup[packageCoords].z + 3, 0, 0, 0, 180.0, 0, 0, 0.5, 0.5, 0.5, 255, 255, 0, 100, false, false, 2, true, nil, nil, false)
        else
            Wait(1000)
        end
        Wait(3)
    end
end)

AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        Wait(5000)
        initScript()
    end
end)

AddEventHandler('onResourceStop', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        RemoveBlip(blip)
        DeleteEntity(bossNpc)
        DeleteEntity(machineObj)
        for _index, _value in pairs(warehouseObjects) do
            DeleteEntity(_value)
        end
    end
end)