if not Framework.ESX() then return end

local ESX = exports.es_extended:getSharedObject()

function Framework.getMoney(src, _type)
    if _type == 'cash' then
        _type = 'money'
    elseif _type == 'card' then
        _type = 'bank'
    end
    local xPlayer = ESX.GetPlayerFromId(src)
    return xPlayer.getAccount(_type).money
end

function Framework.removeMoney(src, _type, amount)
    if _type == 'cash' then
        _type = 'money'
    elseif _type == 'card' then
        _type = 'bank'
    end
    local xPlayer = ESX.GetPlayerFromId(src)
    xPlayer.removeAccountMoney(_type, amount, 'buy shop')
end

function Framework.Notification(src, msg, type , time)
    local xPlayer = ESX.GetPlayerFromId(src)
    xPlayer.showNotification(msg, type , time)
end

function Framework.AddItem(src, item, amount, info)
    local xPlayer = ESX.GetPlayerFromId(src)
    if Config.OxInventory then
        return exports.ox_inventory:AddItem(src, item, amount, info)
    else
        xPlayer.addInventoryItem(item, amount)
        return true
    end
end

lib.callback.register('rep-shops:callback:getPlayerLicense', function(source)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    MySQL.scalar('SELECT * FROM user_licenses WHERE owner = ?', {xPlayer.getIdentifier()}, function(result)
		if result and result[1] then
            local license = {}
            for k, v in pairs(result) do
                license[#license+1] = v.type
            end
            return license
        else
            return {}
        end
	end)
end)

lib.callback.register('rep-sanitation:callback:getItems', function(source, cb)
    local items = {}
    local response = MySQL.query.await('SELECT `name`, `label` FROM `items`')
    if response then
        for i = 1, #response do
            local row = response[i]
            items[#items+1] = {
                name = row.name,
                label = row.label,
                weight = row.weight * 1000,
            }
        end
    end
    return items
end)