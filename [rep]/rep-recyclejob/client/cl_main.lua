carryPackage, packageObj, packageCoords = false, nil, 0

function deleteObj()
    carryPackage = false
    if packageObj and DoesEntityExist(packageObj) then
        DetachEntity(packageObj, true, true)
        DeleteObject(packageObj)
    end
    packageObj = nil
end

function randomLocation()
    packageCoords = math.random(1, #Config.Location.pickup)
end

function getBox()
    carryPackage = true
    lib.requestAnimDict("anim@amb@clubhouse@tutorial@bkr_tut_ig3@")
    TaskPlayAnim(cache.ped, 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', 'machinic_loop_mechandplayer', 1.0, -4.0, -1, 1, 0, false, false, false)
    Wait(1750)
    local success = true
    if Config.Minigame == 'boxGame' then
        success = exports["rep-boxGame"]:StartMinigame(0)
    else
        success = lib.skillCheck({{areaSize = 60, speedMultiplier = 0.5}, {areaSize = 40, speedMultiplier = 0.6}})
    end
    if success then
        if lib.progressCircle({
            duration = Lang.progressbar.pickup.duration,
            label = Lang.progressbar.pickup.label,
            useWhileDead = false,
            canCancel = true,
            disable = {
                move = true,
                car = true,
                mouse = true,
                combat = true
            },
        }) then
            ClearPedTasks(cache.ped)
            Wait(100)
            lib.playAnim(cache.ped, 'anim@heists@box_carry@', 'idle', 5.0, -1, -1, 50, 0, false, false, false)
            packageObj = NetToObj(lib.callback.await('rep-recyclejob:callback:spawnObj', false))
            SetModelAsNoLongerNeeded('prop_cs_cardbox_01')
            AttachEntityToEntity(packageObj, cache.ped, GetPedBoneIndex(cache.ped, 57005), 0.05, 0.1, -0.3, 300.0, 250.0, 20.0, true, true, false, true, 1, true)
        else
            carryPackage = false
            ClearPedTasks(cache.ped)
        end
    else
        carryPackage = false
        ClearPedTasks(cache.ped)
    end
end

function dropBox()
    if lib.progressCircle({
        duration = Lang.progressbar.unpack.duration,
        label = Lang.progressbar.unpack.label,
        useWhileDead = false,
        canCancel = true,
        disable = {
            move = true,
            car = true,
            mouse = true,
            combat = true
        },
    }) then
        ClearPedTasks(cache.ped)
        deleteObj()
        lib.callback.await('rep-recyclejob:callback:reward', false)
        randomLocation()
    end
end

function enterWarehouse()
    DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
    SetEntityCoords(cache.ped, Config.Location.exit.x, Config.Location.exit.y, Config.Location.exit.z)
    SetEntityHeading(cache.ped, Config.Location.exit.w)
    DoScreenFadeIn(500)
    randomLocation()
end

function exitWarehouse()
    DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
    SetEntityCoords(cache.ped, Config.Location.enter.x, Config.Location.enter.y, Config.Location.enter.z)
    SetEntityHeading(cache.ped, Config.Location.enter.w)
    DoScreenFadeIn(500)
end

function exchangeSystem()
    local menu = {}
    for k, v in pairs(Config.Exchange.listItems) do
        menu[#menu+1] = {
            icon = items[v.name].image,
            title = items[v.name].label,
            description = Lang.menu.description:format(v.remove, items[Config.Reward.item].label, v.add , items[v.name].label),
            event = "rep-recyclejob:client:exchangeAmount",
            args = {
                name = v.name,
                add = v.add,
                remove = v.remove
            }
        }
    end
    lib.registerContext({
        id = 'exchangeSystem',
        title = Lang.menu.header,
        options = menu
    })
    lib.showContext('exchangeSystem')
end

RegisterNetEvent('rep-recyclejob:client:exchangeAmount', function(data)
    local name = data.name
    local add = data.add
    local remove = data.remove
    local input = lib.inputDialog(Lang.input.header, {
        { type = "input", Lang.input.submit, placeholder = "1" },
    })
    if not input then return end
    local amount = tonumber(input[1])
    if amount then
        TriggerServerEvent('rep-recyclejob:server:exchange', name, add, remove, amount)
    end
end)

AddEventHandler('onResourceStop', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        if carryPackage then
            deleteObj()
        end
    end
end)