local MenuPool = NativeUI.CreatePool()

local menu = NativeUI.CreateMenu(
    Config.Menu.title or "",
    Config.Menu.subtitle or "",
    Config.Menu.position.x,
    Config.Menu.position.y
)

if Config.Menu.banner then
    local RuntimeTXD = CreateRuntimeTxd('DonatorMenu_Header')
    local Object = CreateDui(Config.Menu.banner, 512, 128)

    local dui = GetDuiHandle(Object)
    CreateRuntimeTextureFromDuiHandle(RuntimeTXD, 'DonatorMenu_Header', dui)

    local background = Sprite.New('DonatorMenu_Header', 'DonatorMenu_Header', 0, 0, 512, 128)
    menu:SetBannerSprite(background, true)
end

MenuPool:Add(menu)
MenuPool:MouseControlsEnabled(false)
MenuPool:MouseEdgeEnabled(false)
MenuPool:ControlDisablingEnabled(false)

local function GetLockedMessage(entry)
    return entry.locked or Config.Messages.locked
end

local function HasPermission(permission)
    if not permission then
        return true
    end

    return lib.callback.await('Donator-Menu:check', false, permission)
end

local function HasNestedPermission(items)
    for _, nested in ipairs(items) do
        if nested.permission and HasPermission(nested.permission) then
            return true
        end
    end

    return false
end

local function RunAction(action, model)
    if action == "vehicle" then
        TriggerEvent('DonatorMenu:SpawnCar', model)
    elseif action == "weapon" then
        TriggerEvent('DonatorMenu:GiveWeapon', model)
    elseif action == "ped" then
        TriggerEvent('DonatorMenu:SpawnPed', model)
    end
end

function CreateMenuItems(parentMenu, items)
    for _, entry in ipairs(items) do
        if entry.items then
            local allowed = HasPermission(entry.permission)
            local nestedAllowed = not allowed and HasNestedPermission(entry.items)

            if allowed or nestedAllowed then
                local submenu = MenuPool:AddSubMenu(parentMenu, entry.label, entry.description or "", true, true)
                CreateMenuItems(submenu, entry.items)
            else
                local lockedMessage = GetLockedMessage(entry)
                local lockedMenu = NativeUI.CreateItem('~r~' .. entry.label, lockedMessage)
                lockedMenu:RightLabel("🔒")
                parentMenu:AddItem(lockedMenu)
                lockedMenu.Activated = function(_, _)
                    Notify(lockedMessage)
                end
            end
        elseif entry.action then
            local newItem = NativeUI.CreateItem(entry.label, entry.description or "")
            newItem.Activated = function(_, _)
                RunAction(entry.action, entry.model)
            end
            parentMenu:AddItem(newItem)
        end
    end
end

CreateMenuItems(menu, Config.Entries)
MenuPool:RefreshIndex()

if Config.Open.type == "command" then
    RegisterCommand(Config.Open.command, function()
        menu:Visible(not menu:Visible())
    end, false)
else
    RegisterCommand('+donator_menu', function()
        menu:Visible(not menu:Visible())
    end, false)

    RegisterKeyMapping('+donator_menu', "Donator Menu", "keyboard", Config.Open.key)
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        MenuPool:ProcessMenus()
    end
end)

RegisterNetEvent('DonatorMenu:SpawnCar')
AddEventHandler('DonatorMenu:SpawnCar', function(car)
    local ped = PlayerPedId()
    local carHash = GetHashKey(car)

    RequestModel(carHash)
    local timeout = 5000
    while not HasModelLoaded(carHash) and timeout > 0 do
        Citizen.Wait(100)
        timeout = timeout - 100
    end

    if not HasModelLoaded(carHash) then
        Notify("~r~[ERROR]~w~ Failed to load model: " .. car)
        return
    end

    if IsPedInAnyVehicle(ped, false) then
        local vehicle = GetVehiclePedIsIn(ped, false)
        DeleteVehicle(vehicle)
    end

    local coords = GetEntityCoords(ped)
    local vehicle = CreateVehicle(carHash, coords.x, coords.y, coords.z, GetEntityHeading(ped), true, false)
    SetPedIntoVehicle(ped, vehicle, -1)
    SetModelAsNoLongerNeeded(carHash)

    Notify("~g~[SUCCESS]~w~ Vehicle Spawned")
end)

RegisterNetEvent('DonatorMenu:GiveWeapon')
AddEventHandler('DonatorMenu:GiveWeapon', function(weapon)
    local ped = PlayerPedId()
    local weaponHash = GetHashKey(weapon)
    GiveWeaponToPed(ped, weaponHash, 999, false, true)
    SetPedAmmo(ped, weaponHash, 999)
end)

RegisterNetEvent('DonatorMenu:SpawnPed')
AddEventHandler('DonatorMenu:SpawnPed', function(ped)
    local pedHash = GetHashKey(ped)

    RequestModel(pedHash)
    while not HasModelLoaded(pedHash) do
        Citizen.Wait(100)
    end

    SetPlayerModel(PlayerId(), pedHash)
    SetModelAsNoLongerNeeded(pedHash)
    local newPed = PlayerPedId()
    SetEntityHealth(newPed, GetEntityMaxHealth(newPed))
end)

function Notify(message)
    Config.Notify(message)
end
