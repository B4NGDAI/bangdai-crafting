fx_version 'cerulean'
games {"rdr3","gta5"}
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
description 'bangdai-crafting'
author 'adnanberandai'

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua'
}

server_scripts {
	'server/*.lua'
}

client_scripts {
    'client/*.lua'
}


lua54 'yes'