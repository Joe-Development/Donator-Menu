fx_version "cerulean"
games {"gta5"}

author "JoeV2"
description "Addon Menu"
version "1.0.0"

shared_script 'config.lua'

client_scripts {
    "dependencies/NativeUI.lua",
    "client/menu.lua"
}

server_script "server/server.lua"


lua54 "yes"