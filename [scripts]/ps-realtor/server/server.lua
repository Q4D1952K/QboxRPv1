RegisterNetEvent('QBCore:Server:UpdateObject', function()
	if source ~= '' then return false end
end)

RegisterNetEvent("bl-realtor:server:updateProperty", function(type, property_id, data)
    -- Job check
    local src = source
    local Player = exports.qbx_core:GetPlayer(src)
    local PlayerData = Player.PlayerData
    if not RealtorJobs[PlayerData.job.name] then return false end

    data.realtorSrc = src
    -- Update property
    TriggerEvent("ps-housing:server:updateProperty", type, property_id, data)
end)

RegisterNetEvent("bl-realtor:server:registerProperty", function(data)
    -- Job check
    local src = source
    local Player = exports.qbx_core:GetPlayer(src)
    local PlayerData = Player.PlayerData
    if not RealtorJobs[PlayerData.job.name] then return false end

    data.realtorSrc = src
    -- Register property
    TriggerEvent("ps-housing:server:registerProperty", data)
end)

RegisterNetEvent("bl-realtor:server:addTenantToApartment", function(data)
    -- Job check
    local src = source
    local Player = exports.qbx_core:GetPlayer(src)
    local PlayerData = Player.PlayerData
    if not RealtorJobs[PlayerData.job.name] then return false end

    data.realtorSrc = src
    -- Add tenant
    TriggerEvent("ps-housing:server:addTenantToApartment", data)
end)

lib.callback.register("bl-realtor:server:getNames", function (source, data)
    local src = source
    local Player = exports.qbx_core:GetPlayer(src)
    local PlayerData = Player.PlayerData
    if not RealtorJobs[PlayerData.job.name] then return false end
    
    local names = {}
    for i = 1, #data do
        local target = exports.qbx_core:GetPlayerByCitizenId(data[i]) or exports.qbx_core:GetOfflinePlayer(data[i])
        if target then
            names[#names+1] = target.PlayerData.charinfo.firstname .. " " .. target.PlayerData.charinfo.lastname
        else
            names[#names+1] = "Unknown"
        end
    end
    
    return names
end)

if Config.UseItem then
    QBCore.Functions.CreateUseableItem(Config.ItemName, function(source, item)
        local src = source
        local Player = exports.qbx_core:GetPlayer(src)
        if Player.Functions.GetItemByName(item.name) ~= nil then
            TriggerClientEvent("bl-realtor:client:toggleUI", src)
        end
    end)
end
