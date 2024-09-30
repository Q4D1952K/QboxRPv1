fx_version "cerulean"
description "Rep Shops"
author "Q4D + BahnMiFPS"
version '1.0.0'

lua54 'yes'

games {"gta5", "rdr3"}

ui_page 'web/build/index.html'

client_scripts {"client/**/*"}

shared_scripts {'@ox_lib/init.lua', 'config.lua'}

server_script "server/**/*"

files {'web/build/index.html', 'web/build/**/*'}

dependencies {
    'ox_lib'
}

escrow_ignore {
    'client/cl_function.lua',  -- Only ignore one file
    'client/framework/*.lua',  -- Only ignore one file
    'server/sv_function.lua',  -- Only ignore one file
    'server/framework/*.lua',  -- Only ignore one file
    'config.lua',
    'README.MD',
    'INSTALL.md'
}
dependency '/assetpacks'