fx_version "cerulean"
description "Rep RecycleJob"
author "Q4D"
version '1.0.0'

lua54 'yes'

games {"gta5", "rdr3"}

client_scripts {"client/**/*"}

shared_scripts {'@ox_lib/init.lua', 'config.lua'}

server_scripts {
    "server/**/*"
}

dependency 'ox_lib'