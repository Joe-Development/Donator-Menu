-- Simple Perm Checks
RegisterServerEvent('FreeCar:Check')
AddEventHandler('FreeCar:Check', function()
    if IsPlayerAceAllowed(source, Config.aces.freeCarPack) then
		TriggerClientEvent('FreeCars:Result', source, true)
	else
		TriggerClientEvent('FreeCars:Result', source, false)
	end
end)

RegisterServerEvent('DonatorPack1:Check')
AddEventHandler('DonatorPack1:Check', function()
    if IsPlayerAceAllowed(source, Config.aces.donatorPack1) then
		TriggerClientEvent('DonatorPack1:Result', source, true)
	else
		TriggerClientEvent('DonatorPack1:Result', source, false)
	end
end)















--
CreateThread(function()
    
    if Config.CheckForUpdates then
        -- https://github.com/Blumlaut/FiveM-Resource-Version-Check-Thing/
        updatePath = "/Joe-Development/Donator-Menu" -- your git user/repo path
        resourceName = "^6chroma-enginesoundmenu" -- the resource name
        local function checkVersion(err,responseText, headers)
            curVersion = LoadResourceFile(GetCurrentResourceName(), "version/version.txt") -- make sure the "version" file actually exists in your resource root!
            if curVersion ~= responseText and tonumber(curVersion) < tonumber(responseText) then
                print("\n"..resourceName.." ^1is outdated, please update it from:\n^3https://github.com/Joe-Development/Donator-Menu/releases/latest\n^1For support or issues, please visit ^3https://discord.gg/sNHg4X7xt2^7")
            else
                print("\n"..resourceName.." ^2is up to date, and has been loaded - enjoy!\nFor support or issues, please visit ^3https://discord.gg/sNHg4X7xt2^7")
            end
        end
        
        PerformHttpRequest("https://raw.githubusercontent.com"..updatePath.."/main/Donator-Menu/version/version.txt", checkVersion, "GET")

    else
        print("\n^6Doantor-Menu ^2has been loaded - enjoy! ^1[VERSION CHECK DISABLED]\n^2For support or issues, please visit ^3https://discord.gg/sNHg4X7xt2^7")
    end

end)