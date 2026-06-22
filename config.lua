--[[
    Donator Menu Configuration
    --------------------------

    Menu (display)
    - position:  { x, y } screen position
    - title:     Menu title text, or false to hide
    - subtitle:  Menu subtitle text, or false to hide
    - banner:    Banner image URL, or false to hide

    Open (how players open the menu)
    - type:      "command" or "keybind"
    - command:   Chat command name (when type = "command")
    - key:       Key name (when type = "keybind")

    Messages (defaults for locked menu entries)
    - locked:    Shown when a permission-locked entry is clicked

    Entries (menu content)
    Submenu:
    - label, description
    - permission:  (optional) ACE permission required
    - locked:      (optional) Override for locked message
    - items:       Child entries

    Item:
    - label, description
    - action:      "vehicle", "weapon", or "ped"
    - model:       Spawn code / weapon name / ped model
]]

Config = {

    Menu = {
        position = { x = 1450, y = 100 },
        title = false,
        subtitle = "Welcome to the Donator Menu",
        banner = "https://files.catbox.moe/an1x9e.png",
    },

    Open = {
        type = "command",
        command = "donatormenu",
        key = "F3",
    },

    Notify = function (message)
        SetNotificationTextEntry("STRING")
        AddTextComponentString(message)
        DrawNotification(false, false)
    end,

    Messages = {
        locked = "~r~Access denied",
    },

    Entries = {

        -- Vehicles
        {
            label = "Police Packs",
            description = "Police Packs",
            permission = "police.maverick",
            locked = "~r~To unlock this menu, you need to be a Donator",
            items = {
                { label = "Police Maverick", description = "Police Maverick", action = "vehicle", model = "police" },
                { label = "Police Buffalo", description = "Police Buffalo", action = "vehicle", model = "police1" },
                { label = "Police Interceptor", description = "Police Interceptor", action = "vehicle", model = "police2" },
            },
        },
        {
            label = "Ambulance Cars",
            description = "Ambulance Cars",
            permission = "ambulance.maverick",
            locked = "~r~To unlock this menu, you need to be a Donator",
            items = {
                { label = "Ambulance Maverick", description = "Ambulance Maverick", action = "vehicle", model = "ambulance" },
                { label = "Ambulance Buffalo", description = "Ambulance Buffalo", action = "vehicle", model = "ambulance1" },
            },
        },
        {
            label = "Free Cars",
            description = "Free Cars",
            items = {
                { label = "Compact Car", description = "Compact Car", action = "vehicle", model = "blista" },
                { label = "SUV", description = "SUV", action = "vehicle", model = "baller" },
                { label = "Motorcycle", description = "Motorcycle", action = "vehicle", model = "bati" },
                { label = "Off-road", description = "Off-road", action = "vehicle", model = "rebel" },
            },
        },

        -- Weapons
        {
            label = "Weapon Packs",
            description = "Weapon Packs",
            permission = "weapon.access",
            items = {
                { label = "Pistol", description = "Pistol", action = "weapon", model = "weapon_pistol" },
                { label = "Carbine", description = "Carbine", action = "weapon", model = "weapon_carbinerifle" },
            },
        },
        {
            label = "Special Weapons",
            description = "Special Weapon Packs",
            permission = "weapon.special",
            items = {
                {
                    label = "Heavy Weapons",
                    description = "Heavy Weapons Pack",
                    permission = "weapon.heavy",
                    items = {
                        { label = "RPG", description = "Rocket Launcher", action = "weapon", model = "weapon_rpg" },
                        { label = "Minigun", description = "Minigun", action = "weapon", model = "weapon_minigun" },
                    },
                },
                {
                    label = "Sniper Rifles",
                    description = "Sniper Rifles Pack",
                    permission = "weapon.sniper",
                    items = {
                        { label = "Heavy Sniper", description = "Heavy Sniper", action = "weapon", model = "weapon_heavysniper" },
                        { label = "Marksman Rifle", description = "Marksman Rifle", action = "weapon", model = "weapon_marksmanrifle" },
                    },
                },
            },
        },

        -- Peds
        {
            label = "Peds",
            description = "Peds",
            permission = "ped.access",
            items = {
                { label = "Ped 1", description = "Ped 1", action = "ped", model = "ped1" },
                { label = "Ped 2", description = "Ped 2", action = "ped", model = "ped2" },
            },
        },
        {
            label = "Special Peds",
            description = "Special Character Packs",
            permission = "ped.special",
            items = {
                {
                    label = "Police Peds",
                    description = "Police Character Pack",
                    permission = "ped.police",
                    items = {
                        { label = "SWAT", description = "SWAT Officer", action = "ped", model = "s_m_y_swat_01" },
                        { label = "Highway Patrol", description = "Highway Patrol Officer", action = "ped", model = "s_m_y_hwaycop_01" },
                    },
                },
                {
                    label = "Gang Peds",
                    description = "Gang Character Pack",
                    permission = "ped.gang",
                    items = {
                        { label = "Ballas", description = "Ballas Gang Member", action = "ped", model = "g_m_y_ballasout_01" },
                        { label = "Lost MC", description = "Lost MC Member", action = "ped", model = "g_m_y_lost_01" },
                    },
                },
            },
        },

        -- Examples (nested submenus)
        {
            label = "Example Menu",
            description = "Example description",
            permission = "example.access",
            items = {
                {
                    label = "Example Menu 1",
                    description = "Example description",
                    permission = "example.access",
                    items = {
                        { label = "Example Item", description = "Example description", action = "vehicle", model = "adder" },
                    },
                },
                {
                    label = "Example Menu 2",
                    description = "Example description",
                    permission = "example.access",
                    items = {
                        { label = "Example Item", description = "Example description", action = "vehicle", model = "adder" },
                    },
                },
            },
        },
    },
}
