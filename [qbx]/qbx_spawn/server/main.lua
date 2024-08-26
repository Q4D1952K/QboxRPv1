lib.callback.register('qbx_spawn:server:getLastLocation', function(source)
    local player = exports.qbx_core:GetPlayer(source)
    return json.decode(MySQL.single.await('SELECT position FROM players WHERE citizenid = ?', {player.PlayerData.citizenid}).position), player.PlayerData.metadata.currentPropertyId
end)

lib.callback.register('qbx_spawn:server:getHouses', function(source)
    local player = exports.qbx_core:GetPlayer(source)
    if player.PlayerData.citizenid ~= nil then
        local houses = MySQL.query.await('SELECT * FROM properties WHERE owner_citizenid = ?', {player.PlayerData.citizenid})
        if houses[1] ~= nil then
            return houses
        else
            return {}
        end
    else
        return {}
    end
end)
