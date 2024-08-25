fx_version 'cerulean'
game 'gta5'

name "Rep Scripts - PostOp - Tablet Version"
author "Q4D"
version "3.0.0"

shared_scripts { '@ox_lib/init.lua', 'config.lua' }

client_scripts { 
    -- '@qbx_core/modules/playerdata.lua', -- If use QBX
    'client/framework/*.lua',
    'client/*.lua' }

server_scripts {
    'server/framework/*.lua',
    'server/*.lua'
}

escrow_ignore {
    'client/cl_function.lua',  -- Only ignore one file
    'client/framework/*.lua',  -- Only ignore one file
    'server/sv_function.lua',  -- Only ignore one file
    'server/framework/*.lua',  -- Only ignore one file
    'config.lua',
    'README.MD',
}
-- If use ESX
-- shared_script '@es_extended/imports.lua'

lua54 'yes'
dependency 'ox_lib'
dependency '/assetpacks'