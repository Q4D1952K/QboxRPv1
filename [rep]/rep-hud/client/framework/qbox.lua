if not Framework.QBox() then return end
local QBX = exports.qbx_core
Framework.Data = {
    player = {},
    vehicle = {},
}
local playerState = LocalPlayer.state
Framework.Data.player.stress = playerState.stress or 0
Framework.Data.player.hunger = playerState.hunger or 100
Framework.Data.player.thirst = playerState.thirst or 100

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    Wait(2000)
    local PlayerData = QBX:GetPlayerData()
    Framework.Data.player.stress = PlayerData.metadata.stress
    Framework.Data.player.hunger = PlayerData.metadata.hunger
    Framework.Data.player.thirst = PlayerData.metadata.thirst
    Framework.Data.player.cashAmount = PlayerData.money.cash
    Framework.Data.player.bankAmount = PlayerData.money.bank
    loadMap()
end)

RegisterNetEvent('hud:client:OnMoneyChange', function(type, amount, isMinus)
    local PlayerData = QBX:GetPlayerData()
    Framework.Data.player.cashAmount = PlayerData.money.cash
    Framework.Data.player.bankAmount = PlayerData.money.bank
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
    Framework.Data.player.hunger = newHunger
    Framework.Data.player.thirst = newThirst
end)

AddStateBagChangeHandler('hunger', ('player:%s'):format(cache.serverId), function(_, _, value)
    Framework.Data.player.hunger = value
end)

AddStateBagChangeHandler('thirst', ('player:%s'):format(cache.serverId), function(_, _, value)
    Framework.Data.player.thirst = value
end)

---@deprecated Use statebags instead
RegisterNetEvent('hud:client:UpdateStress', function(newStress)
    Framework.Data.player.stress = newStress
end)

AddStateBagChangeHandler('stress', ('player:%s'):format(cache.serverId), function(_, _, value)
    Framework.Data.player.stress = value
end)

RegisterNetEvent('hud:client:ToggleShowSeatbelt', function()
    Framework.Data.vehicle.showSeatbelt = not Framework.Data.vehicle.showSeatbelt
end)

---@deprecated Use statebags instead
RegisterNetEvent('hud:client:UpdateNitrous', function(_, nitroLevel, bool)
    Framework.Data.vehicle.nitroActive = bool
end)

qbx.entityStateHandler('nitroFlames', function(veh, netId, value)
    local plate = qbx.string.trim(GetVehicleNumberPlateText(veh))
    local cachePlate = qbx.string.trim(GetVehicleNumberPlateText(cache.vehicle))
    if plate ~= cachePlate then return end
    Framework.Data.vehicle.nitroActive = value
end)

function Framework.Notification(_msg, _type, _time)
    exports.qbx_core:Notify(_msg, _type, _time)
end