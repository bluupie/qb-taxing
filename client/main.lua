local QBCore = exports['qb-core']:GetCoreObject()

TriggerEvent('QBCore:getObject', function(obj) QBCore = obj end)

Citizen.CreateThread(function()
	while true do
		Wait(4*675000) -- change time of payment // current time is 45 minutes
		TriggerServerEvent('qb-taxing:server:paytaxes')
	end
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    TriggerServerEvent("qb-taxing:server:Display") 
end)

RegisterCommand('bracket', function()
    TriggerServerEvent("qb-taxing:server:Display")    
end)

RegisterNetEvent('qb-taxing:client:SendTaxMail')
AddEventHandler('qb-taxing:client:SendTaxMail', function(amount)
	--print("test")
    --SetTimeout(math.random(2500, 4000), function()
        -- local gender = "Mr."
        -- if QBCore.Functions.GetPlayerData().charinfo.gender == 1 then
        --     gender = "Mrs."
        -- end
        -- local charinfo = QBCore.Functions.GetPlayerData().charinfo
        TriggerServerEvent('qb-phone:server:sendNewMail', {
            sender = "Tax Comittee",
            subject = "Tax Withdrawls",
            message = ",<br /><br />You have received an email detailing the costs of the last tax withdrawl.<br />The final costs have become: <strong>$" ..amount.. "</strong><br /><br />Thank you for your contributions to the city",
            button = {}
        })
		--print("test")
    end)
