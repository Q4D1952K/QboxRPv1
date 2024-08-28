local QBCore = exports['qb-core']:GetCoreObject()

local hookid = exports.ox_inventory:registerHook('createItem', function(payload)
    local _gender = splitStr(payload.metadata.clothingname, "_")[1]
    local _type = splitStr(payload.metadata.clothingname, "_")[2]
    local _index = tonumber(splitStr(payload.metadata.clothingname, "_")[3])
    return {
        label = Config.ClothingData[_type][_gender][_index].label,
        image = _type,--  payload.metadata.clothingname,
        clothing = Config.ClothingData[_type][_gender][_index],
        clothingtype = _type,
        gender = _gender
    }
end, {
    itemFilter = {
        clothing = true
    }
})

exports('clothing', function(event, item, inventory, slot, data)
    if event == 'usingItem' then
        local i = exports.ox_inventory:GetSlot(inventory.id, slot)
        TriggerClientEvent('kid_clothing:client:macdo', inventory.id, i)
        return
    end
end)

lib.callback.register('savescreenshot2', function(source, gender, _type, id)
    print(_type, gender, id)
    local p = promise.new()
    local gt
    exports['screenshot-basic']:requestClientScreenshot(source, {
        fileName = ('clothes/%s/%s.png'):format(_type, gender.."_".._type.."_"..id),
        encoding = 'png',
        quality = 1.0,
        crop = {
            offsetX = 0,
            offsetY = 0,
            width   = 1000,
            height  = 1000
        }
    }, function(err, data)
        print('err', err)
        print('data', data)
        p:resolve(data)
    end)
    return Citizen.Await(p)
end)
