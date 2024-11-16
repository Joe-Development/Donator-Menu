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


--[[
    Configuration for the Donator Menu
    ----------------------------------

    How to Configure:
    - Each menu is defined as a table within the Config.menu table.
    - 'type': This should be "submenu" for menu sections and "item" for individual items.
    - 'text': The display name of the submenu.
    - 'ace': (Optional) Permission required to access the submenu if not provided anyone can access it.
    - 'description': A brief description of the submenu.
    - 'lockedText': The message shown if the user doesn't have access.
    - 'items': A list of items available in the submenu.

    Example:
    {
        type = "submenu",
        text = "Example Menu",
        ace = "example.access",
        description = "Example description",
        lockedText = "~r~Access denied",
        items = {
            { type = "item", text = "Example Item", spawncode = "example_spawn" },
        }
    }


    Example of Double Nested: 

    {
        type = "submenu",
        text = "Example Menu",
        ace = "example.access",
        description = "Example description",
        lockedText = "~r~Access denied",
        items = {
            {
                type = "submenu",
                text = "Example Menu",
                ace = "example.access",
                description = "Example description",
                lockedText = "~r~Access denied",
                items = {
                    { type = "item", text = "Example Item", spawncode = "example_spawn" },
                }
            }
        }
    }
]]

Config.menu = {
    {
        type = "submenu",
        text = "Police Packs",
        ace = "police.maverick",
        description = "Police Packs",
        lockedText = "~r~To unlock this menu, you need to be a Donator",
        items = {
            { type = "item", text = "Police Maverick", spawncode = "police" },
            { type = "item", text = "Police Buffalo", spawncode = "police1" },
            { type = "item", text = "Police Interceptor", spawncode = "police2" },
        }
    },
    {
        type = "submenu",
        text = "Ambulance Cars",
        ace = "ambulance.maverick",
        description = "Ambulance Cars",
        lockedText = "~r~To unlock this menu, you need to be a Donator",
        items = {
            { type = "item", text = "Ambulance Maverick", spawncode = "ambulance" },
            { type = "item", text = "Ambulance Buffalo", spawncode = "ambulance1" },
        }
    },
    {
        type = "submenu",
        text = "Free Cars",
        description = "Free Cars",
        items = {
            { type = "item", text = "Compact Car", spawncode = "blista" },
            { type = "item", text = "SUV", spawncode = "baller" },
            { type = "item", text = "Motorcycle", spawncode = "bati" },
            { type = "item", text = "Off-road", spawncode = "rebel" },
        }
    },


}

