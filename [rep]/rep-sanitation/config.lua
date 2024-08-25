Config = {}
Config.Target = 'ox_target' -- qb-target, ox_target, qtarget, interact
Config.UseTalkNPC = true -- means use rep-talkNPCv2
Config.QBDefault = false -- If u want use qb-menu, qb-input
Config.OxInventory = GetResourceState("ox_inventory") ~= "missing"
Config.ImgLink = "https://raw.githubusercontent.com/Q4D1952K/anhitem/main/" -- Change your imgage link
Config.Boss = {
    ped = `s_m_y_garbage`,
    pos = vector4(-351.44, -1566.37, 24.22, 314.22),
    name = 'Brook Stream',
    animScenario = 'WORLD_HUMAN_CLIPBOARD',
    tag =  "Sanitation Employees",
    color = "#73583e",
} -- If don't use rep-talkNPC v2
Config.Vehicle = {
    model = `trash2`,
    spawnpos = vector4(-342.62, -1560.33, 24.95, 71.3),
    bone = 'platelight', -- To target
    autoCloseDoor = true, -- Close door after throw trash
    door = 5,
}
Config.Exchange = {
    status = true, -- If u want Exchange System
    listitems = {
        [1] = {name = "plastic", remove = 3, add = 2}, -- this means: 2 recyclablematerial  = 3 plastics ♻
        [2] = {name = "iron", remove = 3 , add = 1},
        [3] = {name = "steel", remove = 3, add = 1},
        [4] = {name = "glass", remove = 3, add = 1},
        [5] = {name = "rubber", remove = 3, add = 1},
        [6] = {name = "aluminum", remove = 3, add = 1},
    },
}
Config.Trash = {
    amount = 15,        -- Trashes to pick up per run
    payments = 200,
    busyTime = 5 * 60, -- Time to trash fresh// seconds
    recyclablematerial = {
        item = "recyclablematerial",
        amount = math.random(50, 80)
    },
    luckyItems = {
        chance = 10, -- 10% to find lucky items
        items = {-- Add your lucky items here
            'rolex',
            'goldchain',
            '10kgoldchain',
            'samsungphone',
            'iphone',
            'laptop',
            'deliverylist',
        },
    }
}
Config.Bins = { -- https://forge.plebmasters.de/objects
    `prop_dumpster_01a`,
    `prop_dumpster_02a`,
    `prop_dumpster_02b`,
    `prop_dumpster_3a`,
    `prop_dumpster_4a`,
    `prop_dumpster_4b`,
    `prop_bin_01a`,
    `prop_bin_02a`,
    `prop_bin_01a`,
    `prop_bin_03a`,
    `prop_bin_04a`,
    `prop_bin_14b`,
    `prop_bin_08a`,
    `prop_bin_08open`,
    `prop_bin_09a`,
    `prop_bin_05a`,
    `prop_bin_06a`,
    `prop_bin_07c`,
    `prop_bin_07b`,
    `prop_bin_07d`,
    `prop_bin_07a`,
    `prop_bin_14a`,
    `prop_bin_10a`,
    `prop_bin_10b`,
    `prop_bin_11a`,
    `prop_bin_11b`,
    `prop_bin_12a`,
    `prop_bin_13a`,
    `prop_bin_14a`,
    `prop_bin_14b`,
    `prop_bin_beach_01a`,
    `prop_bin_beach_01d`,
    `prop_bin_delpiero`,
    `prop_bin_delpiero_b`,
    `zprop_bin_01a_old`,
    `prop_rub_binbag_sd_01`,
    `prop_rub_binbag_sd_02`,
    `prop_rub_binbag_03b`,
    `prop_rub_binbag_04`,
    `prop_rub_binbag_05`,
    `prop_rub_binbag_03`,
    `prop_rub_binbag_01`,
    `prop_rub_binbag_01b`,
    `prop_rub_binbag_06`,
    `prop_rub_binbag_08`,
    `prop_recyclebin_03_a`,
    `prop_recyclebin_04_a`,
    `prop_recyclebin_04_b`,
    `prop_recyclebin_05_a`,
    `prop_recyclebin_02_c`,
    `prop_recyclebin_02b`,
    `prop_recyclebin_02_d`,
    `prop_recyclebin_02a`,
}
-- Locations
Config.Location = {
    [1] = { name = 'EBURO', label = 'El Burro Heights' },
    [2] = { name = 'MURRI', label = 'Murrieta Heights' },
    [3] = { name = 'KOREAT', label = 'Little Seoul' },
    [4] = { name = 'MIRR', label = 'Mirror Park' },
    [5] = { name = 'EAST_V', label = 'East Vinewood' },
    [6] = { name = 'CHAMH', label = 'Chamberlain' },
    [7] = { name = 'DAVIS', label = 'Davis' },
    [8] = { name = 'CYPRE', label = 'Cypress Flats' },
    [9] = { name = 'HAWICK', label = 'Hawick' },
    [10] = { name = 'DTVINE', label = 'Downtown Vinewood' },
    [11] = { name = 'BURTON', label = 'Burton' },
    [12] = { name = 'MOVIE', label = 'Richards Majestic' },
    [13] = { name = 'ROCKF', label = 'Rockford Hills' },
    [14] = { name = 'RICHM', label = 'Richman' },
    [15] = { name = 'PBLUFF', label = 'Pacific Bluffs' },
    [16] = { name = 'DELPE', label = 'Del Perro' },
    [17] = { name = 'BEACH', label = 'Vespucci Beach' },
    [18] = { name = 'AIRP', label = 'Los Santos International Airport' },
    [19] = { name = 'TERMINA', label = 'Terminal' },
    [20] = { name = 'PBOX', label = 'Pillbox Hill' },
}
-- Below is some district you can add, my set pos above is center of the district as possible.
-- AIRP = Los Santos International Airport
-- ALAMO = Alamo Sea
-- ALTA = Alta
-- ARMYB = Fort Zancudo
-- BANHAMC = Banham Canyon Dr
-- BANNING = Banning
-- BEACH = Vespucci Beach
-- BHAMCA = Banham Canyon
-- BRADP = Braddock Pass
-- BRADT = Braddock Tunnel
-- BURTON = Burton
-- CALAFB = Calafia Bridge
-- CANNY = Raton Canyon
-- CCREAK = Cassidy Creek
-- CHAMH = Chamberlain Hills
-- CHIL = Vinewood Hills
-- CHU = Chumash
-- CMSW = Chiliad Mountain State Wilderness
-- CYPRE = Cypress Flats
-- DAVIS = Davis
-- DELBE = Del Perro Beach
-- DELPE = Del Perro
-- DELSOL = La Puerta
-- DESRT = Grand Senora Desert
-- DOWNT = Downtown
-- DTVINE = Downtown Vinewood
-- EAST_V = East Vinewood
-- EBURO = El Burro Heights
-- ELGORL = El Gordo Lighthouse
-- ELYSIAN = Elysian Island
-- GALFISH = Galilee
-- GOLF = GWC and Golfing Society
-- GRAPES = Grapeseed
-- GREATC = Great Chaparral
-- HARMO = Harmony
-- HAWICK = Hawick
-- HORS = Vinewood Racetrack
-- HUMLAB = Humane Labs and Research
-- JAIL = Bolingbroke Penitentiary
-- KOREAT = Little Seoul
-- LACT = Land Act Reservoir
-- LAGO = Lago Zancudo
-- LDAM = Land Act Dam
-- LEGSQU = Legion Square
-- LMESA = La Mesa
-- LOSPUER = La Puerta
-- MIRR = Mirror Park
-- MORN = Morningwood
-- MOVIE = Richards Majestic
-- MTCHIL = Mount Chiliad
-- MTGORDO = Mount Gordo
-- MTJOSE = Mount Josiah
-- MURRI = Murrieta Heights
-- NCHU = North Chumash
-- NOOSE = N.O.O.S.E
-- OCEANA = Pacific Ocean
-- PALCOV = Paleto Cove
-- PALETO = Paleto Bay
-- PALFOR = Paleto Forest
-- PALHIGH = Palomino Highlands
-- PALMPOW = Palmer-Taylor Power Station
-- PBLUFF = Pacific Bluffs
-- PBOX = Pillbox Hill
-- PROCOB = Procopio Beach
-- RANCHO = Rancho
-- RGLEN = Richman Glen
-- RICHM = Richman
-- ROCKF = Rockford Hills
-- RTRAK = Redwood Lights Track
-- SANAND = San Andreas
-- SANCHIA = San Chianski Mountain Range
-- SANDY = Sandy Shores
-- SKID = Mission Row
-- SLAB = Stab City
-- STAD = Maze Bank Arena
-- STRAW = Strawberry
-- TATAMO = Tataviam Mountains
-- TERMINA = Terminal
-- TEXTI = Textile City
-- TONGVAH = Tongva Hills
-- TONGVAV = Tongva Valley
-- VCANA = Vespucci Canals
-- VESP = Vespucci
-- VINE = Vinewood
-- WINDF = Ron Alternates Wind Farm
-- WVINE = West Vinewood
-- ZANCUDO = Zancudo River
-- ZP_ORT = Port of South Los Santos
-- ZQ_UAR = Davis Quartz
Config.Lang = {
   en = {
    blip = {
        company = {
            sprite = 318,
            range = true,
            color = 2,
            scale = 0.9,
            label = "South LS. Recycling"
        },
        returnveh = {
            sprite = 477,
            range = true,
            color = 2,
            scale = 0.9,
            label = "Vehicle Turn In"
        }
    },
    menu = {
        description = "%s x %s for %s x %s",
        header = "Exchange",
        close = "X | Close"
    },
    input = {
        header = "EXCHANGING:",
        submit = "CONFIRM",
        label = "quantity",
    },
    bossNpc = {
        startMSG = 'Hello, how can I assist you?',
        button1 = {
            [1] = "How does this job work?",
            [2] = "Hello, new here? Let me explain \n \n First, you need a tablet, then apply for a job here. \n \n You can work faster if you work with your friends. You can go 4 and move 2 points at a time. \n \n Oh, little tip, the food at Owo Cafe can help you stay awake to get more tips.",
            [3] = "I want to start working",
            [4] = "Now turn on your tablet to find or create a group for yourself!",
            [5] = "You already have this job",
            [6] = "Oh, it doesn't seem to suit me",
        },
        button2 = {
            [1] = "I want to take the job",
            [2] = "Now turn on your tablet to find or create a group for yourself!",
        },
        button3 = {
            [1] = "I want quit the job",
            [2] = "It's sad to say goodbye to you",
        },
        button4 = {
            [1] = "I want rent a vehicle",
        },
        button5 = {
            [1] = "I want turn in vehicle",
        },
        button6 = {
            [1] = "I want to exchange materials",
        },
        button7 = {
            [1] = "I'm just passing through here",
        },
    },
    target = {
        signin =  {
            label = "Sign in",
            icon = "fa-solid fa-user",
        },
        signout =  {
            label = "Sign Out",
            icon = "fa-solid fa-user"
        },
        spawnveh = {
            label = "Ask the foreman for a vehicle",
            icon = "fa-solid fa-truck"
        },
        returnveh = {
            label = "Turn In Vehicle",
            icon = "fas fa-shuttle-van"
        },
        grabtrash = {
            label = "Pick Up Trash",
            icon = "fa-solid fa-trash-arrow-up"
        },
        throwtrash = {
            label = "Throw In Trash",
            icon = "fa-solid fa-hand"
        },
        exchange = {
            label = "Exchange",
            icon = "fa-solid fa-recycle"
        },
    },
    tablet = {
        stage1 = {
            label = "Go to the foreman",
            header = "CURRENT",
            icon = "fas fa-people-carry",
            color = "#59c5f7",
            time = "NONE"
        },
        stage2 = {
            label =  "Get in the sanitation vehicle",
            header = "CURRENT",
            icon = "fas fa-people-carry",
            color ="#59c5f7",
             time = "NONE"
        },
        stage3 = {
            label =  "Go to the assigned zone (%s)",
            header = "CURRENT",
            icon = "fas fa-people-carry",
            color ="#59c5f7",
             time = "NONE"
        },
        stage4 = {
            label =  "Collect Trash",
            label2 =  "(%s/%s) Collect Trash",
            header = "CURRENT",
            icon = "fas fa-people-carry",
            color ="#59c5f7",
             time = "NONE"
        },
        stage5 = {
            label =  "Go to the next zone (%s)",
            header = "CURRENT",
            icon = "fas fa-people-carry",
            color ="#59c5f7",
             time = "NONE"
        },
        stage6 = {
            label = "Return the vehicle",
            header = "CURRENT",
            icon = "fas fa-people-carry",
            color ="#59c5f7",
             time = "NONE"
        },
        done = {
            label = "Job Finished",
            header = "CURRENT",
            icon = "fas fa-people-carry",
            color ="#59c5f7",
             time = 5000
        },
    },
    error = {
        own_job = {
            label = "Please Sign Out from the other jobs first!",
            type = "error",
            time = 5000,
        },
        occupied = {
            label = "Something on the way!",
            type = "error",
            time = 5000,
        },
        overmem = {
            label = "Something on the way!",
            type = "error",
            time = 5000,
        },
        emptybin = {
            label = "This is empty!",
            type = "error",
            time = 5000,
        },
        hasProp = {
            label = "You can't handle too much!",
            type = "error",
            time = 5000,
        },
        job = {
            label = "You are not signed in as our employee?",
            type = "error",
            time = 5000
        },
        far = {
            label = "Wait a minute.. This isn't our truck?",
            type = "error",
            time = 5000
        },
        amountItem = {
            label = "Not enough materials!",
            type = "error",
            time = 5000
        },
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
