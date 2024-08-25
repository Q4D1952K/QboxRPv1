fx_version 'cerulean'
game 'gta5'

name "Rep Dev - Hotp"
author "Q4D"
version "1.0"

server_scripts{
	'build/server/*.server.js',
	'build/server/*.lua',
}

client_scripts {
	'build/client/*.lua',
    'build/client/*.client.js',
}

ui_page 'build/ui/index.html'

files {
	'build/ui/index.html',
	'build/ui/*.js',
	'build/ui/preset-browser/*.js',
}

escrow_ignore {
    'config.lua',
    'README.MD',
}

lua54 'yes'
dependency '/assetpacks'