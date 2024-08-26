if not Framework.QBox() then return end

local QBX = exports.qbx_core

function Framework.GetPlayerGender()
    Framework.PlayerData = exports.qbx_core:GetPlayerData()
    if tonumber(Framework.PlayerData.charinfo.gender) == 1 then
        return "Female"
    end
    return "Male"
end

RegisterNetEvent('rep-multichar:client:spawnLastLocation', function (cData)
    DoScreenFadeOut(500)

    while not IsScreenFadedOut() do
        Wait(0)
    end
    local result = lib.callback.await('ps-housing:cb:GetOwnedApartment', source, cData.citizenid)
    if result then
        TriggerEvent("apartments:client:SetHomeBlip", result.type)
    end

    pcall(function() exports.spawnmanager:spawnPlayer({
        x = QBX.PlayerData.position.x,
        y = QBX.PlayerData.position.y,
        z = QBX.PlayerData.position.z,
        heading = QBX.PlayerData.position.w
    }) end)

    TriggerServerEvent('QBCore:Server:OnPlayerLoaded')
    TriggerEvent('QBCore:Client:OnPlayerLoaded')
    TriggerServerEvent('qb-houses:server:SetInsideMeta', 0, false)
    TriggerServerEvent('qb-apartments:server:SetInsideMeta', 0, 0, false)

    while not IsScreenFadedIn() do
        Wait(0)
    end
end)