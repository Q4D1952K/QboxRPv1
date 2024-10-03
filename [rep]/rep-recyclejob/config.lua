Config = {}

Config.Target = 'ox_target' -- qb-target, ox_target
Config.ImgLink = "https://raw.githubusercontent.com/Q4D1952K/QBoxRpImg/main/"
Config.Inventory = 'ox'     --old-qb, new-qb
Config.Minigame = 'boxGame' -- boxGame to use rep-boxGame, ox to use Skill Check ox_lib
Config.Reward = {
    item = 'recyclablematerial',
    amount = {
        min = 1,
        max = 3,
    },
}

Config.Lang = {
    en = {
        target = {
            get = {
                icon = "fa-solid fa-box",
                label = "Get Package",
            },
            drop = {
                icon = "fa-solid fa-hand",
                label = "Unpacking the package",
            },
            enter = {
                icon = "fa-solid fa-door-open",
                label = "Enter Warehouse",
            },
            exit = {
                icon = "fa-solid fa-door-open",
                label = "Exit Warehouse",
            },
            exchange = {
                icon = "fa-solid fa-recycle",
                label = "Exchange",
            },
        },
        blip = {
            label = 'Recycle Center',
            sprite = 365,
            colour = 2,
            scale = 0.8,
        },
        menu = {
            description = "%s x %s for %s x %s",
            header = "Exchange",
        },
        input = {
            header = "Amount:",
            submit = "CONFIRM",
        },
        error = {
            amountItem = {
                label = "Not enough materials!",
                type = "error",
                time = 5000
            },
        },
        progressbar = {
            pickup = {
                label = "Picking up the package",
                duration = 5000,
            },
            unpack = {
                label = "Unpacking the package",
                duration = 5000,
            }
        },
    },
}
local _lang = GetConvar('repscripts:locale', 'en')
Lang = Config.Lang[_lang]

Config.Location = {
    enter = vector4(56.0, 6471.9, 31.0, 44.0),
    exit = vector4(1072.6, -3102.55, -39.0, 266.61),
    drop = vector4(1048.224, -3097.071, -38.999, 274.810),
    pickup = {
        vector4(1067.68, -3095.57, -39.9, 342.39),
        vector4(1065.20, -3095.57, -39.9, 342.39),
        vector4(1062.73, -3095.57, -39.9, 342.39),
        vector4(1060.37, -3095.57, -39.9, 342.39),
        vector4(1057.95, -3095.57, -39.9, 342.39),
        vector4(1055.58, -3095.57, -39.9, 342.39),
        vector4(1053.09, -3095.57, -39.9, 342.39),
        vector4(1053.07, -3102.62, -39.9, 342.39),
        vector4(1055.49, -3102.62, -39.9, 342.39),
        vector4(1057.93, -3102.62, -39.9, 342.39),
        vector4(1060.19, -3102.62, -39.9, 342.39),
        vector4(1062.71, -3102.62, -39.9, 342.39),
        vector4(1065.19, -3102.62, -39.9, 342.39),
        vector4(1067.46, -3102.62, -39.9, 342.39),
        vector4(1067.69, -3109.71, -39.9, 342.39),
        vector4(1065.13, -3109.71, -39.9, 342.39),
        vector4(1062.70, -3109.71, -39.9, 342.39),
        vector4(1060.24, -3109.71, -39.9, 342.39),
        vector4(1057.76, -3109.71, -39.9, 342.39),
        vector4(1055.52, -3109.71, -39.9, 342.39),
        vector4(1053.16, -3109.71, -39.9, 342.39),
    },
    warehouseObjects = {
        [1] = 'prop_boxpile_05a',
        [2] = 'prop_boxpile_04a',
        [3] = 'prop_boxpile_06b',
        [4] = 'prop_boxpile_02c',
        [5] = 'prop_boxpile_02b',
        [6] = 'prop_boxpile_01a',
        [7] = 'prop_boxpile_08a',
    },
}

Config.Exchange = {
    ped = vec4(8.92, 6473.14, 30.43, 228.97),
    obj = vec4(9.87968444824218, 6472.40283203125, 30.42528915405273, 225.0),
    listItems = {
        [1] = {name = "plastic", remove = 3, add = 2}, -- this means: 2 recyclablematerial  = 3 plastics ♻
        [2] = {name = "iron", remove = 3 , add = 1},
        [3] = {name = "steel", remove = 3, add = 1},
        [4] = {name = "glass", remove = 3, add = 1},
        [5] = {name = "rubber", remove = 3, add = 1},
        [6] = {name = "aluminum", remove = 3, add = 1},
    },
}

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