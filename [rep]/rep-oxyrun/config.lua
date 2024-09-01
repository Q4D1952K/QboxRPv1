Config = {}
Config.Target = 'ox_target' -- qb-target, ox_target
Config.UseTalkNPC = true    -- means use rep-talkNPCv2
Config.Inventory = 'ox'     --qs, old-qb, new-qb, esx
Config.MinCops = 3
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
        pickupPackage = vector4(1566.23, 3569.35, 33.86, 20.93),
        spawnVeh = vector4(-12.03, -78.81, 57.06, 230.64),
        waitPos = vector3(30.1, -93.57, 56.71),
        despawnVeh = vector3(75.14, -138.34, 54.97),
    },
    [2] = {
        routeBusy = false,
        pickupPackage = vector4(-614.82, 3016.87, 18.29, 282.53),
        spawnVeh = vector4(692.24, 52.63, 83.85, 227.59),
        waitPos = vector3(621.17, 55.77, 89.74),
        despawnVeh = vector3(530.17, 118.52, 96.77),
    },
    [3] = {
        routeBusy = false,
        pickupPackage = vector4(1250.83, -2562.04, 42.71, 219.28),
        spawnVeh = vector4(788.56, 199.95, 81.49, 156.77),
        waitPos = vector3(680.72, 214.61, 93.02),
        despawnVeh = vector3(588.19, 276.08, 103.21),
    },
    [4] = {
        routeBusy = false,
        pickupPackage = vector4(-70.31, -1620.92, 31.45, 236.69),
        spawnVeh = vector4(923.49, -1778.15, 31.0, 354.79),
        waitPos = vector3(950.15, -1809.36, 31.14),
        despawnVeh = vector3(976.74, -1890.03, 31.1),
    },
    [5] = {
        routeBusy = false,
        pickupPackage = vector4(484.27, -1875.31, 26.17, 275.6),
        spawnVeh = vector4(-652.29, -1070.2, 15.57, 31.94),
        waitPos = vector3(-629.07, -932.21, 22.59),
        despawnVeh = vector3(-577.56, -846.59, 26.2),
    },
    [6] = {
        routeBusy = false,
        pickupPackage = vector4(-1595.86, 170.62, 59.17, 178.24),
        spawnVeh = vector4(1334.36, -2006.78, 49.31, 101.74),
        waitPos = vector3(1358.43, -1893.34, 54.39),
        despawnVeh = vector3(1400.22, -1701.54, 64.52),
    },
    [7] = {
        routeBusy = false,
        pickupPackage = vector4(-781.64, -2350.99, 14.57, 247.29),
        spawnVeh = vector4(-30.33, 532.09, 167.5, 284.98),
        waitPos = vector3(148.37, 571.04, 183.85),
        despawnVeh = vector3(214.95, 643.34, 188.22),
    },
    [8] = {
        routeBusy = false,
        pickupPackage = vector4(-645.49, -1221.42, 11.02, 298.48),
        spawnVeh = vector4(1074.33, -3040.7, 5.9, 170.25),
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
