if not Framework.QBox() then return end
local QBX = exports.qbx_core
local playerState = LocalPlayer.state
stress = playerState.stress or 0
hunger = playerState.hunger or 100
thirst = playerState.thirst or 100

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    Wait(2000)
    local PlayerData = QBX:GetPlayerData()
    stress = PlayerData.metadata.stress
    hunger = PlayerData.metadata.hunger
    thirst = PlayerData.metadata.thirst
    cashAmount = PlayerData.money.cash
    bankAmount = PlayerData.money.bank
    loadMap()
end)

RegisterNetEvent('hud:client:OnMoneyChange', function(type, amount, isMinus)
    local PlayerData = QBX:GetPlayerData()
    cashAmount = PlayerData.money.cash
    bankAmount = PlayerData.money.bank
    SendNUIMessage({
        action = 'moneyChange',
        data = {
            type = type,
            amount = amount,
            isMinus = isMinus
        }
    })
end)

function Framework.getIdentifier()
    return QBX:GetPlayerData().citizenid
end

---@deprecated Use statebags instead
RegisterNetEvent('hud:client:UpdateNeeds', function(newHunger, newThirst) -- Triggered in qb-core
    hunger = newHunger
    thirst = newThirst
end)



---@deprecated Use statebags instead
RegisterNetEvent('hud:client:UpdateStress', function(newStress)
    stress = newStress
end)

AddStateBagChangeHandler('stress', ('player:%s'):format(cache.serverId), function(_, _, value)
    stress = value
end)

RegisterNetEvent('seatbelt:client:ToggleSeatbelt', function()
    showSeatbelt = not showSeatbelt
    SendNUIMessage({
        action = 'toggleSeatbelt',
        data = {
            active = showSeatbelt
        }
    })
end)

RegisterNetEvent('seatbelt:client:ToggleCruise', function()
    cruiseOn = not cruiseOn
    SendNUIMessage({
        action = 'toggleCruise',
        data = {
            active = cruiseOn
        }
    })
end)


function Framework.Notification(_msg, _type, _time)
    exports.qbx_core:Notify(_msg, _type, _time)
end