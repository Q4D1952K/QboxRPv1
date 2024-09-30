Config = {}
Config.ImgLink = "https://raw.githubusercontent.com/Q4D1952K/QBoxRpImg/main/"
Config.Inventory = 'ox'     --qs, old-qb, new-qb
Config.MaxWeight = 250000
Config.Target = 'ox_target' -- qb-target, ox_target

Config.Lang = {
    en = {
        ui = {
            search_placeholder = "Search...",
            add_to_cart = "Add to cart",
            remove_from_cart = "Remove",
            pay_cash = "Pay cash",
            pay_card = "Pay card",
            total = "Total:",
        },
        target = {
            shop = {
                label = "Purchase Goods",
                icon = "fas fa-shopping-basket",
            },
        },
        error = {
            cash = {
                label = "You don't have enough cash",
                type = "error",
                time = 5000
            },
            bank = {
                label = "You don't have enough money in your card",
                type = "error",
                time = 5000
            },
            stock = {
                label = "Currently out of stock, please come back later!",
                type = "error",
                time = 5000
            },
        }
    },
}

local _lang = GetConvar('repscripts:locale', 'en')
Lang = Config.Lang[_lang]

Config.Stores = {
    Supermarket = {
        blips = {
            sprite = 59,
            color = 69,
            scale = 0.8,
        },
        logo = "https://raw.githubusercontent.com/Q4D1952K/QBoxRpImg/main/247.png",
        -- groups = {"police", "sheriff"} or {['ambulance'] = 0}
        ped = 'mp_m_shopkeep_01',
        name = "24/7 Supermarket",
        -- # https://v6.mantine.dev/theming/colors/#default-colors
        colorP = 'green',
        shade = 7,
        theme = 'light',
        locations = {
            vector4(-3039.54, 584.38, 6.91, 17.27),
            vector4(-3242.97, 1000.01, 11.83, 357.57),
            vector4(1728.07, 6415.63, 34.04, 242.95),
            vector4(1959.82, 3740.48, 31.34, 301.57),
            vector4(549.13, 2670.85, 41.16, 99.39),
            vector4(2677.47, 3279.76, 54.24, 335.08),
            vector4(2556.66, 380.84, 107.62, 356.67),
            vector4(372.66, 326.98, 102.57, 253.73),
        },
        items = {
            ['tosti']         = { name = 'tosti', price = 2, amount = 50, info = {}, type = 'item' },
            ['water_bottle']  = { name = 'water_bottle', price = 2, amount = 50, info = {}, type = 'item' },
            ['kurkakola']     = { name = 'kurkakola', price = 2, amount = 50, info = {}, type = 'item' },
            ['twerks_candy']  = { name = 'twerks_candy', price = 2, amount = 50, info = {}, type = 'item' },
            ['snikkel_candy'] = { name = 'snikkel_candy', price = 2, amount = 50, info = {}, type = 'item' },
            ['sandwich']      = { name = 'sandwich', price = 2, amount = 50, info = {}, type = 'item' },
            ['beer']          = { name = 'beer', price = 7, amount = 50, info = {}, type = 'item' },
            ['whiskey']       = { name = 'whiskey', price = 10, amount = 50, info = {}, type = 'item' },
            ['vodka']         = { name = 'vodka', price = 12, amount = 50, info = {}, type = 'item' },
            ['lighter']       = { name = 'lighter', price = 2, amount = 50, info = {}, type = 'item' },
            ['rolling_paper'] = { name = 'rolling_paper', price = 2, amount = 5000, info = {}, type = 'item' },
        },
    },
    LTD = {
        blips = {
            sprite = 59,
            color = 69,
            scale = 0.8,
        },
        ped = 'mp_m_shopkeep_01',
        name = "LTD Gasoline",
        logo = "https://raw.githubusercontent.com/Q4D1952K/QBoxRpImg/main/LTD.png",
        colorP = 'red',
        shade = 6,
        theme = 'dark',
        locations = {
            vector4(-47.02, -1758.23, 28.42, 45.05),
            vector4(-706.06, -913.97, 18.22, 88.04),
            vector4(-1820.02, 794.03, 137.09, 135.45),
            vector4(1164.71, -322.94, 68.21, 101.72),
            vector4(1697.87, 4922.96, 41.06, 324.71),
        },
        items = {
            ['tosti']         = { name = 'tosti', price = 2, amount = 50, info = {}, type = 'item' },
            ['water_bottle']  = { name = 'water_bottle', price = 2, amount = 50, info = {}, type = 'item' },
            ['kurkakola']     = { name = 'kurkakola', price = 2, amount = 50, info = {}, type = 'item' },
            ['twerks_candy']  = { name = 'twerks_candy', price = 2, amount = 50, info = {}, type = 'item' },
            ['snikkel_candy'] = { name = 'snikkel_candy', price = 2, amount = 50, info = {}, type = 'item' },
            ['sandwich']      = { name = 'sandwich', price = 2, amount = 50, info = {}, type = 'item' },
            ['beer']          = { name = 'beer', price = 7, amount = 50, info = {}, type = 'item' },
            ['whiskey']       = { name = 'whiskey', price = 10, amount = 50, info = {}, type = 'item' },
            ['vodka']         = { name = 'vodka', price = 12, amount = 50, info = {}, type = 'item' },
            ['lighter']       = { name = 'lighter', price = 2, amount = 50, info = {}, type = 'item' },
            ['rolling_paper'] = { name = 'rolling_paper', price = 2, amount = 5000, info = {}, type = 'item' },
        },
    },
    Liquor = {
        blips = {
            sprite = 93,
            color = 2,
            scale = 0.8,
        },
        ped = 's_f_y_bartender_01',
        name = "Rob's Liqour",
        logo = "https://raw.githubusercontent.com/Q4D1952K/QBoxRpImg/main/LTD.png",
        colorP = 'red',
        shade = 6,
        theme = 'dark',
        locations = {
            vector4(-1221.58, -908.15, 11.33, 35.49),
            vector4(-1486.59, -377.68, 39.16, 139.51),
            vector4(-2966.39, 391.42, 14.04, 87.48),
            vector4(1165.17, 2710.88, 37.16, 179.43),
            vector4(1134.2, -982.91, 45.42, 277.24),
        },
        items = {
            ['beer'] = { name = 'beer', price = 7, amount = 50, info = {}, type = 'item' },
            ['whiskey'] = { name = 'whiskey', price = 10, amount = 50, info = {}, type = 'item' },
            ['vodka'] = { name = 'vodka', price = 12, amount = 50, info = {}, type = 'item' },
        },
    },
    Hardware = {
        blips = {
            sprite = 402,
            color = 2,
            scale = 0.8,
        },
        ped = 's_m_m_cntrybar_01',
        name = "Hardware Store",
        logo = "https://raw.githubusercontent.com/Q4D1952K/QBoxRpImg/main/YouTool.png",
        colorP = 'dark',
        shade = 7,
        theme = 'dark',
        locations = {
            vector4(45.68, -1749.04, 28.61, 53.13),
            vector4(2747.71, 3472.85, 54.67, 255.08),
            vector4(-421.83, 6136.13, 30.88, 228.2),
        },
        items = {
            ['lockpick'] = { name = 'lockpick', price = 200, amount = 50, info = {}, type = 'item' },
            ['repairkit'] = { name = 'repairkit', price = 250, amount = 50, info = {}, type = 'item', requiredJob = { 'mechanic', 'police' } },
        },
    },
    Ammunation = {
        blips = {
            sprite = 110,
            color = 2,
            scale = 0.8,
        },
        ped = 's_m_y_ammucity_01',
        name = "Ammunation",
        logo = "https://raw.githubusercontent.com/Q4D1952K/QBoxRpImg/main/Ammunation.png",
        colorP = 'red',
        shade = 7,
        theme = 'dark',
        locations = {
            vector4(-661.96, -933.53, 20.83, 177.05),
            vector4(809.68, -2159.13, 28.62, 1.43),
            vector4(1692.67, 3761.38, 33.71, 227.65),
            vector4(-331.23, 6085.37, 30.45, 228.02),
            vector4(253.63, -51.02, 68.94, 72.91),
            vector4(23.0, -1105.67, 28.8, 162.91),
            vector4(2567.48, 292.59, 107.73, 349.68),
            vector4(-1118.59, 2700.05, 17.55, 221.89),
            vector4(841.92, -1035.32, 27.19, 1.56),
            vector4(-1304.19, -395.12, 35.7, 75.03),
            vector4(-3173.31, 1088.85, 19.84, 244.18),
        },
        items = {
            ['WEAPON_KNIFE'] = { name = 'WEAPON_KNIFE', price = 250, amount = 250, info = {}, type = 'weapon' },
            ['WEAPON_BAT'] = { name = 'WEAPON_BAT', price = 250, amount = 250, info = {}, type = 'weapon' },
            ['WEAPON_HATCHET'] = { name = 'WEAPON_HATCHET', price = 250, amount = 250, info = {}, type = 'weapon' },
            ['WEAPON_PISTOL'] = { name = 'WEAPON_PISTOL', price = 2500, amount = 5, info = {}, type = 'weapon', license = 'weapon' },
        },
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
