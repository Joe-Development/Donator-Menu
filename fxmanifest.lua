fx_version "cerulean"
games {"gta5"}
author "JoeV2"
description "A Nice Easy Configurable Donator Menu"
version "1.1.0"
lua54 "yes"

shared_scripts {
    "@ox_lib/init.lua",
    "config.lua"
}

client_scripts {
    "dependencies/NativeUI.lua",
    "client/menu.lua"
}

server_script "server/server.lua"

dependencies {
    "ox_lib"
}

lua54 "yes"