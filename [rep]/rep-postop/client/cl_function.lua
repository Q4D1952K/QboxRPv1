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
    if not IsPositionOccupied(Config.Shipments[shipmentTypes].vehicle.spawnpos.x, Config.Shipments[shipmentTypes].vehicle.spawnpos.y, Config.Shipments[shipmentTypes].vehicle.spawnpos.z, 3, false, true, true, false, false, 0, false) then
        local netId = lib.callback.await('rep-postop:callback:vehSpawn', false, shipmentTypes)
        vehSpawn = NetToVeh(netId)
        vehPlate = "PSTOP" .. tostring(math.random(100, 999))
        SetVehicleNumberPlateText(vehSpawn, vehPlate)
        SetEntityAsMissionEntity(vehSpawn, true, true)
        exports['cdn-fuel']SetFuel(vehSpawn, 100.0)
        TriggerEvent('vehiclekeys:client:SetOwner', vehPlate)
        TriggerServerEvent('rep-postop:server:stage1', vehPlate, shipmentTypes)
    else
        Framework.Notification(Lang.error.occupied.label, Lang.error.occupied.type, Lang.error.occupied.time)
    end
end

function returnVehicle()
    local vehpos = GetEntityCoords(vehSpawn)
    if #(vehpos - vector3(Config.Boss.pos.x, Config.Boss.pos.y,Config.Boss.pos.z)) < 20.0 then
        ClearAllBlipRoutes()
        RemoveBlip(blips.vehicleblip)
        blips.vehicleblip = nil
        TriggerServerEvent('rep-postop:server:delObj', NetworkGetNetworkIdFromEntity(vehSpawn))
        vehSpawn = nil
        TriggerServerEvent('rep-postop:server:salary', shipmentTypes)
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
                                    if LocalPlayer.state.nghe == nil or LocalPlayer.state.nghe == "postop" then
                                        exports['rep-talkNPC']:updateMessage(Lang.bossNpc.button1[4])
                                        Wait(1000)
                                        TriggerEvent('rep-talkNPC:client:close')
                                        TriggerEvent('rep-postop:client:onDuty')
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
                if LocalPlayer.state.nghe == nil or LocalPlayer.state.nghe == "postop" then
                    exports['rep-talkNPC']:updateMessage(Lang.bossNpc.button2[2])
                    TriggerEvent('rep-postop:client:onDuty')
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
                TriggerEvent('rep-postop:client:offDuty')
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
                vehSpawnicle()
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
                checkManage()
            end,
            canInteract = function()
                return Framework.PlayerJob == 'postop' and Framework.PlayerJobGrade > 0
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
                    TriggerEvent('rep-postop:client:onDuty')
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
                    TriggerEvent('rep-postop:client:offDuty')
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
                    vehSpawnicle()
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
                    checkManage()
                end,
                icon = Lang.target.checkManage.icon,
                label = Lang.target.checkManage.label,
                distance = 1.5,
                canInteract = function ()
                    return Framework.PlayerJob == 'postop' and Framework.PlayerJobGrade > 0
                end
            },
        })
    else
        exports[Config.Target]:AddTargetEntity(bossNpc, {
            options =  {
                {
                    action = function()
                        TriggerEvent('rep-postop:client:onDuty')
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
                        TriggerEvent('rep-postop:client:offDuty')
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
                        vehSpawnicle()
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
                        checkManage()
                    end,
                    icon = Lang.target.checkManage.icon,
                    label = Lang.target.checkManage.label,
                    canInteract = function ()
                        return Framework.PlayerJob == 'postop' and Framework.PlayerJobGrade > 0
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
            for _index, _value in pairs (Config.Shipments.prime.location) do
                exports.ox_target:addSphereZone({
                    coords = _value.pos,
                    radius = 1.0,
                    drawSprite = true,
                    options = {
                        {
                            onSelect = function()
                                dropPackage()
                            end,
                            icon = Lang.target.droppack.icon,
                            label = Lang.target.droppack.label,
                            distance = 1.5,
                            canInteract = function(entity, distance, data)
                                if onJob and shipmentTypes == 'prime' and nLoc.index == _index and pickUp then
                                    return true
                                end
                                return false
                            end,
                        },
                    },
                })
            end
            for _index, _value in pairs (Config.Shipments.express.location) do
                for index, value in pairs(_value.pos) do
                    exports.ox_target:addSphereZone({
                        coords = value,
                        radius = 1.0,
                        drawSprite = true,
                        options = {
                            {
                                onSelect = function()
                                    dropPackage()
                                end,
                                icon = Lang.target.droppack.icon,
                                label = Lang.target.droppack.label,
                                distance = 1.5,
                                canInteract = function(entity, distance, data)
                                    if onJob and shipmentTypes == 'express' and nLoc.index == _index and cLoc == index and pickUp then
                                        return true
                                    end
                                    return false
                                end,
                            },
                        },
                    })
                end
            end
            for _index, _value in pairs (Config.Shipments.freight.location) do
                for index, value in pairs(_value.pos) do
                    exports.ox_target:addSphereZone({
                        coords = value,
                        radius = 1.0,
                        drawSprite = true,
                        options = {
                            {
                                onSelect = function()
                                    dropPackage()
                                end,
                                icon = Lang.target.droppack.icon,
                                label = Lang.target.droppack.label,
                                distance = 1.5,
                                canInteract = function(entity, distance, data)
                                    if onJob and shipmentTypes == 'freight' and nLoc.index == _index and cLoc == index and pickUp then
                                        return true
                                    end
                                    return false
                                end,
                            },
                        },
                    })
                end
            end
            exports.ox_target:addModel(Config.Shipments.prime.vehicle.model, {
                {
                    onSelect = function(data)
                        getPackage()
                    end,
                    icon = Lang.target.getpack.icon,
                    label = Lang.target.getpack.label,
                    bones = Config.Shipments.prime.vehicle.bone,
                    distance = 1.5,
                    canInteract = function(entity, distance, coords, name, bone)
                        if onJob and nLoc.index ~= nil  and GetPlate(entity) == vehPlate and #(coords - Config.Shipments.prime.location[nLoc.index].pos) < 20.0 and not pickUp then
                            return true
                        end
                        return false
                    end,
                },
            })
            exports.ox_target:addModel(Config.Shipments.express.vehicle.model, {
                {
                    onSelect = function(data)
                        getPackage()
                    end,
                    icon = Lang.target.getpack.icon,
                    label = Lang.target.getpack.label,
                    bones = Config.Shipments.express.vehicle.bone,
                    distance = 1.5,
                    canInteract = function(entity, distance, coords, name, bone)
                        if onJob and nLoc.index ~= nil  and GetPlate(entity) == vehPlate and #(coords - Config.Shipments.express.location[nLoc.index].pos[cLoc]) < 20.0 and not pickUp then
                            return true
                        end
                        return false
                    end,
                },
            })
            exports.ox_target:addModel(Config.Shipments.freight.vehicle.model, {
                {
                    onSelect = function(data)
                        getPackage()
                    end,
                    icon = Lang.target.getpack.icon,
                    label = Lang.target.getpack.label,
                    bones = Config.Shipments.freight.vehicle.bone,
                    distance = 1.5,
                    canInteract = function(entity, distance, coords, name, bone)
                        if onJob and nLoc.index ~= nil  and GetPlate(entity) == vehPlate and #(coords - Config.Shipments.freight.location[nLoc.index].pos[cLoc]) < 20.0 and not pickUp then
                            return true
                        end
                        return false
                    end,
                },
            })
        else
            for _index, _value in pairs (Config.Shipments.prime.location) do
                exports[Config.Target]:AddCircleZone("getprime_".._index, _value.pos, 1.0, {
                    name = "getprime_".._index,
                    debugPoly = false,
                }, {
                    options = {
                    {
                        icon = Lang.target.droppack.icon,
                        label = Lang.target.droppack.label,
                        action = function(entity)
                            dropPackage()
                        end,
                        canInteract = function(entity, distance, data)
                            if onJob and shipmentTypes == 'prime' and nLoc.index == _index and pickUp then
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
            for _index, _value in pairs (Config.Shipments.express.location) do
                for index, value in pairs(_value.pos) do
                    exports[Config.Target]:AddCircleZone("getexpress_".._index, value, 1.0, {
                        name = "getexpress_".._index,
                        debugPoly = false,
                    }, {
                        options = {
                        {
                            icon = Lang.target.droppack.icon,
                            label = Lang.target.droppack.label,
                            action = function(entity)
                                dropPackage()
                            end,
                            canInteract = function(entity, distance, data)
                                if onJob and shipmentTypes == 'express' and nLoc.index == _index and cLoc == index and pickUp then
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
            for _index, _value in pairs (Config.Shipments.freight.location) do
                for index, value in pairs(_value.pos) do
                    exports[Config.Target]:AddCircleZone("getfreight_".._index, value, 1.0, {
                        name = "getfreight_".._index,
                        debugPoly = false,
                    }, {
                        options = {
                        {
                            icon = Lang.target.droppack.icon,
                            label = Lang.target.droppack.label,
                            action = function(entity)
                                dropPackage()
                            end,
                            canInteract = function(entity, distance, data)
                                if onJob and shipmentTypes == 'freight' and nLoc.index == _index and cLoc == index and pickUp then
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

            exports[Config.Target]:AddTargetBone(Config.Shipments.prime.vehicle.bone,{
                options =  {
                    {
                        action = function(entity)
                            getPackage()
                        end,
                        icon = Lang.target.getpack.icon,
                        label = Lang.target.getpack.label,
                        canInteract = function(entity, distance, data)
                            local coords = GetEntityCoords(entity)
                            if onJob and nLoc.index ~= nil  and GetPlate(entity) == vehPlate and #(coords - Config.Shipments.prime.location[nLoc.index].pos) < 20.0 and not pickUp then
                                return true
                            end
                            return false
                        end,
                    },
                },
                distance = 1.5
            })

            exports[Config.Target]:AddTargetBone(Config.Shipments.express.vehicle.bone,{
                options =  {
                    {
                        action = function(entity)
                            getPackage()
                        end,
                        icon = Lang.target.getpack.icon,
                        label = Lang.target.getpack.label,
                        canInteract = function(entity, distance, data)
                            local coords = GetEntityCoords(entity)
                            if onJob and nLoc.index ~= nil  and GetPlate(entity) == vehPlate and #(coords - Config.Shipments.express.location[nLoc.index].pos[cLoc]) < 20.0 and not pickUp then
                                return true
                            end
                            return false
                        end,
                    },
                },
                distance = 1.5
            })

            exports[Config.Target]:AddTargetBone(Config.Shipments.freight.vehicle.bone,{
                options =  {
                    {
                        action = function(entity)
                            getPackage()
                        end,
                        icon = Lang.target.getpack.icon,
                        label = Lang.target.getpack.label,
                        canInteract = function(entity, distance, data)
                            local coords = GetEntityCoords(entity)
                            if onJob and nLoc.index ~= nil  and GetPlate(entity) == vehPlate and #(coords - Config.Shipments.freight.location[nLoc.index].pos[cLoc]) < 20.0 and not pickUp then
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