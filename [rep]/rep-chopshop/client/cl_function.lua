bossNpc = nil

function talkNPC()
    local _model, _pos = lib.callback.await('rep-chopshop:callback:bossNPC', false)
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
                                    if LocalPlayer.state.nghe == nil or LocalPlayer.state.nghe == "chopshop" then
                                        exports['rep-talkNPC']:updateMessage(Lang.bossNpc.button1[4])
                                        Wait(1000)
                                        TriggerEvent('rep-talkNPC:client:close')
                                        TriggerEvent('rep-chopshop:client:onDuty')
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
                TriggerEvent('rep-chopshop:client:onDuty')
            end,
            canInteract = function()
                return not onDuty
            end,
        },
        [3] = {
            label = Lang.bossNpc.button3[1],
            shouldClose = true,
            action = function()
                TriggerEvent('rep-chopshop:client:offDuty')
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
    local _model, _pos = lib.callback.await('rep-chopshop:callback:bossNPC', false)
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
                    TriggerEvent('rep-chopshop:client:onDuty')
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
                    TriggerEvent('rep-chopshop:client:offDuty')
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
                        TriggerEvent('rep-chopshop:client:onDuty')
                    end,
                    icon = Lang.target.signin.icon,
                    label = Lang.target.signin.label,
                    canInteract = function()
                        return not onDuty and Config.TacoShop.status
                    end,
                },
                {
                    action = function()
                        TriggerEvent('rep-chopshop:client:offDuty')
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

function miniGame()
    if lib.skillCheck({{ areaSize = 40, speedMultiplier = 0.75 }, { areaSize = 30, speedMultiplier = 1.0 }, { areaSize = 30, speedMultiplier = 1.25 }}, {'a', 'w', 's', 'd'}) then
        TriggerServerEvent('rep-chopshop:server:stage3')
        TriggerEvent("vehiclekeys:client:SetOwner", vehPlate)
    else
        exports['pengu_digiscanner']:SetupDigiScanner(vector3(keyPos.x, keyPos.y, keyPos.z), {
            event = miniGame,
            isAction = true,
            interact = {
                interactKey = 38,
                interactMessage = 'Hack Key',
            }
        })
    end
end

local function policeAlert()
    --exports['ps-dispatch']:SuspiciousActivity()
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

function init()
    if Config.Target == 'ox_target' then
        for _index, _value in pairs(VehicleChopBones) do
            if _value.type == 'tyre' then
                exports.ox_target:addGlobalVehicle({
                    {
                        onSelect = function(data)
                            chopVehicle(data.entity, _value)
                        end,
                        icon = Lang.target.tyre.icon,
                        label = Lang.target.tyre.label,
                        bones = _value.name,
                        distance = 2.0,
                        canInteract = function(entity, distance, coords, name, bone)
                            local bones, boneDistance = getClosestBone(entity)
                            return onJob and lib.getVehicleProperties(entity).plate == vehPlate and not IsVehicleTyreBurst(entity, _value.index, true) and not hasItem('car_trunk') and not hasItem('car_door') and not hasItem('car_wheel') and bones and (bones.name == _value.name) and boneDistance < 1.2
                        end,
                    },
                })
            elseif _value.type == 'door' then
                exports.ox_target:addGlobalVehicle({
                    {
                        onSelect = function(data)
                            chopVehicle(data.entity, _value)
                        end,
                        icon = Lang.target.door.icon,
                        label = Lang.target.door.label,
                        bones = _value.name,
                        distance = 2.0,
                        canInteract = function(entity, distance, coords, name, bone)
                            local bones, boneDistance = getClosestBone(entity)
                            return onJob and lib.getVehicleProperties(entity).plate == vehPlate and not IsVehicleDoorDamaged(entity, _value.index) and not hasItem('car_trunk') and not hasItem('car_door') and not hasItem('car_wheel') and bones and (bones.name == _value.name) and boneDistance < 1.6
                        end,
                    },
                })
            elseif _value.type == 'trunk' then
                exports.ox_target:addGlobalVehicle({
                    {
                        onSelect = function(data)
                            chopVehicle(data.entity, _value)
                        end,
                        icon = Lang.target.trunk.icon,
                        label = Lang.target.trunk.label,
                        bones = _value.name,
                        distance = 2.0,
                        canInteract = function(entity, distance, coords, name, bone)
                            local bones, boneDistance = getClosestBone(entity)
                            return onJob and lib.getVehicleProperties(entity).plate == vehPlate and not IsVehicleDoorDamaged(entity, _value.index) and not hasItem('car_trunk') and not hasItem('car_door') and not hasItem('car_wheel')  and bones and (bones.name == _value.name) and boneDistance < 1.6
                        end,
                    },
                })
            else
                exports.ox_target:addGlobalVehicle({
                    {
                        onSelect = function(data)
                            chopVehicle(data.entity, _value)
                        end,
                        icon = Lang.target.remains.icon,
                        label = Lang.target.remains.label,
                        bones = _value.name,
                        distance = 1.5,
                        canInteract = function(entity, distance, coords, name, bone)
                            return onJob and lib.getVehicleProperties(entity).plate == vehPlate and getValidBones(entity) and not hasItem('car_trunk') and not hasItem('car_door') and not hasItem('car_wheel')
                        end,
                    },
                })
            end
        end
    else
        for _index, _value in pairs(VehicleChopBones) do
            if _value.type == 'tyre' then
                exports[Config.Target]:AddTargetBone(_value.name,{
                    options =  {
                        {
                            action = function(entity)
                                chopVehicle(entity, _value)
                            end,
                            icon = Lang.target.tyre.icon,
                            label = Lang.target.tyre.label,
                            canInteract = function(entity, distance, data)
                                local bones, boneDistance = getClosestBone(entity)
                                return onJob and lib.getVehicleProperties(entity).plate == vehPlate and not IsVehicleTyreBurst(entity, _value.index, true) and not hasItem('car_trunk') and not hasItem('car_door') and not hasItem('car_wheel') and bones and (bones.name == _value.name) and boneDistance < 1.2
                            end,
                        },
                    },
                    distance = 2.0
                })
            elseif _value.type == 'door' then
                exports[Config.Target]:AddTargetBone(_value.name,{
                    options =  {
                        {
                            action = function(entity)
                                chopVehicle(entity, _value)
                            end,
                            icon = Lang.target.door.icon,
                            label = Lang.target.door.label,
                            canInteract = function(entity, distance, data)
                                local bones, boneDistance = getClosestBone(entity)
                                return onJob and lib.getVehicleProperties(entity).plate == vehPlate and not IsVehicleDoorDamaged(entity, _value.index) and not hasItem('car_trunk') and not hasItem('car_door') and not hasItem('car_wheel') and bones and (bones.name == _value.name) and boneDistance < 1.6
                            end,
                        },
                    },
                    distance = 2.0
                })
            elseif _value.type == 'trunk' then
                exports[Config.Target]:AddTargetBone(_value.name,{
                    options =  {
                        {
                            action = function(entity)
                                chopVehicle(entity, _value)
                            end,
                            icon = Lang.target.trunk.icon,
                            label = Lang.target.trunk.label,
                            canInteract = function(entity, distance, data)
                                local bones, boneDistance = getClosestBone(entity)
                                return onJob and lib.getVehicleProperties(entity).plate == vehPlate and not IsVehicleDoorDamaged(entity, _value.index) and not hasItem('car_trunk') and not hasItem('car_door') and not hasItem('car_wheel') and bones and (bones.name == _value.name) and boneDistance < 1.6
                            end,
                        },
                    },
                    distance = 2.0
                })
            else
                exports[Config.Target]:AddTargetBone(_value.name,{
                    options =  {
                        {
                            action = function(entity)
                                chopVehicle(entity, _value)
                            end,
                            icon = Lang.target.remains.icon,
                            label = Lang.target.remains.label,
                            canInteract = function(entity, distance, coords, name, bone)
                                return onJob and lib.getVehicleProperties(entity).plate == vehPlate and getValidBones(entity)
                            end,
                        },
                    },
                    distance = 2.0
                })
            end
        end
    end
end

RegisterNetEvent('rep-chopshop:client:chiduong', function ()
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
        init()
    end
end)

AddEventHandler('onResourceStop', function(r)
    if r == cache.resource then
        DeleteEntity(bossNpc)
    end
end)