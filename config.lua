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
    - 'pack': the Pack type can only be used on type 'item' all pack types here: 'car', 'weapon', 'ped'

    Example:
    {
        type = "submenu",
        text = "Example Menu",
        ace = "example.access",
        description = "Example description",
        lockedText = "~r~Access denied",
        items = {
            { type = "item", pack = 'car', text = "Example Item", description = "Example description", spawncode = "example_spawn" },
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
                    { type = "item", pack = 'car', text = "Example Item", description = "Example description", spawncode = "example_spawn" },
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
            { type = "item", pack = "car", text = "Police Maverick",  description = "Police Maverick", spawncode = "police" },
            { type = "item", pack = "car", text = "Police Buffalo", description = "Police Buffalo", spawncode = "police1" },
            { type = "item", pack = "car", text = "Police Interceptor",  description = "Police Interceptor", spawncode = "police2" },
        }
    },
    {
        type = "submenu",
        text = "Ambulance Cars",
        ace = "ambulance.maverick",
        description = "Ambulance Cars",
        lockedText = "~r~To unlock this menu, you need to be a Donator",
        items = {
            { type = "item", pack = "car", text = "Ambulance Maverick", description = "Ambulance Maverick", spawncode = "ambulance" },
            { type = "item", pack = "car", text = "Ambulance Buffalo",  description = "Ambulance Buffalo", spawncode = "ambulance1" },
        }
    },
    {
        type = "submenu",
        text = "Free Cars",
        description = "Free Cars",
        items = {
            { type = "item", pack = "car", text = "Compact Car", description = "Compact Car", spawncode = "blista" },
            { type = "item", pack = "car", text = "SUV", description = "SUV", spawncode = "baller" },
            { type = "item", pack = "car", text = "Motorcycle", description = "Motorcycle", spawncode = "bati" },
            { type = "item", pack = "car", text = "Off-road",  description = "Off-road", spawncode = "rebel" },
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
                    { type = "item", pack = "car", text = "Example Item", description = "Example description", spawncode = "adder" },
                }
            },
            {
                type = "submenu",
                text = "Example Menu 2",
                ace = "example.access",
                description = "Example description",
                lockedText = "~r~Access denied",
                items = {
                    { type = "item", pack = "car", text = "Example Item", description = "Example description", spawncode = "adder" },
                }
            }
        }
    },

    {
        type = "submenu",
        text = "Weapon Packs",
        ace = "weapon.access",
        description = "Weapon Packs",
        lockedText = "~r~Access denied",
        items = {
            { type = "item", pack = "weapon", text = "Pistol", description = "Pistol", spawncode = "weapon_pistol" },
            { type = "item", pack = "weapon", text = "Carbine", description = "Carbine", spawncode = "weapon_carbinerifle" },
        }
    },

    {
        type = "submenu",
        text = "Peds",
        description = "Peds",
        ace = "ped.access",
        lockedText = "~r~Access denied",
        items = {
            { type = "item", pack = "ped", text = "Ped 1", description = "Ped 1", spawncode = "ped1" },
            { type = "item", pack = "ped", text = "Ped 2", description = "Ped 2", spawncode = "ped2" },
        }
    },

    -- Nested Weapon Example
    {
        type = "submenu",
        text = "Special Weapons",
        ace = "weapon.special",
        description = "Special Weapon Packs",
        lockedText = "~r~Access denied",
        items = {
            {
                type = "submenu",
                text = "Heavy Weapons",
                ace = "weapon.heavy",
                description = "Heavy Weapons Pack",
                lockedText = "~r~Access denied",
                items = {
                    { type = "item", pack = "weapon", text = "RPG", description = "Rocket Launcher", spawncode = "weapon_rpg" },
                    { type = "item", pack = "weapon", text = "Minigun", description = "Minigun", spawncode = "weapon_minigun" },
                }
            },
            {
                type = "submenu",
                text = "Sniper Rifles",
                ace = "weapon.sniper",
                description = "Sniper Rifles Pack",
                lockedText = "~r~Access denied",
                items = {
                    { type = "item", pack = "weapon", text = "Heavy Sniper", description = "Heavy Sniper", spawncode = "weapon_heavysniper" },
                    { type = "item", pack = "weapon", text = "Marksman Rifle", description = "Marksman Rifle", spawncode = "weapon_marksmanrifle" },
                }
            }
        }
    },

    {
        type = "submenu",
        text = "Special Peds",
        ace = "ped.special",
        description = "Special Character Packs",
        lockedText = "~r~Access denied",
        items = {
            {
                type = "submenu",
                text = "Police Peds",
                ace = "ped.police",
                description = "Police Character Pack",
                lockedText = "~r~Access denied",
                items = {
                    { type = "item", pack = "ped", text = "SWAT", description = "SWAT Officer", spawncode = "s_m_y_swat_01" },
                    { type = "item", pack = "ped", text = "Highway Patrol", description = "Highway Patrol Officer", spawncode = "s_m_y_hwaycop_01" },
                }
            },
            {
                type = "submenu",
                text = "Gang Peds",
                ace = "ped.gang",
                description = "Gang Character Pack",
                lockedText = "~r~Access denied",
                items = {
                    { type = "item", pack = "ped", text = "Ballas", description = "Ballas Gang Member", spawncode = "g_m_y_ballasout_01" },
                    { type = "item", pack = "ped", text = "Lost MC", description = "Lost MC Member", spawncode = "g_m_y_lost_01" },
                }
            }
        }
    }


}
