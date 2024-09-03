if not Framework.ESX() then return end

local ESX = exports.es_extended:getSharedObject()

RegisterNetEvent("esx:playerLoaded", function(xPlayer, isNew)
    Wait(5000)
    if Config.UseTalkNPC then
        talkNPC()
    else
        targetNPC()
    end
    if Config.Target == 'ox_target' then
        exports.ox_target:addGlobalVehicle( {
            {
                onSelect = function(data)
                    throwTrash()
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
                        throwTrash()
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
end)

function Framework.GetItems()
    local exchangeItem = {}
    if Config.OxInventory then
        for item, data in pairs(exports.ox_inventory:Items()) do
            for k, v in pairs(Config.Exchange.listitems) do
                if item == v.name then
                    exchangeItem[v.name] = {name = v.name, label = data.label, image = (data.client and data.client.image) and data.client.image or Config.ImgLink..v.name..".png"}
                end
            end
        end
    else
        local esxitems = lib.callback.await('rep-sanitation:callback:getItems', false)
        for item, data in pairs(esxitems) do
            exchangeItem[data.name] = {name = data.name, label = data.label, image = Config.ImgLink..data.name..".png"}
        end
    end
    return exchangeItem
end

function Framework.Notification(_msg, _type, _time)
    ESX.ShowNotification(_msg, _type, _time)
end