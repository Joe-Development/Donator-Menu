_menuPool = NativeUI.CreatePool()

if Config.useMenuTitle then
    if Config.useMenuDescription then
        mainMenu = NativeUI.CreateMenu(Config.menuTitle, Config.menuDescription, Config.menuPos.x, Config.menuPos.y)
    else
        mainMenu = NativeUI.CreateMenu(Config.menuTitle, "Addon Menu", Config.menuPos.x, Config.menuPos.y)
    end
else
    if Config.useMenuDescription then
        mainMenu = NativeUI.CreateMenu("", Config.menuDescription, Config.menuPos.x, Config.menuPos.y)
    else
        mainMenu = NativeUI.CreateMenu("", "Addon Menu", Config.menuPos.x, Config.menuPos.y)
    end
end


_menuPool:Add(mainMenu)
if Config.useImageBanner then
	local RuntimeTXD = CreateRuntimeTxd('Custom_Menu_Head_5')
    local Object = CreateDui(Config.AddonMenuBannerImage, 512, 128)
    _G.Object = Object
    local TextureThing = GetDuiHandle(Object)
    local Texture = CreateRuntimeTextureFromDuiHandle(RuntimeTXD, 'Custom_Menu_Head_5', TextureThing)
    Menuthing = "Custom_Menu_Head_5"
    local background = Sprite.New(Menuthing, Menuthing, 0, 0, 512, 128)
    mainMenu:SetBannerSprite(background, true)
end

_menuPool:MouseControlsEnabled (false);
_menuPool:MouseEdgeEnabled (false);
_menuPool:ControlDisablingEnabled(false);




function FirstItemUnlocked(menu)
    local submenu = _menuPool:AddSubMenu(menu, "🔓 Free Cars", "All Free Cars", Config.menuPos.x, Config.menuPos.y) 
    local carItem = NativeUI.CreateItem("adder", "Spawn ~b~Adder")
        submenu:AddItem(carItem)
        carItem.Activated = function(sender, item)
        if item == carItem then
            spawnCar("adder")
        end
    end
    
    _menuPool:MouseControlsEnabled(false)
    _menuPool:ControlDisablingEnabled(false)
end

function donatorPack1Unlocked(menu)
    local submenu = _menuPool:AddSubMenu(menu, "🔓 Donator Pack 1", "this Donator Pack comes with 3 cars", Config.menuPos.x, Config.menuPos.y) 
    local adder = NativeUI.CreateItem("adder", "Spawn ~b~Adder")
        submenu:AddItem(adder)
        adder.Activated = function(sender, item)
        if item == adder then
            spawnCar("adder")
        end
    end
    local futo = NativeUI.CreateItem("futo", "Spawn ~b~Futo")
        submenu:AddItem(futo)
        futo.Activated = function(sender, item)
        if item == futo then
            spawnCar("futo")
        end
    end
    local faggio = NativeUI.CreateItem("faggio", "Spawn ~b~Faggio")
        submenu:AddItem(faggio)
        faggio.Activated = function(sender, item)
        if item == faggio then
            spawnCar("faggio")
        end
    end
    _menuPool:MouseControlsEnabled(false)
    _menuPool:ControlDisablingEnabled(false)
end


-- Get Ace Checks


TriggerServerEvent('FreeCar:Check')
RegisterNetEvent('FreeCars:Result')
AddEventHandler('FreeCars:Result', function(Allowed)
    if Allowed then
        FirstItemUnlocked(mainMenu)
    else
        LockedFirstItem(mainMenu)
    end
end)

TriggerServerEvent('DonatorPack1:Check')
RegisterNetEvent('DonatorPack1:Result')
AddEventHandler('DonatorPack1:Result', function(Allowed)
    if Allowed then
        donatorPack1Unlocked(mainMenu)
    else
        LockedDonatorPack1(mainMenu)
    end
end)


-- End of Ace Check





-- locked items


function LockedFirstItem(menu)
    local click = NativeUI.CreateItem("🔒 Free Cars", "To Unlock this menu visit ~p~discord.gg/123")
    menu:AddItem(click)
    menu.OnItemSelect = function(sender,item,index)
            if item == click then
                notify("~r~[ERROR]~w~ You do not have permission to use this menu")
        end
    end
    _menuPool:MouseControlsEnabled(false)
    _menuPool:ControlDisablingEnabled(false)
end


function LockedDonatorPack1(menu)
    local click = NativeUI.CreateItem("🔒 Donator Pack 1", "To Unlock this menu visit ~p~discord.gg/123")
    menu:AddItem(click)
    menu.OnItemSelect = function(sender,item,index)
            if item == click then
                notify("~r~[ERROR]~w~ You do not have permission to use this menu")
        end
    end
    _menuPool:MouseControlsEnabled(false)
    _menuPool:ControlDisablingEnabled(false)
end


-- end of locked items




_menuPool:RefreshIndex()
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        _menuPool:ProcessMenus()
        if Config.useKeyBind then
            if IsControlJustPressed(1, Config.menuKey) then
                mainMenu:Visible(not mainMenu:Visible())
            end
        end
    end
end)

if Config.useKeyBind == false then
    RegisterCommand(Config.menuCommand, function()
        mainMenu:Visible(not mainMenu:Visible())
    end, false)
end





-- [ Functions ]

function notify(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(true, false)
end

function delLastCar()
    local playerPed = PlayerPedId()
    if IsPedInAnyVehicle(playerPed, false) then
        local playerVeh = GetVehiclePedIsIn(playerPed, false)
        SetEntityAsMissionEntity(playerVeh, true, true)
        DeleteVehicle(playerVeh)
    end
end

function spawnCar(car)
    local car = GetHashKey(car)
    RequestModel(car)
    local maxTime = 5000
    if not IsModelInCdimage(car) then
        notify("~r~[ERROR]~w~ Failed to load model " .. car .. " Please Try Again Later")
        return
    end
    while not HasModelLoaded(car) do
        RequestModel(car)
        maxTime = maxTime - 100
        if maxTime <= 0 then
            notify("~r~[ERROR]~w~ Failed to load model " .. car .. " Please Try Again Later")
            return
        end
        Citizen.Wait(100)
    end
    delLastCar()
    local x, y, z = table.unpack(GetEntityCoords(PlayerPedId()))
    local vehicle = CreateVehicle(car, x, y, z, GetEntityHeading(PlayerPedId()), true, false)
    SetPedIntoVehicle(PlayerPedId(), vehicle, -1)
    SetModelAsNoLongerNeeded(car)
    collectgarbage("collect")
    notify("~g~[SUCCESS]~w~ Vehicle Spawned")
end
