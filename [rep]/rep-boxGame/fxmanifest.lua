fx_version "cerulean"
description "Rep-BoxGame"
author "Q4D + IBunny"
version '1.0.0'
lua54 'yes'
games { "gta5", "rdr3" }

client_scripts {
    'client/*.lua',
}

shared_scripts {
    'config.lua'
}

files {
    '/web/dist/*.html',
    '/web/dist/*.svg',
    '/web/dist/assets/*.js',
    '/web/dist/assets/*.css',
    '/web/dist/**/*',
}

ui_page '/web/dist/index.html'

escrow_ignore {
    'client/cl_function.lua',  -- Only ignore one 
    'config.lua',
    'README.MD',
}
dependency '/assetpacks'