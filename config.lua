Config = {
    menuPos = {x = 1450, y = 100},
    
    useKeyBind = false,
    menuKey = 'F3', -- only works if userKeyBind is true
    menuCommand = "donatormenu", -- only works if userKeyBind is false

    useMenuTitle = false, -- i recommend having off if ur using a menuTexture
    menuTitle = "~p~Donator ~y~Menu", -- only works if useMenuTitle is true
    useMenuDescription = true,
    menuDescription = "Welcome to the Donator Menu", -- only works if useMenuDescription is true

    useImageBanner = true,
    AddonMenuBannerImage = 'https://files.catbox.moe/an1x9e.png',
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
            { type = "item", text = "Example Item", description = "Example description", spawncode = "example_spawn" },
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
                    { type = "item", text = "Example Item", description = "Example description", spawncode = "example_spawn" },
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
            { type = "item", text = "Police Maverick",  description = "Police Maverick", spawncode = "police" },
            { type = "item", text = "Police Buffalo", description = "Police Buffalo", spawncode = "police1" },
            { type = "item", text = "Police Interceptor",  description = "Police Interceptor", spawncode = "police2" },
        }
    },
    {
        type = "submenu",
        text = "Ambulance Cars",
        ace = "ambulance.maverick",
        description = "Ambulance Cars",
        lockedText = "~r~To unlock this menu, you need to be a Donator",
        items = {
            { type = "item", text = "Ambulance Maverick", description = "Ambulance Maverick", spawncode = "ambulance" },
            { type = "item", text = "Ambulance Buffalo",  description = "Ambulance Buffalo", spawncode = "ambulance1" },
        }
    },
    {
        type = "submenu",
        text = "Free Cars",
        description = "Free Cars",
        items = {
            { type = "item", text = "Compact Car", description = "Compact Car", spawncode = "blista" },
            { type = "item", text = "SUV", description = "SUV", spawncode = "baller" },
            { type = "item", text = "Motorcycle", description = "Motorcycle", spawncode = "bati" },
            { type = "item", text = "Off-road",  description = "Off-road", spawncode = "rebel" },
        }
    },

    -- nested example
    {
        type = "submenu",
        text = "Example Menu",
        ace = "example.access",
        description = "Example description",
        lockedText = "~r~Access denied",
        items = {
            {
                type = "submenu",
                text = "Example Menu 1",
                ace = "example.access",
                description = "Example description",
                lockedText = "~r~Access denied",
                items = {
                    { type = "item", text = "Example Item", description = "Example description", spawncode = "adder" },
                }
            },
            {
                type = "submenu",
                text = "Example Menu 2",
                ace = "example.access",
                description = "Example description",
                lockedText = "~r~Access denied",
                items = {
                    { type = "item", text = "Example Item", description = "Example description", spawncode = "adder" },
                }
            }
        }
    }


}

