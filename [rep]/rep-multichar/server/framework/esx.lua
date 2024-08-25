if not Framework.ESX() then return end

local ESX = exports.es_extended:getSharedObject()

if next(ESX.Players) then
    local players = table.clone(ESX.Players)
    table.wipe(ESX.Players)
    for _, v in pairs(players) do
        ESX.Players[Framework.GetIdentifier(v.source)] = true
    end
else
    ESX.Players = {}
end

local StarterItems = {

}

function GiveStarterItems(src)
    local Player = ESX.GetPlayerFromId(src)
    for k, v in pairs(StarterItems) do
        local info = {}
        Player.addInventoryItem(v.item, v.amount)
    end
end

function loadHouseData()
   
end

local PRIMARY_IDENTIFIER = ESX.GetConfig().Identifier or GetConvar('sv_lan', '') == 'true' and 'ip' or "license"
local DB_TABLES = {users = 'identifier'}
local PREFIX = 'char'

lib.callback.register('rep-multichar:callback:getPlayerData', function(source)
    local src = source
    local player = {}
    local identifier = ESX.GetIdentifier(source)
    ESX.Players[identifier] = true
    local result = MySQL.query.await('SELECT identifier, accounts, job, firstname, lastname, nationality, sex, skin FROM users WHERE identifier LIKE ?', {("%s%%:%s"):format(PREFIX, identifier)})
    for i = 1, 3, 1 do
        player[i] = {}
        for k, v in pairs(result) do
            local id = tonumber(string.sub(v.identifier, #PREFIX+1, string.find(v.identifier, ":")-1))
            if id == i then
                local _money = json.decode(v.accounts)
                player[i].citizenid = v.identifier
                player[i].cash = _money.money
                player[i].bank = _money.bank
                player[i].job = ESX.Jobs[v.job] and ESX.Jobs[v.job].label or "Unemployed"
                player[i].nationality = v.nationality
                player[i].firstname = v.firstname
                player[i].lastname = v.lastname
                player[i].gender = tostring(v.sex) == 'm' and 'male' or 'female'
                player[i].model = player[i].gender == 'male' and 'mp_m_freemode_01' or 'mp_f_freemode_01'
                player[i].skin = nil
                if v.skin ~= nil then
                    player[i].skin = json.decode(v.skin)
                    if player[i].skin.model then
                        player[i].model = player[i].skin.model
                    end
                end
            end
        end
    end
    return(player)
end)

RegisterNetEvent('rep-multichar:server:addNewCharacter', function(data, cid)
    local src = source
    local Identity = {
        firstName = data.firstname,
        lastName = data.lastname,
        dateOfBirth = data.dateofbirth,
        sex = data.sex,
        height = 170,
    }

    local charId =("%s%s"):format(PREFIX, cid)
    TriggerEvent("esx:onPlayerJoined", source, charId, data)
    ESX.Players[ESX.GetIdentifier(source)] = true
    TriggerClientEvent('esx_identity:setPlayerData', src, Identity)
    SetPlayerRoutingBucket(src, src)
end)

RegisterNetEvent('rep-multichar:server:startGame', function(data)
    local src = source
    local splitData = {}
    for word in string.gmatch(data, '([^:]+)') do
        table.insert(splitData, word)
    end
    TriggerEvent("esx:onPlayerJoined", source, splitData[1])
    ESX.Players[ESX.GetIdentifier(source)] = true
end)

function Framework.GetIdentifier(src)
    local fxDk = GetConvarInt('sv_fxdkMode', 0)
	if fxDk == 1 then
		return "ESX-DEBUG-LICENCE"
	end
	local identifier = PRIMARY_IDENTIFIER..':'
	for _, v in pairs(GetPlayerIdentifiers(src)) do
		if string.match(v, identifier) then
			identifier = string.gsub(v, identifier, '')
			return identifier
		end
	end
end

RegisterNetEvent('rep-multichar:server:deleteCharacter', function(charid)
    local src = source
	local query = 'DELETE FROM %s WHERE %s = ?'
	local queries = {}
	local count = 0
	for table, column in pairs(DB_TABLES) do
		count = count +  1
		queries[count] = {query = query:format(table, column), values = {charid}}
	end
	MySQL.transaction(queries, function(result)
		if result then
			print(('[^2INFO^7] Player ^5%s %s^7 has deleted a character ^5(%s)^7'):format(GetPlayerName(src), src, charid))
			Wait(50)
			DropPlayer(src, "Delete Chracter")
		else
			error('\n^1Transaction failed while trying to delete '..charid..'^0')
		end
	end)
end)

AddEventHandler('esx:playerLoaded', function(playerId, xPlayer)
    hasDonePreloading[playerId] = true
end)

AddEventHandler('playerDropped', function(reason)
    hasDonePreloading[source] = false
end)
