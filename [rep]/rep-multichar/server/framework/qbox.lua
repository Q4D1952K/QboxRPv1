if not Framework.QBox() then print('miss') return end
local startWithApartments = GetResourceState('qbx_apartments'):find('start')
local  starterItems = {
    { name = 'phone', amount = 1 },
    { name = 'id_card', amount = 1, metadata = function(source)
            assert(GetResourceState('qbx_idcard') == 'started', 'qbx_idcard resource not found. Required to give an id_card as a starting item')
            return exports.qbx_idcard:GetMetaLicense(source, {'id_card'})
        end
    },
    { name = 'driver_license', amount = 1, metadata = function(source)
            assert(GetResourceState('qbx_idcard') == 'started', 'qbx_idcard resource not found. Required to give an id_card as a starting item')
            return exports.qbx_idcard:GetMetaLicense(source, {'driver_license'})
        end
    },
}


function GiveStarterItems(src)
    if GetResourceState('ox_inventory') == 'missing' then return end
    while not exports.ox_inventory:GetInventory(src) do
        Wait(100)
    end
    for i = 1, #starterItems do
        local item = starterItems[i]
        if item.metadata and type(item.metadata) == 'function' then
            exports.ox_inventory:AddItem(src, item.name, item.amount, item.metadata(src))
        else
            exports.ox_inventory:AddItem(src, item.name, item.amount, item.metadata)
        end
    end
end

lib.callback.register('rep-multichar:callback:getPlayerData', function(source)
    print('cb')
    local src = source
    local identifier = Framework.GetIdentifier(src)
    local player = {}
    local result = MySQL.query.await("SELECT cid, charinfo, job, money, citizenid FROM players WHERE  license = ?",{ identifier })
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
                local result1 = MySQL.query.await('SELECT * FROM playerskins WHERE citizenid = ? AND active = ?',
                    { player[i].citizenid, 1 })
                if result1[1] ~= nil then
                    player[i].model = result1[1].model
                    player[i].skin = json.decode(result1[1].skin)
                end
            end
        end
    end
    return player
end)

RegisterNetEvent('rep-multichar:server:addNewCharacter', function(data, cid)
    local src = source
    local newData = {}
    newData.cid = cid
    newData.charinfo = data
    local success = exports['qbx_core']:Login(src, nil, newData)
    if not success then return end
    GiveStarterItems(src)
    if GetResourceState('qbx_spawn') == 'missing' then
        exports.qbx_core:SetPlayerBucket(src, 0)
    end
    if GetResourceState('qbx_spawn') == 'missing' then
        TriggerEvent('qb-clothes:client:CreateFirstCharacter')
    else
        if startWithApartments then
            TriggerClientEvent('apartments:client:setupSpawnUI', src, newData)
        else
            TriggerClientEvent('qbx_core:client:spawnNoApartments',src)
        end
    end

end)

RegisterNetEvent('rep-multichar:server:startGame', function(data)
    local src = source
    local cData = { citizenid = data }
    local success =  exports['qbx_core']:Login(src, cData.citizenid)
    if not success then return end
    exports.qbx_core:SetPlayerBucket(source, 0)
    logger.log({
        source = 'qbx_core',
        webhook = "",
        event = 'Loaded',
        color = 'green',
        message = ('**%s** (%s |  ||%s|| | %s | %s | %s) loaded'):format(GetPlayerName(source), GetPlayerIdentifierByType(source, 'discord') or 'undefined', GetPlayerIdentifierByType(source, 'ip') or 'undefined', GetPlayerIdentifierByType(source, 'license2') or GetPlayerIdentifierByType(source, 'license') or 'undefined', cData.citizenid, source)
    })
    print('^2[rep-multichar]^7 ' .. GetPlayerName(src) .. ' (Citizen ID: ' .. cData.citizenid .. ') logged in!')
    if GetResourceState('qbx_apartments'):find('start') then
        TriggerClientEvent('apartments:client:setupSpawnUI',src, cData.citizenid)
    elseif GetResourceState('qbx_spawn'):find('start') then
        TriggerClientEvent('qb-spawn:client:setupSpawns',src, cData.citizenid)
        TriggerClientEvent('qb-spawn:client:openUI',src, true)
    end
end)

RegisterNetEvent('rep-multichar:server:deleteCharacter', function(id)
    exports['qbx_core']:DeleteCharacter(id)
end)

function Framework.GetIdentifier(src)
    return GetPlayerIdentifierByType(src, 'license2')
end

AddEventHandler('QBCore:Server:PlayerLoaded', function(Player)
    Wait(1000) -- 1 second should be enough to do the preloading in other resources
    hasDonePreloading[Player.PlayerData.source] = true
end)

AddEventHandler('QBCore:Server:OnPlayerUnload', function(src)
    hasDonePreloading[src] = false
end)