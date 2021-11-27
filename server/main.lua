local QBCore = exports['qb-core']:GetCoreObject()

local flyin = Config.flyin -- minimum bank value to be taxed in this bracket
local poor = Config.poor -- minimum bank value to be taxed in this bracket
local notbad = Config.notbad -- mininum bank value to be taxed in this bracket
local medium = Config.medium -- mininum bank value to be taxed in this bracket
local rich = Config.rich -- mininum bank value to be taxed in this bracket
local toorich = Config.toorich -- mininum bank value to be taxed in this bracket
local percentage = {}


--     flyinperc = 0,
--     poorperc = 1,
--     notbadperc = 2,
--     mediumperc = 4,
--     richperc = 6,
--     toorichperc = 8,


RegisterServerEvent("qb-taxing:server:Display")
AddEventHandler("qb-taxing:server:Display", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local bankamount = Player.PlayerData.money['bank']
    local bracket = {}
    if bankamount > flyin and bankamount <= poor then
        bracket = flyin
        percentage = Config.TaxBracket1
    elseif bankamount > poor and bankamount <= notbad then
        bracket = poor
        percentage = Config.TaxBracket2
    elseif bankamount > notbad and bankamount <= medium then
        bracket = notbad
        percentage = Config.TaxBracket3
    elseif bankamount > medium and bankamount <= rich then
        bracket = medium
        percentage = Config.TaxBracket4
    elseif bankamount > rich and bankamount <= toorich then
        bracket = rich
        percentage = Config.TaxBracket5
    elseif bankamount > toorich then
        bracket = toorich
        percentage = Config.TaxBracket6
    end
    TriggerClientEvent("QBCore:Notify", src, "Your Current Tax Bracket is $" ..bracket.. " Tax Percentage is " ..percentage.. "!")
end)

RegisterServerEvent('qb-taxing:server:paytaxes')
AddEventHandler('qb-taxing:server:paytaxes', function(amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local bankamount = Player.PlayerData.money.bank
    local tax = (bankamount / 100 * Config.TaxBracket1) 
    local tax1 = (bankamount / 100 * Config.TaxBracket2) 
    local tax2 = (bankamount / 100 * Config.TaxBracket3) 
    local tax3 = (bankamount / 100 * Config.TaxBracket4) 
    local tax4 = (bankamount / 100 * Config.TaxBracket5) 
    
    if bankamount <= poor then
      TriggerClientEvent('QBCore:Notify', source, "You do not have enough money to be taxed" , "error")
      TriggerEvent("qb-log:server:CreateLog", Config.Logs, "Taxes", "red", "**"..GetPlayerName(src) .. "** has paid $"..tax.."in taxes.")
    elseif bankamount > poor and bankamount <= notbad then
        Player.Functions.RemoveMoney('bank', tax, "Taxes paid")
        TriggerEvent("qb-bossmenu:server:addAccountMoney", Config.Job, tax)
        TriggerClientEvent("qb-taxing:client:SendTaxMail", src, tax)
        TriggerEvent("qb-log:server:CreateLog", Config.Logs, "Taxes", "red", "**"..GetPlayerName(src) .. "** has paid $"..tax1.."in taxes.")

    elseif bankamount > notbad and bankamount <= medium then
        Player.Functions.RemoveMoney('bank', tax1, "Taxes paid")
        TriggerEvent("qb-bossmenu:server:addAccountMoney", Config.Job, tax1)
        TriggerClientEvent("qb-taxing:client:SendTaxMail", src, tax1)
        TriggerEvent("qb-log:server:CreateLog", Config.Logs, "Taxes", "red", "**"..GetPlayerName(src) .. "** has paid $"..tax1.."in taxes.")
    
    elseif bankamount > medium and bankamount <= rich then
        Player.Functions.RemoveMoney('bank', tax2, "Taxes paid")
        TriggerEvent("qb-bossmenu:server:addAccountMoney", Config.Job, tax2)
        TriggerClientEvent("qb-taxing:client:SendTaxMail", src, tax2)
        TriggerEvent("qb-log:server:CreateLog", Config.Logs, "Taxes", "red", "**"..GetPlayerName(src) .. "** has paid $"..tax2.."in taxes.")

    elseif bankamount > rich and bankamount <= toorich then
        Player.Functions.RemoveMoney('bank', tax3, "Taxes paid")
        TriggerEvent("qb-bossmenu:server:addAccountMoney", Config.Job, tax3)
        TriggerClientEvent("qb-taxing:client:SendTaxMail", src, tax3)
        TriggerEvent("qb-log:server:CreateLog", Config.Logs, "Taxes", "red", "**"..GetPlayerName(src) .. "** has paid $"..tax3.."in taxes.")
    
    elseif bankamount > toorich then
        Player.Functions.RemoveMoney('bank', tax4, "Taxes paid")
        TriggerEvent("qb-bossmenu:server:addAccountMoney", Config.Job, tax4)
        TriggerClientEvent("qb-taxing:client:SendTaxMail", src, tax4)
        TriggerEvent("qb-log:server:CreateLog", Config.Logs, "Taxes", "red", "**"..GetPlayerName(src) .. "** has paid $"..tax4.."in taxes.")
    end
end)