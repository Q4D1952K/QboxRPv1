if not Framework.ESX() then return end

local ESX = exports.es_extended:getSharedObject()

local function setPlayerData(playerData)
    Framework.PlayerJob = playerData.job
end

RegisterNetEvent("esx:playerLoaded", function(xPlayer, isNew)
    Wait(5000)
    setPlayerData(xPlayer)
    initShop()
end)

RegisterNetEvent('esx:setJob', function (job, lastJob)
    Framework.PlayerJob = job
end)

function Framework.getWeight()
    if Config.OxInventory then
        return exports.ox_inventory:GetPlayerWeight()
    else
        local weight = 0
        for _, data in pairs(ESX.GetPlayerData().inventory) do
            if data.count > 0 then
                if items[data.name] then
                    weight = items[data.name].weight * 1000 * data.count
                end
            end
        end
        return weight
    end
end

function Framework.checkJob(filters)
    local _type = type(filters)
    if _type == 'string' then
        local data = Framework.PlayerJob
        if filters == data?.name then
            return true
        end
    elseif _type == 'table' then
        local tabletype = table.type(filters)
        if tabletype == 'hash' then
            for name, grade in pairs(filters) do
                local data = Framework.PlayerJob
                if data?.name == name and grade <= data.grade then
                    return true
                end
            end
        elseif tabletype == 'array' then
            for j = 1, #filters do
                local name = filters[j]
                local data = Framework.PlayerJob
                if data?.name == name then
                    return true
                end
            end
        end
    end
end

function Framework.Notification(_msg, _type, _time)
    ESX.ShowNotification(_msg, _type, _time)
end

function Framework.getMoney(name)
    if name == 'cash' then
        name = 'money'
    end
    for _, data in pairs(ESX.GetPlayerData().accounts) do
        if data.name == name then
            return data.money
        end
    end
    return 0
end
