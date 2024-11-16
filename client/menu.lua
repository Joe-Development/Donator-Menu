MenuPool = NativeUI.CreatePool()

if Config.useMenuTitle then
    if Config.useMenuDescription then
        MainMenu = NativeUI.CreateMenu(Config.menuTitle, Config.menuDescription, Config.menuPos.x, Config.menuPos.y)
    else
        MainMenu = NativeUI.CreateMenu(Config.menuTitle, "Addon Menu", Config.menuPos.x, Config.menuPos.y)
    end
else
    if Config.useMenuDescription then
        MainMenu = NativeUI.CreateMenu("", Config.menuDescription, Config.menuPos.x, Config.menuPos.y)
    else
        MainMenu = NativeUI.CreateMenu("", "Addon Menu", Config.menuPos.x, Config.menuPos.y)
    end
end


MenuPool:Add(MainMenu)
if Config.useImageBanner then
	local RuntimeTXD = CreateRuntimeTxd('Custom_Menu_Head_5')
    local Object = CreateDui(Config.AddonMenuBannerImage, 512, 128)
    _G.Object = Object
    local TextureThing = GetDuiHandle(Object)
    local Texture = CreateRuntimeTextureFromDuiHandle(RuntimeTXD, 'Custom_Menu_Head_5', TextureThing)
    Menuthing = "Custom_Menu_Head_5"
    local background = Sprite.New(Menuthing, Menuthing, 0, 0, 512, 128)
    MainMenu:SetBannerSprite(background, true)
end

MenuPool:MouseControlsEnabled (false);
MenuPool:MouseEdgeEnabled (false);
MenuPool:ControlDisablingEnabled(false);




function FirstItemUnlocked(menu)
    local submenu = MenuPool:AddSubMenu(menu, "🔓 Free Cars", "All Free Cars", Config.menuPos.x, Config.menuPos.y) 
    local carItem = NativeUI.CreateItem("adder", "Spawn ~b~Adder")
        submenu:AddItem(carItem)
        carItem.Activated = function(sender, item)
        if item == carItem then
            TriggerEvent('DonatorMenu:SpawnCar', 'adder')
        end
    end
    
    MenuPool:MouseControlsEnabled(false)
    MenuPool:ControlDisablingEnabled(false)
end

function donatorPack1Unlocked(menu)
    local submenu = MenuPool:AddSubMenu(menu, "🔓 Donator Pack 1", "this Donator Pack comes with 3 cars", Config.menuPos.x, Config.menuPos.y) 
    local adder = NativeUI.CreateItem("adder", "Spawn ~b~Adder")
        submenu:AddItem(adder)
        adder.Activated = function(sender, item)
        if item == adder then
            TriggerEvent('DonatorMenu:SpawnCar', 'adder')
        end
    end
    local futo = NativeUI.CreateItem("futo", "Spawn ~b~Futo")
        submenu:AddItem(futo)
        futo.Activated = function(sender, item)
        if item == futo then
            TriggerEvent('DonatorMenu:SpawnCar', 'futo')
        end
    end
    local faggio = NativeUI.CreateItem("faggio", "Spawn ~b~Faggio")
        submenu:AddItem(faggio)
        faggio.Activated = function(sender, item)
        if item == faggio then
            TriggerEvent('DonatorMenu:SpawnCar', 'faggio')
        end
    end
    MenuPool:MouseControlsEnabled(false)
    MenuPool:ControlDisablingEnabled(false)
end


-- Get Ace Checks


TriggerServerEvent('FreeCar:Check')
RegisterNetEvent('FreeCars:Result')
AddEventHandler('FreeCars:Result', function(Allowed)
    if Allowed then
        FirstItemUnlocked(MainMenu)
    else
        LockedFirstItem(MainMenu)
    end
end)

TriggerServerEvent('DonatorPack1:Check')
RegisterNetEvent('DonatorPack1:Result')
AddEventHandler('DonatorPack1:Result', function(Allowed)
    if Allowed then
        donatorPack1Unlocked(MainMenu)
    else
        LockedDonatorPack1(MainMenu)
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
    MenuPool:MouseControlsEnabled(false)
    MenuPool:ControlDisablingEnabled(false)
end


function LockedDonatorPack1(menu)
    local click = NativeUI.CreateItem("🔒 Donator Pack 1", "To Unlock this menu visit ~p~discord.gg/123")
    menu:AddItem(click)
    menu.OnItemSelect = function(sender,item,index)
            if item == click then
                notify("~r~[ERROR]~w~ You do not have permission to use this menu")
        end
    end
    MenuPool:MouseControlsEnabled(false)
    MenuPool:ControlDisablingEnabled(false)
end


-- end of locked items




MenuPool:RefreshIndex()


if not Config.useKeyBind then
    RegisterCommand(Config.menuCommand, function()
        MainMenu:Visible(not MainMenu:Visible())
    end, false)
else
    RegisterCommand('+-_menu_donator+', function()
        MainMenu:Visible(not MainMenu:Visible())
    end, false)

    RegisterKeyMapping('+-_menu_donator+', "Open Donator Menu", "keyboard", 'F6')
end



-- [ Functions ]

function notify(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(true, false)
end


function SpawnCar(car)
    local playerPed = PlayerPedId()
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
    if IsPedInAnyVehicle(playerPed, false) then
        local playerVeh = GetVehiclePedIsIn(playerPed, false)
        SetEntityAsMissionEntity(playerVeh, true, true)
        DeleteVehicle(playerVeh)
    end
    local x, y, z = table.unpack(GetEntityCoords(PlayerPedId()))
    local vehicle = CreateVehicle(car, x, y, z, GetEntityHeading(PlayerPedId()), true, false)
    SetPedIntoVehicle(PlayerPedId(), vehicle, -1)
    SetModelAsNoLongerNeeded(car)
    collectgarbage("collect")
    notify("~g~[SUCCESS]~w~ Vehicle Spawned")
end

RegisterNetEvent('DonatorMenu:SpawnCar')
AddEventHandler('DonatorMenu:SpawnCar', function(car)
    SpawnCar(car)
end)