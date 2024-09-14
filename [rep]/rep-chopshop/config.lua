Config = {}
Config.Target = 'ox_target' -- qb-target, ox_target
Config.UseTalkNPC = true    -- means use rep-talkNPCv2
Config.Inventory = 'ox'     --qs, old-qb, new-qb, esx
Config.MinCops = 0
Config.GroupRestrict = 2 -- Only 2 groups will be able to receive jobs at the same time
Config.MaxPlayers = 2 -- At most 2 people in the group
Config.CallCopsChance = 25

Config.Boss = {
    [1] = {
        model = 'a_m_m_eastsa_01',
        pos = vector4(424.8, -225.42, 54.97, 253.08)
    },
    [2] = {
        model = 'a_m_m_salton_03',
        pos = vector4(-19.49, -1056.83, 27.33, 170.86)
    },
    [3] = {
        model = 's_m_m_autoshop_02',
        pos = vector4(-53.28, -1331.08, 28.26, 53.09)
    },
    [4] = {
        model = 'mp_m_waremech_01',
        pos = vector4(-75.57, -1389.78, 28.32, 134.88)
    }
}

Config.Blip = {
    ["zone"] = {
        color = 3,
        radius = 100.0,
    },
}

Config.ChopLocation = {
    vector3(2352.68, 3133.09, 48.21),
    vector3(1541.75, 6335.06, 24.08),
}

Config.CustomerCars = {
    "penumbra2",
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

Config.JobLocations = {
    [1] = {
        routeBusy = false,
        pos = vector4(-607.33, -989.64, 21.68, 270.6)
    },
    [2] = {
        routeBusy = false,
        pos = vector4(-607.93, -978.22, 21.01, 272.87)
    },
    [3] = {
        routeBusy = false,
        pos = vector4(-607.44, -997.62, 21.13, 267.87)
    },
    [4] = {
        routeBusy = false,
        pos = vector4(-608.11, -1008.09, 21.3, 268.95)
    },
    [5] = {
        routeBusy = false,
        pos = vector4(-621.1, -1014.44, 21.36, 96.23)
    },
    [6] = {
        routeBusy = false,
        pos = vector4(-620.99, -1022.23, 21.65, 86.87)
    },
    [7] = {
        routeBusy = false,
        pos = vector4(-620.79, -1025.65, 21.06, 274.08)
    },
    [8] = {
        routeBusy = false,
        pos = vector4(-621.29, -1048.11, 21.13, 93.87)
    },
    [9] = {
        routeBusy = false,
        pos = vector4(-620.61, -1058.69, 21.3, 83.41)
    },
    [10] = {
        routeBusy = false,
        pos = vector4(-342.36, -925.25, 31.08, 66.51)
    },
    [11] = {
        routeBusy = false,
        pos = vector4(-327.62, -924.76, 31.08, 250.21)
    },
    [12] = {
        routeBusy = false,
        pos = vector4(-329.6, -904.33, 31.08, 349.14)
    },
    [13] = {
        routeBusy = false,
        pos = vector4(-360.25, -907.84, 31.08, 91.41)
    },
    [14] = {
        routeBusy = false,
        pos = vector4(-360.47, -930.07, 31.08, 88.92)
    },
    [15] = {
        routeBusy = false,
        pos = vector4(-360.18, -944.96, 31.08, 87.15)
    },
    [16] = {
        routeBusy = false,
        pos = vector4(-324.81, -952.92, 31.08, 69.22)
    },
    [17] = {
        routeBusy = false,
        pos = vector4(-308.44, -951.16, 31.08, 249.3)
    },
    [18] = {
        routeBusy = false,
        pos = vector4(-317.07, -932.1, 31.08, 73.0)
    },
    [19] = {
        routeBusy = false,
        pos = vector4(879.12, -37.86, 78.76, 57.83)
    },
    [20] = {
        routeBusy = false,
        pos = vector4(866.18, -42.01, 78.76, 234.16)
    },
}

Config.Lang = {
    en = {
        bossNpc = {
            name = "Ant Sholeh",
            animScenario = "WORLD_HUMAN_AA_SMOKE",
            tag = "Outlaw",
            color = "#404040",
            startMSG = 'Yo, you looking for work?',
            button1 = {
                [1] = "What the hell am I supposed to do?",
                [2] = "It's easy as hell, bro. \n \n There's a couple of guys who owe my boss money, and they're dodging him like cowards. \n \n So my boss wants you to jack their car and drive it somewhere quiet to 'deal' with it. \n \n You can keep any parts from the car. \n \n And of course, you'll get a reward from 'the boss' when you're done",
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
        tablet = {
            wait = {
                label = "Waiting offer",
                header = "CURRENT",
                icon = "fas fa-people-carry",
                color ="#59c5f7",
                time = "NONE",
            },
            stage1 = {
                label = "Make your way towards the spot where the vehicle was last seen",
                header = "CURRENT",
                icon = "fas fa-people-carry",
                color ="#59c5f7",
                time = "NONE",
            },
            stage2 = {
                label = "Use KFR to find keys signal. Plate: %s",
                header = "CURRENT",
                icon = "fas fa-people-carry",
                color ="#59c5f7",
                time = "NONE",
            },
            stage3 = {
                label = "Head to chop location",
                header = "CURRENT",
                icon = "fas fa-people-carry",
                color ="#59c5f7",
                time = "NONE",
            },
            stage4 = {
                label = "Strip down vehicle of parts",
                header = "CURRENT",
                icon = "fas fa-people-carry",
                color ="#59c5f7",
                time = "NONE",
            },
            done = {
                label = "Complete all prompted instructions",
                header = "CURRENT",
                icon = "fas fa-people-carry",
                color ="#59c5f7",
                time = 5000,
            },
            null = "null",
        },
        progressbar = {
            chopTyre = {
                label = "Remove Wheel",
                time = 10000
            },
            chopDoor = {
                label = "Remove Door",
                time = 15000
            },
            chopTrunk = {
                label = "Remove Trunk",
                time = 15000
            },
            chopRemain = {
                label = "Remove remaining parts",
                time = 25000
            },
        },
        target = {
            tyre = {
                label = 'Remove Wheel',
                icon = "fa-solid fa-wrench"
            },
            door = {
                label = 'Remove Door',
                icon = "fa-solid fa-wrench"
            },
            trunk = {
                label = 'Remove Trunk',
                icon = "fa-solid fa-wrench"
            },
            remains = {
                label = 'Remove remaining parts',
                icon = "fa-solid fa-wrench"
            },
            signin = {
                label = "Sign in",
                icon = "fa-solid fa-user",
            },
            signout = {
                label = "Sign Out",
                icon = "fa-solid fa-user"
            },
        },
        error = {
            police = {
                label = "There's a situation! Come back later!",
                type = "error",
                time = 5000
            },
            partBusy = {
                label = "Someone is stripping",
                type = "error",
                time = 5000
            },
        },
        success = {

        },
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
