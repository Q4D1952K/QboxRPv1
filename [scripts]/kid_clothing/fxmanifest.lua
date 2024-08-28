fx_version "cerulean"
description "Rep Multichar"
author "Kid"
version '1.0.0'

lua54 'yes'

games { "gta5", "rdr3" }

shared_scripts {'@ox_lib/init.lua', 'clothingdata/*.lua' , 'config.lua'}

client_scripts { 'client.lua' }

server_scripts { '@oxmysql/lib/MySQL.lua', -- OXMYSQL

    'server.lua' }