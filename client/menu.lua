local MenuPool = NativeUI.CreatePool()

local menu = NativeUI.CreateMenu(
    Config.useMenuTitle and Config.menuTitle or "",
    Config.useMenuDescription and Config.menuDescription or "Addon Menu",
    Config.menuPos.x,
    Config.menuPos.y
)

MenuPool:Add(menu)
MenuPool:MouseControlsEnabled(false)
MenuPool:MouseEdgeEnabled(false)
MenuPool:ControlDisablingEnabled(false)

function CreateMenuItems(parentMenu, items)
    for _, item in ipairs(items) do
        if item.type == "submenu" then
            local hasPermission = true
            if item.ace then
                hasPermission = lib.callback.await('Donator-Menu:check', false, item.ace)
            end
            if hasPermission then
                local submenu = MenuPool:AddSubMenu(parentMenu, item.text, item.description, true, true)
                CreateMenuItems(submenu, item.items)
            else
                local lockedMenu = NativeUI.CreateItem('~r~'..item.text, item.lockedText)
                lockedMenu:RightLabel("🔒")
                parentMenu:AddItem(lockedMenu)
                lockedMenu.Activated = function(_, _)
                    Notify(item.lockedText)
                end
            end
        elseif item.type == "item" then
            local newItem = NativeUI.CreateItem(item.text, "")
            newItem.Activated = function(_, _)
                TriggerEvent('DonatorMenu:SpawnCar', item.spawncode)
            end
            parentMenu:AddItem(newItem)
        end
    end
end

CreateMenuItems(menu, Config.menu)
MenuPool:RefreshIndex()

RegisterCommand(Config.menuCommand, function()
    menu:Visible(not menu:Visible())
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        MenuPool:ProcessMenus()
    end
end)

RegisterNetEvent('DonatorMenu:SpawnCar')
AddEventHandler('DonatorMenu:SpawnCar', function(car)
    local playerPed = PlayerPedId()
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

    if IsPedInAnyVehicle(playerPed, false) then
        DeleteVehicle(GetVehiclePedIsIn(playerPed, false))
    end

    local coords = GetEntityCoords(playerPed)
    local vehicle = CreateVehicle(carHash, coords.x, coords.y, coords.z, GetEntityHeading(playerPed), true, false)
    SetPedIntoVehicle(playerPed, vehicle, -1)
    SetModelAsNoLongerNeeded(carHash)
    
    Notify("~g~[SUCCESS]~w~ Vehicle Spawned")
end)

function Notify(msg)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(msg)
    DrawNotification(false, false)
end
