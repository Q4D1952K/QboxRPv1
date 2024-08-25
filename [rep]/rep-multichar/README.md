With QB change it in qb-apartments
```lua
RegisterNetEvent('apartments:server:CreateApartment', function(type, label)
    local src = source
    local Player = Core.Functions.GetPlayer(src)
    local num = CreateApartmentId(type)
    local apartmentId = tostring(type .. num)
    label = tostring(label .. " " .. num)
    MySQL.insert('INSERT INTO apartments (name, type, label, citizenid) VALUES (?, ?, ?, ?)', {
        apartmentId,
        type,
        label,
        Player.PlayerData.citizenid
    })
    TriggerClientEvent('QBCore:Notify', src, Lang:t('success.receive_apart').." ("..label..")")
    QBCore.Functions.SetPlayerBucket(src, src)
    TriggerClientEvent("apartments:client:SetHomeBlip", src, type)
    TriggerClientEvent("rep-multichar:client:initcoords", src) 
end)
```

If want to use intro then add this after u create skin character
```lua
  TriggerEvent("rep-multichar:client:startmovie")
```

like this
```lua
  function InitializeCharacter(gender, onSubmit, onCancel)
      SetInitialClothes(Config.InitialPlayerClothes[gender])
      local config = getNewCharacterConfig()
      TriggerServerEvent("illenium-appearance:server:ChangeRoutingBucket")
      client.startPlayerCustomization(function(appearance)
          if (appearance) then
              TriggerServerEvent("illenium-appearance:server:saveAppearance", appearance)
              if onSubmit then
                    TriggerServerEvent("illenium-appearance:server:ResetRoutingBucket")
                    TriggerEvent('rep-multichar:client:startmovie')
                  onSubmit()
              end
          elseif onCancel then
              onCancel()
          end
          Framework.CachePed()
      end, config)
  end
```
or
```lua
  AddEventHandler('esx_skin:playerRegistered', function()
      CreateThread(function()
          while not ESX.PlayerLoaded do
              Wait(100)
          end

          if firstSpawn then
              ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                  if skin == nil then
                      TriggerEvent('skinchanger:loadSkin', { sex = 0 }, OpenSaveableMenu)
                      Wait(100)
                  else
                      TriggerEvent('skinchanger:loadSkin', skin)
                      Wait(100)
                  end
              end)
              TriggerEvent('rep-multichar:client:startmovie')
              firstSpawn = false
          end
      end)
  end)
```
or
```lua
  RegisterNetEvent('qb-clothes:client:CreateFirstCharacter', function()
      QBCore.Functions.GetPlayerData(function(pData)
          local skin = "mp_m_freemode_01"
          isNew = true
          openMenu({
              {menu = "character", label = Lang:t("menu.features"), selected = true},
              {menu = "hair", label = Lang:t("menu.hair"), selected = false},
              {menu = "clothing", label = Lang:t("menu.character"), selected = false},
              {menu = "accessoires", label = Lang:t("menu.accessoires"), selected = false}
          })

          if pData.charinfo.gender == 1 then
              skin = "mp_f_freemode_01"
          end

          ChangeToSkinNoUpdate(skin)
          SendNUIMessage({
              action = "ResetValues",
          })
      end)
  end)

  RegisterNUICallback('saveClothing', function(_, cb)
    SaveSkin()
    if isNew then
      TriggerEvent('rep-multichar:client:startmovie')
      isNew = false
    end
    cb('ok')
end)
```