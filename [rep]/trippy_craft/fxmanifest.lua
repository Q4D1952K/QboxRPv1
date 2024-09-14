fx_version 'cerulean'
game 'gta5'

name "Crafting"
author "Q4D"
version "1.0.0"

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua'
}

client_scripts {
    'client/*.lua'
}

server_scripts {
    'server/*.lua'
}

escrow_ignore {
    'config.lua',
    'README.MD',
}

lua54 'yes'
dependency 'ox_lib'
dependency '/assetpacks'