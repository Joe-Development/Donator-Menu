Config = {
    menuPos = {x = 1450, y = 100},
    
    useKeyBind = false,
    menuKey = 167, -- only works if userKeyBind is true
    menuCommand = "donatormenu", -- only works if userKeyBind is false

    useMenuTitle = false, -- i recommend having off if ur using a menuTexture
    menuTitle = "~p~Donator ~y~Menu", -- only works if useMenuTitle is true
    useMenuDescription = true,
    menuDescription = "Welcome to the Donator Menu", -- only works if useMenuTitle is true

    useImageBanner = true,
    AddonMenuBannerImage = 'https://cdn.discordapp.com/attachments/1161069645827166304/1227890264597856297/3dp4fyzfl7q51.gif?ex=662a0cec&is=661797ec&hm=d4992594e6df2a555ae55724cc67c9f69ecb22bc0627774b17df374ed4de8b24&',
}

Config.menu = {
    {
        type = "submenu", -- submenu/item 
        text = "Police Cars",
        ace = "police.maverick",
        lockedText = "To Unlock this menu you need to be a Donator",
        items = {
            [1] = {
                type = "item", -- submenu/item 
                text = "Police Maverick",
                spawncode = "police",
            },
            [2] = {
                type = "item", -- submenu/item 
                text = "Police Buffalo",
                spawncode = "police1",
            },
            [3] = {
                type = "item", -- submenu/item 
                text = "Police Interceptor",
                spawncode = "police2",
            },
        }
    },

    {
        type = "submenu",
        text = "Ambulance Cars",
        ace = "ambulance.maverick",
        lockedText = "To Unlock this menu you need to be a Donator",
        items = {
            [1] = {
                type = "item", -- submenu/item 
                text = "Ambulance Maverick",
                spawncode = "ambulance",
            },
            [2] = {
                type = "item", -- submenu/item 
                text = "Ambulance Buffalo",
                spawncode = "ambulance1",
            },
        }
    }
}

