if not Framework.QBCore() or Framework.QBox() then return end

local QBCore = exports['qb-core']:GetCoreObject()

local function GiveStarterItems(src)
    local Player = QBCore.Functions.GetPlayer(src)
    for k, v in pairs(QBCore.Shared.StarterItems) do
        local info = {}
        if v.item == "id_card" then
            info.citizenid = Player.PlayerData.citizenid
            info.firstname = Player.PlayerData.charinfo.firstname
            info.lastname = Player.PlayerData.charinfo.lastname
            info.birthdate = Player.PlayerData.charinfo.birthdate
            info.gender = Player.PlayerData.charinfo.gender
            info.nationality = Player.PlayerData.charinfo.nationality
        elseif v.item == "driver_license" then
            info.firstname = Player.PlayerData.charinfo.firstname
            info.lastname = Player.PlayerData.charinfo.lastname
            info.birthdate = Player.PlayerData.charinfo.birthdate
            info.type = "Class C Driver License"
        end
        Player.Functions.AddItem(v.item, v.amount, false, info)
    end
end

function loadHouseData()
    local HouseGarages = {}
    local Houses = {}
    local result = MySQL.query.await('SELECT * FROM houselocations', {})
    if result[1] ~= nil then
        for k, v in pairs(result) do
            local owned = false
            if tonumber(v.owned) == 1 then
                owned = true
            end
            local garage = v.garage ~= nil and json.decode(v.garage) or {}
            Houses[v.name] = {
                coords = json.decode(v.coords),
                owned = owned,
                price = v.price,
                locked = true,
                adress = v.label,
                tier = v.tier,
                garage = garage,
                decorations = {},
            }
            HouseGarages[v.name] = {
                label = v.label,
                takeVehicle = garage,
            }
        end
    end
    TriggerClientEvent("qb-garages:client:houseGarageConfig", -1, HouseGarages)
    TriggerClientEvent("qb-houses:client:setHouseConfig", -1, Houses)
end

lib.callback.register('rep-multichar:callback:getPlayerData', function(source)
    local src = source
    local identifier = Framework.GetIdentifier(src)
    local player = {}
    local result = MySQL.query.await("SELECT cid, charinfo, job, money, citizenid FROM players WHERE  license = ?",
        { identifier })
    for i = 1, 3, 1 do
        player[i] = {}
        for k, v in pairs(result) do
            if tonumber(v.cid) == i then
                local _money = json.decode(v.money)
                local _charinfo = json.decode(v.charinfo)
                local _job = json.decode(v.job)
                player[i].citizenid = v.citizenid
                player[i].cash = _money.cash
                player[i].bank = _money.bank
                player[i].job = _job.label
                player[i].nationality = _charinfo.nationality
                player[i].firstname = _charinfo.firstname
                player[i].lastname = _charinfo.lastname
                player[i].gender = tostring(_charinfo.gender) == '0' and 'male' or 'female'
                player[i].skin = nil
                player[i].model = player[i].gender == 'male' and 'mp_m_freemode_01' or 'mp_f_freemode_01'
                local result1 = MySQL.query.await('SELECT * FROM playerskins WHERE citizenid = ? AND active = ?', { player[i].citizenid, 1 })
                if result1[1] ~= nil then
                    player[i].model = result1[1].model
                    player[i].skin = json.decode(result1[1].skin)
                end
            end
        end
    end

    return (player)
end)

RegisterNetEvent('rep-multichar:server:addNewCharacter', function(data, cid)
    local src = source
    local newData = {}
    newData.cid = cid
    newData.charinfo = data
    if QBCore.Player.Login(src, false, newData) then
        repeat
            Wait(10)
        until hasDonePreloading[src]
        QBCore.Commands.Refresh(src)
        newData.citizenid = QBCore.Functions.GetPlayer(src).PlayerData.citizenid
        -- TriggerClientEvent('ps-housing:client:setupSpawnUI', src, newData)
        TriggerClientEvent('apartments:client:setupSpawnUI', src, newData)
        loadHouseData()
        QBCore.Functions.SetPlayerBucket(src, 0)
        GiveStarterItems(src)
    end
end)

RegisterNetEvent('rep-multichar:server:startGame', function(data)
    local src = source
    local cData = { citizenid = data }
    if QBCore.Player.Login(src, data) then
        QBCore.Commands.Refresh(src)
        QBCore.Functions.SetPlayerBucket(src, 0)
        repeat
            Wait(10)
        until hasDonePreloading[src]
        local identifiers = GetPlayerIdentifiers(src)
        local msg = ""
        for _, v in pairs(identifiers) do
            if string.sub(v, 1, string.len("steam:")) == "steam:" then
                msg = msg .. "\n Steam: " .. v
            end
            if string.sub(v, 1, string.len("discord:")) == "discord:" then
                msg = msg .. "\n Discord: " .. v
            end
            if string.sub(v, 1, string.len("ip:")) == "ip:" then
                msg = msg .. "\n Ip: " .. v
            end
            if string.sub(v, 1, string.len("license:")) == "license:" then
                msg = msg .. "\n License: " .. v
            end
        end
        print('^2[rep-multichar]^7 ' .. GetPlayerName(src) .. ' (Citizen ID: ' .. cData.citizenid .. ') logged in!')
        loadHouseData()
        TriggerClientEvent('apartments:client:setupSpawnUI', src, cData)
        -- TriggerClientEvent('ps-housing:client:setupSpawnUI', src, cData)
    end
end)

RegisterNetEvent('rep-multichar:server:deleteCharacter', function(id)
    local src = source
    QBCore.Player.DeleteCharacter(src, id)
end)

function Framework.GetIdentifier(src)
    return QBCore.Functions.GetIdentifier(src, 'license')
end

AddEventHandler('QBCore:Server:PlayerLoaded', function(Player)
    Wait(1000) -- 1 second should be enough to do the preloading in other resources
    hasDonePreloading[Player.PlayerData.source] = true
end)

AddEventHandler('QBCore:Server:OnPlayerUnload', function(src)
    hasDonePreloading[src] = false
end)
