if not Framework.ESX() then return end

local ESX = exports.es_extended:getSharedObject()

function Framework.GetPlayerGender()
    Framework.PlayerData = ESX.GetPlayerData()
    if tonumber(Framework.PlayerData.sex) == 1 then
        return "Female"
    end
    return "Male"
end

RegisterNetEvent("esx:playerLoaded", function(xPlayer, isNew)
    Framework.PlayerData = xPlayer
    if isNew then
        DoScreenFadeOut(500)
        Wait(1000)
        FreezeEntityPosition(cache.ped, false)
        SetEntityCoords(cache.ped, Config.CreateCharacterCoords.x, Config.CreateCharacterCoords.y, Config.CreateCharacterCoords.z)
        SetEntityHeading(cache.ped, Config.CreateCharacterCoords.w)
        while true do
            if #(GetEntityCoords(cache.ped) - vector3(Config.CreateCharacterCoords.x, Config.CreateCharacterCoords.y, Config.CreateCharacterCoords.z)) < 1.0 then
                break
            end
            SetEntityCoords(cache.ped, Config.CreateCharacterCoords.x, Config.CreateCharacterCoords.y, Config.CreateCharacterCoords.z)
            Wait(100)
        end
        Wait(500)
        DoScreenFadeIn(250)
        DisableTime()
        createChracter()
    else
        local spawn = Framework.PlayerData.coords
        DoScreenFadeOut(500)
        Wait(1000)
        SwitchOutPlayer(cache.ped, 0, 1)
		SetEntityCoordsNoOffset(cache.ped, spawn.x, spawn.y, spawn.z, false, false, false, true)
		SetEntityHeading(cache.ped, spawn.heading)
        FreezeEntityPosition(cache.ped, false)
        SetCamActive(cam, false)
        cam = nil
        DestroyAllCams(true)
        RenderScriptCams(false, true, 2000, true, true)
        Wait(500)
        DoScreenFadeIn(250)
		repeat Wait(200) until not IsScreenFadedOut()
		TriggerServerEvent('esx:onPlayerSpawn')
        EnableTime()
        SwitchInPlayer(cache.ped)
        TriggerEvent('esx:onPlayerSpawn')
		TriggerEvent('playerSpawned')
    end
end)