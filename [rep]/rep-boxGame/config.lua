Config = {}
Config.Lang = {
    en = {
       ui = {
        subtitle = "Product",
        instruction = "Pack into the box, seal the bottom, and close securely with tape",
        mouseInstruction = "Drag the mouse to seal and close the box",
       }
    },
}

local _lang = GetConvar('repscripts:locale', 'en')
Lang = Config.Lang[_lang]