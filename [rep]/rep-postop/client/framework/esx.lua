if not Framework.ESX() then return end

local ESX = exports.es_extended:getSharedObject()
if ESX.PlayerData then
    if ESX.PlayerData.job then
        Framework.PlayerJob = ESX.PlayerData.job.name
    end
    Framework.PlayerJobGrade = ESX.PlayerData.grade
end



RegisterNetEvent("esx:playerLoaded", function(xPlayer, isNew)
    Framework.PlayerJob = xPlayer.job.name
    Framework.PlayerJobGrade = xPlayer.job.grade
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
end)

RegisterNetEvent('esx:setJob', function (job, lastJob)
    Framework.PlayerJob = job.name
    Framework.PlayerJobGrade = job.grade
end)

RegisterNetEvent('esx:setPlayerData', function(key, value)
    if key ~= 'job' then return end
    Framework.PlayerJob = value.name
    Framework.PlayerJobGrade = value.grade
end)

function Framework.Notification(_msg, _type, _time)
    ESX.ShowNotification(_msg, _type, _time)
end