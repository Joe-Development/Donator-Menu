fx_version "cerulean"
games {"gta5"}

author "JoeV2"
description "Addon Menu"
version "1.0.0"

shared_script 'config.lua'

client_scripts {
    "dependencies/NativeUI.lua",
    "menu.lua"
}

server_script "server.lua"


lua54 "yes"