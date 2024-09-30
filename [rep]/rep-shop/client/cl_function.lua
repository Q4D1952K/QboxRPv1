peds = {}
blips = {}
items = {}

function initShop()
    for _index, _value in pairs(Config.Stores) do
        for _index2, _value2 in pairs(_value.locations) do
            if _value.blips then
                blips[_index.."_".._index2] = AddBlipForCoord(_value2.x, _value2.y, _value2.z)
                SetBlipSprite(blips[_index.."_".._index2], _value.blips.sprite)
                SetBlipScale(blips[_index.."_".._index2], _value.blips.scale)
                SetBlipDisplay(blips[_index.."_".._index2], 4)
                SetBlipColour(blips[_index.."_".._index2], _value.blips.color)
                SetBlipAsShortRange(blips[_index.."_".._index2], true)
                BeginTextCommandSetBlipName("STRING")
                AddTextComponentSubstringPlayerName(_value.name)
                EndTextCommandSetBlipName(blips[_index.."_".._index2])
            end
            if _value.ped then
                lib.requestModel(_value.ped, 500)
                peds[_index.."_".._index2] = CreatePed(0, _value.ped, _value2.x, _value2.y, _value2.z, _value2.w, false, true)
                SetPedFleeAttributes(peds[_index.."_".._index2], 0, false)
                SetPedDiesWhenInjured(peds[_index.."_".._index2], false)
                TaskStartScenarioInPlace(peds[_index.."_".._index2], "WORLD_HUMAN_STAND_MOBILE", 0, true)
                SetPedKeepTask(peds[_index.."_".._index2], true)
                SetBlockingOfNonTemporaryEvents(peds[_index.."_".._index2], true)
                SetEntityInvincible(peds[_index.."_".._index2], true)
                FreezeEntityPosition(peds[_index.."_".._index2], true)
                if Config.Target == 'ox_target' then
                    exports.ox_target:addLocalEntity(peds[_index.."_".._index2],
                        {
                            {
                                onSelect = function(entity)
                                    openShop(_index, _index2)
                                end,
                                icon = Lang.target.shop.icon,
                                label = Lang.target.shop.label,
                                distance = 2.0,
                            },
                        }
                    )
                else
                    exports[Config.Target]:AddTargetEntity(peds[_index.."_".._index2], {
                        options =  {
                            {
                                action = function()
                                    openShop(_index, _index2)
                                end,
                                icon = Lang.target.shop.icon,
                                label = Lang.target.shop.label,
                            },
                        },
                        distance = 2.0
                    })
                end
            end
        end
    end
    if Config.Inventory == 'ox' then
        for item, data in pairs(exports.ox_inventory:Items()) do
            items[data.name] = {
                name = data.name,
                label = data.label,
                image = (data.client and data.client.image) and data.client.image or Config.ImgLink..data.name..".png",
                description = data.description,
                weight = data.weight
            }
        end
    elseif Framework.ESX() then
        local esxitems = lib.callback.await('rep-shop:callback:getItems', false)
        for item, data in pairs(esxitems) do
            items[data.name] = {
                name = data.name,
                label = data.label,
                image = Config.ImgLink..data.name..".png",
                description = "",
                weight = data.weight
            }
        end
    elseif Framework.QBCore() then
        local QBCore = exports['qb-core']:GetCoreObject()
        for item, data in pairs(QBCore.Shared.Items) do
            items[data.name] = {
                name = data.name,
                label = data.label,
                image = Config.ImgLink..data.image,
                description = data.description,
                weight = data.weight
            }
        end
    end
end

AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        Wait(5000)
        initShop()
    end
end)

AddEventHandler('onResourceStop', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        for _index, _value in pairs(peds) do
            DeleteEntity(_value)
        end
        for _index, _value in pairs(blips) do
            RemoveBlip(_value)
        end
    end
end)