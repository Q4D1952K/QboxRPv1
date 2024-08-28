local QBCore = exports['qb-core']:GetCoreObject()
local _blip, _zone = {}, {}
local shopping = false
local PlayerData = QBCore.Functions.GetPlayerData()

AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    PlayerData = QBCore.Functions.GetPlayerData()
  end)

RegisterNetEvent('QBCore:Player:SetPlayerData', function(val)
    PlayerData = val
end)

local function LoadDefaultModel(malePed, cb)
    local playerPed = GetPlayerPed(-1)
    local characterModel
    if malePed then
      characterModel = GetHashKey('mp_m_freemode_01')
    else
      characterModel = GetHashKey('mp_f_freemode_01')
    end
    RequestModel(characterModel)
    Citizen.CreateThread(function()
      while not HasModelLoaded(characterModel) do
        RequestModel(characterModel)
        Citizen.Wait(0)
      end
      if IsModelInCdimage(characterModel) and IsModelValid(characterModel) then
        SetPlayerModel(PlayerId(), characterModel)
        SetPedDefaultComponentVariation(playerPed)
        Wait(1000)
        SetPedMaxHealth(PlayerId(), 200.0)
        Wait(1000)
        SetPlayerHealthRechargeMultiplier(PlayerId(), 0.0)
        SetPlayerHealthRechargeLimit(PlayerId(), 0.0)
      end
      SetModelAsNoLongerNeeded(characterModel)
      if cb ~= nil then
        cb()
      end
      ClearPedProp(PlayerPedId(), 0)
    end)
end

local objs = {}
local cam
local weather = false

RegisterCommand('tool', function(source, args, rawCommand)
    DisplayRadar(false)
    TriggerEvent('qb-weathersync:client:DisableSync')
    local playerPed = PlayerPedId()
    local d = true
    if args[1] == 'female' then
        d = false
    end
    ClearPedTasks(PlayerPedId())
    local p = promise.new()
    LoadDefaultModel(d, function()
        playerPed = PlayerPedId()
        if k ~= 'hat' and k ~= 'glass' then
            SetPedComponentVariation(playerPed, 0, 0, 1, 0)
        else
            SetPedComponentVariation(playerPed, 0, 0, 0, 2)
        end
        p:resolve('done')
    end)
    Citizen.Await(p)
    playerPed = PlayerPedId()
    lib.requestAnimDict('anim@mp_corona_idles@female_b@idle_a')
    TaskPlayAnim(playerPed, 'anim@mp_corona_idles@female_b@idle_a', 'idle_a', 1.0, 1.0, -1, 1, 1, true, true, true)
    Wait(5000)
    SetPedComponentVariation(playerPed, 1, -1, 0, 0)
    SetPedComponentVariation(playerPed, 2, -1, 0, 0)
    SetPedComponentVariation(playerPed, 3, -1, 0, 0)
    SetPedComponentVariation(playerPed, 4, -1, 0, 0)
    SetPedComponentVariation(playerPed, 6, -1, 0, 0)
    SetPedComponentVariation(playerPed, 8, -1, 0, 0)
    SetPedComponentVariation(playerPed, 11, -1, 0, 0)
    local modelHash = GetHashKey('prop_big_cin_screen')
    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do
        Wait(1)
    end
    local pedCoords = GetEntityCoords(PlayerPedId())
    local obj = CreateObject(modelHash, pedCoords.x, pedCoords.y, pedCoords.z, true, true, false)
    FreezeEntityPosition(obj, true)
    table.insert(objs , obj)
    SetEntityCoords(PlayerPedId(), pedCoords.x, pedCoords.y, pedCoords.z + 5.0, 0.0, 0.0, 0.0, false)
    SetEntityHeading(PlayerPedId(), 180.0)
    FreezeEntityPosition(PlayerPedId(), true)
    local camCoords = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.0, 0.0)
    cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", camCoords.x, camCoords.y, camCoords.z, 0.00, 0.00, 0.00, 50.00, false, 0)
    SetCamActive(cam, true)
    SetCamCoord(cam,  camCoords.x,  camCoords.y,  camCoords.z)
    PointCamAtEntity(cam,  PlayerPedId())
    RenderScriptCams(true, false, 0, true, true)
    local gender = args[1]
    local _type = args[2]
    if Config.ChupAnh[_type] then
        local headCoords = GetPedBoneCoords(PlayerPedId(), Config.ChupAnh[_type].bone, 0.0, 0.0, 0.0)
        local camCoords = GetOffsetFromEntityInWorldCoords(PlayerPedId(), Config.ChupAnh[_type].camCoords[1], Config.ChupAnh[_type].camCoords[2], Config.ChupAnh[_type].camCoords[3])
        SetEntityHeading(PlayerPedId(), Config.ChupAnh[_type].heading)
        -- Nếu chụp watches vs backpack thì bỏ comment dòng này trong client
        if _type == 'watch' or _type == 'bag' or _type == 'bracelets' then
            SetEntityHeading(obj, Config.ChupAnh[_type].heading)
        end
        SetCamCoord(cam,  camCoords.x + Config.ChupAnh[_type].offsetCamCoords[1],  camCoords.y + Config.ChupAnh[_type].offsetCamCoords[2],  camCoords.z + Config.ChupAnh[_type].offsetCamCoords[3])
        PointCamAtCoord(cam, headCoords.x + Config.ChupAnh[_type].offsetPointCam[1], headCoords.y + Config.ChupAnh[_type].offsetPointCam[2], headCoords.z + Config.ChupAnh[_type].offsetPointCam[3])
        SetCamFov(cam, Config.ChupAnh[_type].camFov + 0.0)
        for _k, _v in pairs(Config.ClothingData[_type][gender]) do
            if _type == 'bag' then
                if IsPedComponentVariationValid(PlayerPedId(), 5, _v.drawble, _v.textures) then
                    SetPedPreloadVariationData(PlayerPedId(), 5, _v.drawble, _v.textures)
                    while not HasPedPreloadVariationDataFinished(PlayerPedId()) do
                        Wait(50)
                    end
                    if HasPedPreloadVariationDataFinished(PlayerPedId()) then
                        TaskPlayAnim(playerPed, 'anim@mp_corona_idles@female_b@idle_a', 'idle_a', 1.0, 1.0, -1, 1, 1, true, true, true)
                        SetPedComponentVariation(PlayerPedId(), 5, _v.drawble, _v.textures, 0)
                        Wait(100)
                        print(_type, gender, _v.drawble, _v.textures)
                        lib.callback('savescreenshot2',false,  function (path)
                            if path then
                                print(path)
                            end
                        end, gender, _type, _k)
                        Wait(500)
                    end
                    ReleasePedPreloadVariationData(PlayerPedId())
                end
            elseif _type == 'mask' then
                if IsPedComponentVariationValid(PlayerPedId(), 1, _v.drawble, _v.textures) then
                    SetPedPreloadVariationData(PlayerPedId(), 1, _v.drawble, _v.textures)
                    while not HasPedPreloadVariationDataFinished(PlayerPedId()) do
                        Wait(50)
                    end
                    if HasPedPreloadVariationDataFinished(PlayerPedId()) then
                        TaskPlayAnim(playerPed, 'anim@mp_corona_idles@female_b@idle_a', 'idle_a', 1.0, 1.0, -1, 1, 1, true, true, true)
                        SetPedComponentVariation(PlayerPedId(), 1, _v.drawble, _v.textures, 0)
                        Wait(100)
                        print(_type, gender, _v.drawble, _v.textures)
                        lib.callback('savescreenshot2', false,function (path)
                            if path then
                                print(path)
                            end
                        end, gender, _type, _k)
                        Wait(500)
                    end
                    ReleasePedPreloadVariationData(PlayerPedId())
                end
            elseif _type == 'gloves' then
                if gender == 'male' then
                    if IsPedComponentVariationValid(PlayerPedId(), 3,  Config.Arm['male'][2][_v.arm], _v.textures) then
                        SetPedPreloadVariationData(PlayerPedId(), 3,  Config.Arm['male'][2][_v.arm], _v.textures)
                        while not HasPedPreloadVariationDataFinished(PlayerPedId()) do
                            Wait(50)
                        end
                        if HasPedPreloadVariationDataFinished(PlayerPedId()) then
                            TaskPlayAnim(playerPed, 'anim@mp_corona_idles@female_b@idle_a', 'idle_a', 1.0, 1.0, -1, 1, 1, true, true, true)
                            SetPedComponentVariation(PlayerPedId(), 3,  Config.Arm['male'][2][_v.arm], _v.textures, 0)
                            Wait(100)
                            print(_type, gender,  Config.Arm['male'][2][_v.arm], _v.textures)
                            lib.callback('savescreenshot2', false,function (path)
                                if path then
                                    print(path)
                                end
                            end, gender, _type, _k)
                            Wait(500)
                        end
                        ReleasePedPreloadVariationData(PlayerPedId())
                    end
                else
                    if IsPedComponentVariationValid(PlayerPedId(), 3,  Config.Arm['female'][1][_v.arm], _v.textures) then
                        SetPedPreloadVariationData(PlayerPedId(), 3,  Config.Arm['female'][1][_v.arm], _v.textures)
                        while not HasPedPreloadVariationDataFinished(PlayerPedId()) do
                            Wait(50)
                        end
                        if HasPedPreloadVariationDataFinished(PlayerPedId()) then
                            TaskPlayAnim(playerPed, 'anim@mp_corona_idles@female_b@idle_a', 'idle_a', 1.0, 1.0, -1, 1, 1, true, true, true)
                            SetPedComponentVariation(PlayerPedId(), 3,  Config.Arm['female'][1][_v.arm], _v.textures, 0)
                            Wait(100)
                            print(_type, gender,  Config.Arm['female'][1][_v.arm], _v.textures)
                            lib.callback('savescreenshot2', false,function (path)
                                if path then
                                    print(path)
                                end
                            end, gender, _type, _k)
                            Wait(500)
                        end
                        ReleasePedPreloadVariationData(PlayerPedId())
                    end
                end
            elseif _type == 'pant' then
                if IsPedComponentVariationValid(PlayerPedId(), 4, _v.drawble, _v.textures) then
                    SetPedPreloadVariationData(PlayerPedId(), 4, _v.drawble, _v.textures)
                    while not HasPedPreloadVariationDataFinished(PlayerPedId()) do
                        Wait(50)
                    end
                    if HasPedPreloadVariationDataFinished(PlayerPedId()) then
                        TaskPlayAnim(playerPed, 'anim@mp_corona_idles@female_b@idle_a', 'idle_a', 1.0, 1.0, -1, 1, 1, true, true, true)
                        SetPedComponentVariation(PlayerPedId(), 4, _v.drawble, _v.textures, 0)
                        Wait(100)
                        print(_type, gender, _v.drawble, _v.textures)
                        lib.callback('savescreenshot2', false,function (path)
                            if path then
                                print(path)
                            end
                        end, gender, _type, _k)
                        Wait(500)
                    end
                    ReleasePedPreloadVariationData(PlayerPedId())
                end
            elseif _type == 'decals' then
                if IsPedComponentVariationValid(PlayerPedId(), 10, _v.drawble, _v.textures) then
                    SetPedPreloadVariationData(PlayerPedId(), 10, _v.drawble, _v.textures)
                    while not HasPedPreloadVariationDataFinished(PlayerPedId()) do
                        Wait(50)
                    end
                    if HasPedPreloadVariationDataFinished(PlayerPedId()) then
                        TaskPlayAnim(playerPed, 'anim@mp_corona_idles@female_b@idle_a', 'idle_a', 1.0, 1.0, -1, 1, 1, true, true, true)
                        SetPedComponentVariation(PlayerPedId(), 10, _v.drawble, _v.textures, 0)
                        Wait(100)
                        print(_type, gender, _v.drawble, _v.textures)
                        lib.callback('savescreenshot2', false,function (path)
                            if path then
                                print(path)
                            end
                        end, gender, _type, _k)
                        Wait(500)
                    end
                    ReleasePedPreloadVariationData(PlayerPedId())
                end
            elseif _type == 'shoes' then
                if IsPedComponentVariationValid(PlayerPedId(), 6, _v.drawble, _v.textures) then
                    SetPedPreloadVariationData(PlayerPedId(), 6, _v.drawble, _v.textures)
                    while not HasPedPreloadVariationDataFinished(PlayerPedId()) do
                        Wait(50)
                    end
                    if HasPedPreloadVariationDataFinished(PlayerPedId()) then
                        TaskPlayAnim(playerPed, 'anim@mp_corona_idles@female_b@idle_a', 'idle_a', 1.0, 1.0, -1, 1, 1, true, true, true)
                        SetPedComponentVariation(PlayerPedId(), 6, _v.drawble, _v.textures, 0)
                        Wait(100)
                        print(_type, gender, _v.drawble, _v.textures)
                        lib.callback('savescreenshot2', false,function (path)
                            if path then
                                print(path)
                            end
                        end, gender, _type, _k)
                        Wait(500)
                    end
                    ReleasePedPreloadVariationData(PlayerPedId())
                end
            elseif _type == 'neck' then
                if IsPedComponentVariationValid(PlayerPedId(), 7, _v.drawble, _v.textures) then
                    SetPedPreloadVariationData(PlayerPedId(), 7, _v.drawble, _v.textures)
                    while not HasPedPreloadVariationDataFinished(PlayerPedId()) do
                        Wait(50)
                    end
                    if HasPedPreloadVariationDataFinished(PlayerPedId()) then
                        TaskPlayAnim(playerPed, 'anim@mp_corona_idles@female_b@idle_a', 'idle_a', 1.0, 1.0, -1, 1, 1, true, true, true)
                        SetPedComponentVariation(PlayerPedId(), 7, _v.drawble, _v.textures, 0)
                        Wait(100)
                        print(_type, gender, _v.drawble, _v.textures)
                        lib.callback('savescreenshot2', false,function (path)
                            if path then
                                print(path)
                            end
                        end, gender, _type, _k)
                        Wait(500)
                    end
                    ReleasePedPreloadVariationData(PlayerPedId())
                end
            elseif _type == 'shirt' then
                if IsPedComponentVariationValid(PlayerPedId(), 8, _v.drawble, _v.textures) then
                    SetPedPreloadVariationData(PlayerPedId(), 8, _v.drawble, _v.textures)
                    while not HasPedPreloadVariationDataFinished(PlayerPedId()) do
                        Wait(50)
                    end
                    if HasPedPreloadVariationDataFinished(PlayerPedId()) then
                        TaskPlayAnim(playerPed, 'anim@mp_corona_idles@female_b@idle_a', 'idle_a', 1.0, 1.0, -1, 1, 1, true, true, true)
                        SetPedComponentVariation(PlayerPedId(), 8, _v.drawble, _v.textures, 0)
                        Wait(100)
                        print(_type, gender, _v.drawble, _v.textures)
                        lib.callback('savescreenshot2', false,function (path)
                            if path then
                                print(path)
                            end
                        end, gender, _type, _k)
                        Wait(500)
                    end
                    ReleasePedPreloadVariationData(PlayerPedId())
                end
            elseif _type == 'top' then
                if IsPedComponentVariationValid(PlayerPedId(), 11, _v.drawble, _v.textures) then
                    SetPedPreloadVariationData(PlayerPedId(), 11, _v.drawble, _v.textures)
                    while not HasPedPreloadVariationDataFinished(PlayerPedId()) do
                        Wait(50)
                    end
                    if HasPedPreloadVariationDataFinished(PlayerPedId()) then
                        TaskPlayAnim(playerPed, 'anim@mp_corona_idles@female_b@idle_a', 'idle_a', 1.0, 1.0, -1, 1, 1, true, true, true)
                        SetPedComponentVariation(PlayerPedId(), 11, _v.drawble, _v.textures, 0)
                        Wait(100)
                        print(_type, gender, _v.drawble, _v.textures)
                        lib.callback('savescreenshot2', false,function (path)
                            if path then
                                print(path)
                            end
                        end, gender, _type, _k)
                        Wait(500)
                    end
                    ReleasePedPreloadVariationData(PlayerPedId())
                end
            elseif _type == 'hat' then
                SetPedPreloadPropData(PlayerPedId(), 0, _v.drawble, _v.textures)
                while not HasPedPreloadPropDataFinished(PlayerPedId()) do
                    Wait(50)
                end
                if HasPedPreloadPropDataFinished(PlayerPedId()) then
                    TaskPlayAnim(PlayerPedId(), 'anim@mp_corona_idles@female_b@idle_a', 'idle_a', 1.0, 1.0, -1, 1, 1, true, true, true)
                    ClearPedProp(PlayerPedId(), 0)
                    ClearPedProp(PlayerPedId(), 1)
                    ClearPedProp(PlayerPedId(), 2)
                    ClearPedProp(PlayerPedId(), 6)
                    ClearPedProp(PlayerPedId(), 7)
                    SetPedPropIndex(PlayerPedId(), 0, _v.drawble, _v.textures)
                    Wait(100)
                    print(_type, gender, _v.drawble, _v.textures)
                    lib.callback('savescreenshot2', false,function (path)
                        if path then
                            print(path)
                        end
                    end, gender, _type, _k)
                    Wait(500)
                end
                ReleasePedPreloadPropData(PlayerPedId())
            elseif _type == 'glass' then
                SetPedPreloadPropData(PlayerPedId(), 1, _v.drawble, _v.textures)
                    while not HasPedPreloadPropDataFinished(PlayerPedId()) do
                        Wait(50)
                    end
                    if HasPedPreloadPropDataFinished(PlayerPedId()) then
                        TaskPlayAnim(PlayerPedId(), 'anim@mp_corona_idles@female_b@idle_a', 'idle_a', 1.0, 1.0, -1, 1, 1, true, true, true)
                        ClearPedProp(PlayerPedId(), 0)
                        ClearPedProp(PlayerPedId(), 1)
                        ClearPedProp(PlayerPedId(), 2)
                        ClearPedProp(PlayerPedId(), 6)
                        ClearPedProp(PlayerPedId(), 7)
                        SetPedPropIndex(PlayerPedId(), 1, _v.drawble, _v.textures)
                        Wait(100)
                        print(_type, gender, _v.drawble, _v.textures)
                        lib.callback('savescreenshot2', false,function (path)
                            if path then
                                print(path)
                            end
                        end, gender, _type, _k)
                        Wait(500)
                    end
                    ReleasePedPreloadPropData(PlayerPedId())
            elseif _type == 'ear' then
                SetPedPreloadPropData(PlayerPedId(), 2, _v.drawble, _v.textures)
                while not HasPedPreloadPropDataFinished(PlayerPedId()) do
                    Wait(50)
                end
                if HasPedPreloadPropDataFinished(PlayerPedId()) then
                    TaskPlayAnim(PlayerPedId(), 'anim@mp_corona_idles@female_b@idle_a', 'idle_a', 1.0, 1.0, -1, 1, 1, true, true, true)
                    ClearPedProp(PlayerPedId(), 0)
                    ClearPedProp(PlayerPedId(), 1)
                    ClearPedProp(PlayerPedId(), 2)
                    ClearPedProp(PlayerPedId(), 6)
                    ClearPedProp(PlayerPedId(), 7)
                    SetPedPropIndex(PlayerPedId(), 2, _v.drawble, _v.textures)
                    Wait(100)
                    print(_type, gender, _v.drawble, _v.textures)
                    lib.callback('savescreenshot2', false,function (path)
                        if path then
                            print(path)
                        end
                    end, gender, _type, _k)
                    Wait(500)
                end
                ReleasePedPreloadPropData(PlayerPedId())
            elseif _type == 'watch' then
                SetPedPreloadPropData(PlayerPedId(), 6, _v.drawble, _v.textures)
                while not HasPedPreloadPropDataFinished(PlayerPedId()) do
                    Wait(50)
                end
                if HasPedPreloadPropDataFinished(PlayerPedId()) then
                    TaskPlayAnim(PlayerPedId(), 'anim@mp_corona_idles@female_b@idle_a', 'idle_a', 1.0, 1.0, -1, 1, 1, true, true, true)
                    ClearPedProp(PlayerPedId(), 0)
                    ClearPedProp(PlayerPedId(), 1)
                    ClearPedProp(PlayerPedId(), 2)
                    ClearPedProp(PlayerPedId(), 6)
                    ClearPedProp(PlayerPedId(), 7)
                    SetPedPropIndex(PlayerPedId(), 6, _v.drawble, _v.textures)
                    Wait(100)
                    print(_type, gender, _v.drawble, _v.textures)
                    lib.callback('savescreenshot2', false,function (path)
                        if path then
                            print(path)
                        end
                    end, gender, _type, _k)
                    Wait(500)
                end
                ReleasePedPreloadPropData(PlayerPedId())
            elseif _type == 'bracelets' then
                SetPedPreloadPropData(PlayerPedId(), 7, _v.drawble, _v.textures)
                    while not HasPedPreloadPropDataFinished(PlayerPedId()) do
                        Wait(50)
                    end
                    if HasPedPreloadPropDataFinished(PlayerPedId()) then
                        TaskPlayAnim(PlayerPedId(), 'anim@mp_corona_idles@female_b@idle_a', 'idle_a', 1.0, 1.0, -1, 1, 1, true, true, true)
                        ClearPedProp(PlayerPedId(), 0)
                        ClearPedProp(PlayerPedId(), 1)
                        ClearPedProp(PlayerPedId(), 2)
                        ClearPedProp(PlayerPedId(), 6)
                        ClearPedProp(PlayerPedId(), 7)
                        SetPedPropIndex(PlayerPedId(), 7, _v.drawble, _v.textures)
                        Wait(100)
                        print(_type, gender, _v.drawble, _v.textures)
                        lib.callback('savescreenshot2', false,function (path)
                            if path then
                                print(path)
                            end
                        end, gender, _type, _k)
                        Wait(500)
                    end
                    ReleasePedPreloadPropData(PlayerPedId())
            end
        end
        Wait(10000)
        for k, v in pairs(objs) do
            DeleteEntity(v)
        end
        FreezeEntityPosition(PlayerPedId(), false)
        DestroyCam(cam, true)
        cam = nil
        TriggerEvent('illenium-appearance:client:reloadSkin')
        ClearPedTasks(PlayerPedId())
        Wait(10000)
    end
end, false)

local function onEnter()
    exports['qb-core']:DrawText('[E] - Mua quần áo')
end

local function onExit()
    exports['qb-core']:HideText()
    if shopping then
      SetCamActive(cam,  false)
      DestroyAllCams(true)
      RenderScriptCams(false,  false,  0,  true,  true)
      DestroyCam(cam, true)
      shopping = false
    end
end

local function isInside(self)
    if IsControlJustPressed(0, 38) and not shopping then
        shopping = true
        local _items = {}
        local gioitinh = 'male'
        if tonumber(PlayerData.charinfo.gender) == 1 then
          gioitinh = 'female'
        else
            gioitinh = 'male'
        end
        for k, v in pairs(Config.ClothingShop[self.id].category) do
            _items[k] = {}
            for index, value in pairs(v[gioitinh]) do
                _items[k][#_items[k]+1] = {price = value}
                _items[k][#_items[k]].item = Config.ClothingData[k][gioitinh][index]
            end
        end
    end
end

CreateThread(function()
    while true do
        if weather == true then
            SetRainLevel(0.0)
			SetWeatherTypePersist('EXTRASUNNY')
			SetWeatherTypeNow('EXTRASUNNY')
			SetWeatherTypeNowPersist('EXTRASUNNY')
			NetworkOverrideClockTime(13, 0, 0)
            SetEntityHealth(PlayerPedId(), 200.0)
        end
        Wait(1000)
    end
end)

CreateThread(function()
    for index, value in pairs(Config.ClothingShop) do
        _blip[index] = AddBlipForCoord(value.coords.x, value.coords.y, value.coords.z)
        SetBlipSprite(_blip[index], value.sprite)
        SetBlipAsShortRange(_blip[index], true)
        SetBlipColour(_blip[index], value.color)
        SetBlipScale(_blip[index], value.scale)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(value.name)
        EndTextCommandSetBlipName(_blip[index])
        _zone[index] = {}
        _zone[index] = lib.zones.poly({
            points = value.zone,
            debug = false,
            thickness = 2,
            onEnter = onEnter,
            onExit = onExit,
            inside = isInside,
            id = index,
        })
    end
end)

AddEventHandler('onResourceStop', function(rsName)
    if rsName == GetCurrentResourceName() then 
       for k, v in pairs(objs) do 
          DeleteEntity(v)
       end
       FreezeEntityPosition(PlayerPedId(), false)
       DestroyCam(cam, true)
        DisplayRadar(true)
        TriggerEvent('illenium-appearance:client:reloadSkin')
    end
end)