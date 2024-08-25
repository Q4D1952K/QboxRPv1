bossNpc = nil
vehSpawn, vehPlate = nil, nil
onDuty, onJob = false, false
local function Trim(value)
    if not value then return nil end
    return (string.gsub(value, '^%s*(.-)%s*$', '%1'))
end

function GetPlate(vehicle)
    if vehicle == 0 then return end
    return Trim(GetVehicleNumberPlateText(vehicle))
end

function vehSpawnicle()
    local netId = lib.callback.await('rep-sanitation:callback:vehSpawn', false)
    vehSpawn = NetToVeh(netId)
    vehPlate = "GARB" .. tostring(math.random(1000, 9999))
    SetVehicleNumberPlateText(vehSpawn, vehPlate)
    SetEntityAsMissionEntity(vehSpawn, true, true)
    exports['LegacyFuel']:SetFuel(vehSpawn, 100.0)
    TriggerEvent('vehiclekeys:client:SetOwner', vehPlate)
    TriggerServerEvent('rep-sanitation:server:stage1', vehPlate, nLoc)
end

function returnVehicle()
    local vehpos = GetEntityCoords(vehSpawn)
    if #(vehpos - vector3(Config.Boss.pos.x, Config.Boss.pos.y,Config.Boss.pos.z)) < 20.0 then
        ClearAllBlipRoutes()
        RemoveBlip(blips.vehicleblip)
        blips.vehicleblip = nil
        TriggerServerEvent('rep-sanitation:server:delObj', NetworkGetNetworkIdFromEntity(vehSpawn))
        vehSpawn = nil
        TriggerServerEvent('rep-sanitation:server:synctien')
    else
        Framework.Notification(Lang.error.far.label, Lang.error.far.type, Lang.error.far.time)
    end
end

function talkNPC()
    bossNpc = exports['rep-talkNPC']:CreateNPC({
        npc = Config.Boss.ped,
        coords = Config.Boss.pos,
        name = Config.Boss.name,
        animScenario = Config.Boss.animScenario,
        tag = Config.Boss.tag,
        color = Config.Boss.color,
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
                                    if LocalPlayer.state.nghe == nil or LocalPlayer.state.nghe == "sani" then
                                        exports['rep-talkNPC']:updateMessage(Lang.bossNpc.button1[4])
                                        Wait(1000)
                                        TriggerEvent('rep-talkNPC:client:close')
                                        TriggerEvent('rep-sanitation:client:onDuty')
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
            end
        },
        [2] = {
            label = Lang.bossNpc.button2[1],
            shouldClose = false,
            action = function()
                if LocalPlayer.state.nghe == nil or LocalPlayer.state.nghe == "sani" then
                    exports['rep-talkNPC']:updateMessage(Lang.bossNpc.button2[2])
                    TriggerEvent('rep-sanitation:client:onDuty')
                    Wait(2000)
                    TriggerEvent('rep-talkNPC:client:close')
                else
                    Framework.Notification(Lang.error.own_job.label, Lang.error.own_job.type, Lang.error.own_job.time)
                end
            end,
            canInteract = function ()
                if onDuty then
                    return false
                end
                return true
            end
        },
        [3] = {
            label = Lang.bossNpc.button3[1],
            shouldClose = false,
            action = function()
                TriggerEvent('rep-sanitation:client:offDuty')
                exports['rep-talkNPC']:updateMessage(Lang.bossNpc.button3[2])
                Wait(2000)
                TriggerEvent('rep-talkNPC:client:close')
            end,
            canInteract = function ()
                if not onDuty then
                    return false
                end
                return true
            end
        },
        [4] = {
            label = Lang.bossNpc.button4[1],
            shouldClose = true,
            action = function()
                if not IsPositionOccupied(Config.Vehicle.spawnpos.x, Config.Vehicle.spawnpos.y, Config.Vehicle.spawnpos.z, 3, false, true, true, false, false, 0, false) then
                    vehSpawnicle()
                else
                    Framework.Notification(Lang.error.occupied.label, Lang.error.occupied.type, Lang.error.occupied.time)
                end
            end,
            canInteract = function()
                local IsGroupLeader = exports['rep-tablet']:IsGroupLeader()
                if onJob and not vehSpawn and IsGroupLeader then
                    return true
                end
                return false
            end
        },
        [5] = {
            label = Lang.bossNpc.button5[1],
            shouldClose = true,
            action = function()
                returnVehicle()
            end,
            canInteract = function()
                local IsGroupLeader = exports['rep-tablet']:IsGroupLeader()
                return doneJob and IsGroupLeader and onJob
            end
        },
        [6] = {
            label = Lang.bossNpc.button6[1],
            shouldClose = true,
            action = function()
                exchangeSystem()
            end,
            canInteract = function()
              return Config.Exchange.status
            end
        },
        [7] = {
            label = Lang.bossNpc.button7[1],
            shouldClose = true,
            action = function()
            end
        }
    })
end

function targetNPC()
    lib.requestModel(Config.Boss.ped, 500)
    bossNpc = CreatePed(0, Config.Boss.ped, Config.Boss.pos.x, Config.Boss.pos.y, Config.Boss.pos.z, Config.Boss.pos.w, false, true)
    SetPedFleeAttributes(bossNpc, 0, false)
    SetPedDiesWhenInjured(bossNpc, false)
    TaskStartScenarioInPlace(bossNpc, Config.Boss.animScenario, 0, true)
    SetPedKeepTask(bossNpc, true)
    SetBlockingOfNonTemporaryEvents(bossNpc, true)
    SetEntityInvincible(bossNpc, true)
    FreezeEntityPosition(bossNpc, true)
    if Config.Target == 'ox_target' then
        exports.ox_target:addLocalEntity(bossNpc,
        {
            {
                onSelect = function(entity)
                    TriggerEvent('rep-sanitation:client:onDuty')
                end,
                icon = Lang.target.signin.icon,
                label = Lang.target.signin.label,
                distance = 1.5,
                canInteract = function()
                    if onDuty or LocalPlayer.state.nghe then
                        return false
                    end
                    return true
                end,
            },
            {
                onSelect = function(entity)
                    TriggerEvent('rep-sanitation:client:offDuty')
                end,
                icon = Lang.target.signout.icon,
                label = Lang.target.signout.label,
                distance = 1.5,
                canInteract = function()
                    if not onDuty then
                        return false
                    end
                    return true
                end,
            },
            {
                onSelect = function(entity)
                    if not IsPositionOccupied(Config.Vehicle.spawnpos.x, Config.Vehicle.spawnpos.y, Config.Vehicle.spawnpos.z, 3, false, true, true, false, false, 0, false) then
                        vehSpawnicle()
                    else
                        Framework.Notification(Lang.error.occupied.label, Lang.error.occupied.type, Lang.error.occupied.time)
                    end
                end,
                icon = Lang.target.spawnveh.icon,
                label = Lang.target.spawnveh.label,
                distance = 1.5,
                canInteract = function()
                    local IsGroupLeader = exports['rep-tablet']:IsGroupLeader()
                    if onJob and not vehSpawn and IsGroupLeader then
                        return true
                    end
                    return false
                end,
            },
            {
                onSelect = function(entity)
                    returnVehicle()
                end,
                icon = Lang.target.returnveh.icon,
                label = Lang.target.returnveh.label,
                distance = 1.5,
                canInteract = function()
                    local IsGroupLeader = exports['rep-tablet']:IsGroupLeader()
                    return doneJob and IsGroupLeader and onJob
                end
            },
            {
                onSelect = function(entity)
                    exchangeSystem()
                end,
                icon = Lang.target.exchange.icon,
                label = Lang.target.exchange.label,
                distance = 1.5,
                canInteract = function ()
                    return Config.Exchange.status
                end
            },
        })
    else
        exports[Config.Target]:AddTargetEntity(bossNpc, {
            options =  {
                {
                    action = function()
                        TriggerEvent('rep-sanitation:client:onDuty')
                    end,
                    icon = Lang.target.signin.icon,
                    label = Lang.target.signin.label,
                    canInteract = function()
                        if onDuty or LocalPlayer.state.nghe then
                            return false
                        end
                        return true
                    end,
                },
                {
                    action = function()
                        TriggerEvent('rep-sanitation:client:offDuty')
                    end,
                    icon = Lang.target.signout.icon,
                    label = Lang.target.signout.label,
                    canInteract = function()
                        if not onDuty then
                            return false
                        end
                        return true
                    end,
                },
                {
                    action = function()
                        if not IsPositionOccupied(Config.Vehicle.spawnpos.x, Config.Vehicle.spawnpos.y, Config.Vehicle.spawnpos.z, 3, false, true, true, false, false, 0, false) then
                            vehSpawnicle()
                        else
                            Framework.Notification(Lang.error.occupied.label, Lang.error.occupied.type, Lang.error.occupied.time)
                        end
                    end,
                    icon = Lang.target.spawnveh.icon,
                    label = Lang.target.spawnveh.label,
                    canInteract = function()
                        local IsGroupLeader = exports['rep-tablet']:IsGroupLeader()
                        if onJob and not vehSpawn and IsGroupLeader then
                            return true
                        end
                        return false
                    end,
                },
                {
                    action = function()
                        returnVehicle()
                    end,
                    icon = Lang.target.returnveh.icon,
                    label = Lang.target.returnveh.label,
                    canInteract = function()
                        local IsGroupLeader = exports['rep-tablet']:IsGroupLeader()
                        return doneJob and IsGroupLeader and onJob
                    end
                },
                {
                    action = function()
                        exchangeSystem()
                    end,
                    icon = Lang.target.exchange.icon,
                    label = Lang.target.exchange.label,
                    canInteract = function ()
                        return Config.Exchange.status
                    end
                },
            },
            distance = 1.5
        })
    end
end

AddEventHandler('onResourceStart', function(r)
    if r == cache.resource then
        if Config.UseTalkNPC then
            talkNPC()
        else
            targetNPC()
        end
        if Config.Target == 'ox_target' then
            exports.ox_target:addGlobalVehicle({
                {
                    onSelect = function(data)
                        throwTrash(data.entity)
                    end,
                    icon = Lang.target.throwtrash.icon,
                    label = Lang.target.throwtrash.label,
                    bones = { Config.Vehicle.bone },
                    distance = 1.5,
                    canInteract = function(entity, distance, coords, name, bone)
                        if onJob and GetPlate(entity) == vehPlate and GetVehicleDoorAngleRatio(entity ,5) ~= 0 and pickUp then
                            return true
                        end
                        return false
                    end,
                },
            })
            exports.ox_target:addModel(Config.Bins, {
                {
                    onSelect = function(data)
                        grabTrash(data.entity)
                    end,
                    icon = Lang.target.grabtrash.icon,
                    label = Lang.target.grabtrash.label,
                    distance = 1.5,
                    canInteract = function(entity, distance, coords, name, bone)
                        local nZones = GetNameOfZone(coords.x, coords.y, coords.z)
                        if onJob and nLoc[3].name == nZones and not pickUp and LocalPlayer.state.nghe == "sani" then
                            return true
                        end
                        return false
                    end,
                },
            })
        elseif Config.Target == 'interact' then
            exports.interact:AddGlobalVehicleInteraction({
                distance = 5.0,
                interactDst = 2.5,
                offset = vec3(2.0, 0.15, 0.0),
                bone = Config.Vehicle.bone,
                id = 'interact:throwtrash',
                options = {
                    name = 'interact:throwtrash',
                    label = Lang.target.throwtrash.label,
                    icon = Lang.target.throwtrash.icon,
                    canInteract = function(entity, distance, coords, name, bone)
                        if onJob and GetPlate(entity) == vehPlate and GetVehicleDoorAngleRatio(entity ,5) ~= 0 and pickUp then
                            return true
                        end
                        return false
                    end,
                    action = function(entity)
                        throwTrash()
                    end,
                }
            })
            for i = 1, #Config.Bins do
                exports.interact:AddModelInteraction({
                    model = Config.Bins[i],
                    distance = 3.5,
                    interactDst = 1.25,
                    offset = vec3(0.0, 0.0, 1.0),
                    options = {
                        {
                            label = Lang.target.grabtrash.label,
                            canInteract = function(entity, distance, coords, name, bone)
                                local coords = GetEntityCoords(entity)
                                local nZones = GetNameOfZone(coords.x, coords.y, coords.z)
                                if onJob and nLoc[3].name == nZones and LocalPlayer.state.nghe == "sani" then
                                    return true
                                end
                                return false
                            end,
                            action = function(entity, coords, args)
                                grabTrash(entity)
                            end,
                        },
                    },
                })
            end
        else
            exports[Config.Target]:AddTargetBone(Config.Vehicle.bone,{
                options =  {
                    {
                        action = function(entity)
                            throwTrash(entity)
                        end,
                        icon = Lang.target.throwtrash.icon,
                        label = Lang.target.throwtrash.label,
                        canInteract = function(entity, distance, data)
                            if onJob and GetPlate(entity) == vehPlate and GetVehicleDoorAngleRatio(entity ,5) ~= 0 and pickUp then
                                return true
                            end
                            return false
                        end,
                    },
                },
                distance = 1.5
            })
            exports[Config.Target]:AddTargetModel(Config.Bins,{
                options =  {
                    {
                        action = function(entity)
                            grabTrash(entity)
                        end,
                        icon = Lang.target.grabtrash.icon,
                        label = Lang.target.grabtrash.label,
                        canInteract = function(entity, distance, data)
                            local coords = GetEntityCoords(entity)
                            local nZones = GetNameOfZone(coords.x, coords.y, coords.z)
                            if onJob and nLoc[3].name == nZones and not pickUp and LocalPlayer.state.nghe == "sani" then
                                return true
                            end
                            return false
                        end,
                    },
                },
                distance = 1.5
            })
        end
        blips.company = AddBlipForCoord(Config.Boss.pos.x, Config.Boss.pos.y, Config.Boss.pos.z)
        SetBlipSprite(blips.company, Lang.blip.company.sprite)
        SetBlipColour(blips.company, Lang.blip.company.color)
        SetBlipAsShortRange(blips.company, Lang.blip.company.range)
        SetBlipScale(blips.company,Lang.blip.company.scale)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(Lang.blip.company.label)
        EndTextCommandSetBlipName(blips.company)
    end
end)

AddEventHandler('onResourceStop', function(r)
    if r == cache.resource or r == 'rep-tablet' then
        TriggerEvent('rep-tablet:client:checkout')
        if r == cache.resource then
            for k, v in pairs(blips) do
                RemoveBlip(v)
            end
        end
    end
end)