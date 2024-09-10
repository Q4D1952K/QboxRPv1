Config = {}
Config.Target = 'ox_target' -- qb-target, ox_target
Config.UseTalkNPC = true    -- means use rep-talkNPCv2
Config.Inventory = 'ox'     --qs, old-qb, new-qb, esx
Config.MinCops = 0
Config.GroupRestrict = 2 -- Only 2 groups will be able to receive jobs at the same time
Config.MaxPlayers = 2 -- At most 2 people in the group
Config.CallCopsChance = 25
Config.Items = {
    ['deliverylist'] = 'deliverylist',
    ['package'] = 'package',
}
Config.DeliveryPackage = 5 -- Package per run / 2 runs per job
Config.DriveStyle = 39 -- Change this at https://www.vespura.com/fivem/drivingstyle/
Config.Boss = {
    [1] = {
        model = 'a_m_m_mlcrisis_01',
        pos = vector4(421.81, 64.27, 96.98, 77.23)
    },
    [2] = {
        model = 'a_m_m_mlcrisis_01',
        pos = vector4(-223.09, -1616.17, 37.05, 276.94)
    },
    [3] = {
        model = 'a_m_m_mlcrisis_01',
        pos = vector4(-1178.85, -372.44, 35.62, 89.24)
    },
    [4] = {
        model = 'a_m_m_mlcrisis_01',
        pos = vector4(192.0, 331.5, 104.4, 268.74)
    }
}
Config.timeWaitingForCustomers = { -- seconds
    min = 10,
    max = 30
}
Config.Lang = {
    en = {
        blip = {
            pickUp = {
                sprite = 524,
                range = true,
                color = 3,
                scale = 0.9,
                label = "Pick Up"
            },
            delivery = {
                sprite = 480,
                range = true,
                color = 3,
                scale = 0.9,
                label = "Drop Off Spot"
            },
        },
        bossNpc = {
            name = " Al Capone",
            animScenario = "WORLD_HUMAN_AA_SMOKE",
            tag = "outlaw",
            color = "#404040",
            startMSG = 'Yo, you looking for work?',
            button1 = {
                [1] = "What the hell am I supposed to do?",
                [2] = "It's easy as hell, man. \n \n You're gonna deliver a few package for me. \n \n I'll pay you with some good stuff. \n \n But this job needs you to be real slick. \n \n Oh, and our clients buy dirty money too, so bring it if you've got any.",
                [3] = "That's badass, I'm ready",
                [4] = "Watch yourself",
                [5] = "Oh, you're already on the list",
                [6] = "Oh, this ain't really my thing"
            },
            button2 = {
                [1] = "Of course, I need the cash",
            },
            button3 = {
                [1] = "I think it's time I hung up my boots",
            },
            button4 = {
                [1] = "I'm just passing through here",
            },
        },
        target = {
            signin = {
                label = "Sign in",
                icon = "fa-solid fa-user",
            },
            signout = {
                label = "Sign Out",
                icon = "fa-solid fa-user"
            },
            getpack = {
                label = "Collect Packages",
                icon = "fas fa-box"
            },
            deliver = {
                label = "Handoff Package",
                icon = "fas fa-hand-holding"
            }
        },
        tablet = {
            wait = {
                label = "Searching Customer!!!",
                header = "CURRENT",
                icon = "fas fa-people-carry",
                color = "#59c5f7",
                time = "NONE"
            },
            stage1 = {
                label = "Find and steal a vehicle to use as transport",
                header = "CURRENT",
                icon = "fas fa-people-carry",
                color = "#59c5f7",
                time = "NONE"
            },
            stage2 = {
                label = "Go to the supplier and ask for the goods",
                header = "CURRENT",
                icon = "fas fa-people-carry",
                color = "#59c5f7",
                time = "NONE"
            },
            stage3 = {
                label = "Load the packages into the vehicle trunk",
                label1 = "%s/%s Load the packages into the vehicle trunk",
                header = "CURRENT",
                icon = "fas fa-people-carry",
                color = "#59c5f7",
                time = "NONE"
            },
            stage4 = {
                label = "Drive to the handoff location with the transport vehicle",
                header = "CURRENT",
                icon = "fas fa-people-carry",
                color = "#59c5f7",
                time = "NONE"
            },
            stage5 = {
                label = "Wait for the customers and handoff the goods",
                label1 = "%s/%s Wait for the customers and handoff the goods",
                header = "CURRENT",
                icon = "fas fa-people-carry",
                color = "#59c5f7",
                time = "NONE"
            },
            stage6 = {
                label = "Drive to the next handoff location with the transport vehicle",
                header = "CURRENT",
                icon = "fas fa-people-carry",
                color = "#59c5f7",
                time = "NONE"
            },
            stage7 = {
                label = "Get rid of the vehicle",
                header = "CURRENT",
                icon = "fas fa-people-carry",
                color = "#59c5f7",
                time = 10000
            },
        },
        error = {
            police = {
                label = "There's a situation! Come back later!",
                type = "error",
                time = 5000
            },
            item = {
                label = "You don't have a list?",
                type = "error",
                time = 5000
            },
            overmem = {
                label = "Too many people in group!",
                type = "error",
                time = 5000
            },
        },
    },
}

Config.CustomerCars = {
    "baller",
    "baller2",
    "baller3",
    "stratum",
    "glendale",
    "sabregt",
    "sentinel2",
    "cavalcade",
    "buccaneer2",
    "picador",
    "primo",
    "premier",
    "manana",
    "dukes",
    "ingot",
    "blista",
}
Config.CustomerDriverPed = {
    'a_m_m_mlcrisis_01',
    'a_m_y_skater_01',
    'a_f_m_fatwhite_01',
    'g_f_y_families_01',
    'csb_undercover',
    'g_m_importexport_01',
    'g_m_y_lost_01',
}

Config.JobLocations = {
    [1] = {
        routeBusy = false,
        pickupPackage = vector4(1510.28, 3565.32, 35.4, 310.33),
        spawnVeh = vector4(-12.03, -78.81, 57.06, 230.64),
        waitPos = vector3(12.29, -71.57, 61.11),
        despawnVeh = vector3(49.06, -50.38, 69.18),
    },
    [2] = {
        routeBusy = false,
        pickupPackage = vector4(-455.96, 3032.68, 24.9, 285.03),
        spawnVeh = vector4(692.24, 52.63, 83.85, 227.59),
        waitPos = vector3(662.95, 41.67, 85.34),
        despawnVeh = vector3(530.17, 118.52, 96.77),
    },
    [3] = {
        routeBusy = false,
        pickupPackage = vector4(1272.72, -2567.3, 43.4, 101.52),
        spawnVeh = vector4(669.73, 188.08, 93.02, 327.58),
        waitPos = vector3(689.76, 201.65, 91.74),
        despawnVeh = vector3(763.17, 130.48, 78.03),
    },
    [4] = {
        routeBusy = false,
        pickupPackage = vector4(-37.96, -1525.52, 31.3, 62.26),
        spawnVeh = vector4(968.92, -1815.63, 31.09, 79.22),
        waitPos = vector3(959.93, -1796.46, 31.14),
        despawnVeh = vector3(972.24, -1775.56, 31.1),
    },
    [5] = {
        routeBusy = false,
        pickupPackage = vector4(478.81, -1874.22, 26.64, 44.97),
        spawnVeh = vector4(-573.34, -863.06, 25.99, 0.04),
        waitPos = vector3(-550.25, -845.64, 28.26),
        despawnVeh = vector3(-507.2, -862.21, 30.05),
    },
    [6] = {
        routeBusy = false,
        pickupPackage = vector4(-459.58, -942.49, 23.67, 284.46),
        spawnVeh = vector4(1366.07, -1893.46, 54.8, 81.45),
        waitPos = vector3(1351.04, -1823.12, 56.37),
        despawnVeh = vector3(1410.06, -1736.63, 65.56),
    },
    [7] = {
        routeBusy = false,
        pickupPackage = vector4(279.73, -1971.61, 21.58, 48.57),
        spawnVeh = vector4(13.55, 545.77, 175.98, 337.3),
        waitPos = vector3(50.54, 566.44, 180.35),
        despawnVeh = vector3(214.95, 643.34, 188.22),
    },
    [8] = {
        routeBusy = false,
        pickupPackage = vector4(651.39, -1112.7, 22.6, 178.72),
        spawnVeh = vector4(976.32, -3039.79, 5.9, 173.86),
        waitPos = vector3(915.76, -3057.19, 5.9),
        despawnVeh = vector3(776.98, -3007.21, 5.85),
    },
}
local _lang = GetConvar('repscripts:locale', 'en')
Lang = Config.Lang[_lang]

Framework = {}

function Framework.ESX()
    return GetResourceState("es_extended") ~= "missing"
end

function Framework.QBCore()
    return GetResourceState("qb-core") ~= "missing"
end

function Framework.QBox()
    return GetResourceState("qbx_core") ~= "missing"
end
