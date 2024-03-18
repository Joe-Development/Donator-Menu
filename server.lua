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




