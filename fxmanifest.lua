fx_version 'cerulean'
game 'gta5'

name "behr_elevator"
description "a simple elevator script to teleport players to locations"
author "Behr"
version "1.0.0"

lua54 'yes'

shared_scripts {
    '@ox_lib/init.lua',
	'shared/config.lua'
}

client_scripts {
	'client/client.lua'
}

server_scripts {
	'server/server.lua'
}

dependencies {
	'ox_lib'
}