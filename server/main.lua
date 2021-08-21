RegisterServerEvent('qb-taxes')
AddEventHandler('qb-taxes', function(amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local bankamount = Player.PlayerData.money.bank
    local poor = 10000
    local notbad = 100000 -- mininum bank value to be taxed in this bracket
    local medium = 300000 -- mininum bank value to be taxed in this bracket
    local rich = 700000 -- mininum bank value to be taxed in this bracket
    local toorich = 1000000 -- mininum bank value to be taxed in this bracket
    local tax = (bankamount / 100 * 1) -- change for percentage/tax bracket
    local tax1 = (bankamount / 100 * 2) -- change for percentage/tax bracket
    local tax2 = (bankamount / 100 * 4) -- change for percentage/tax bracket
    local tax3 = (bankamount / 100 * 6) -- change for percentage/tax bracket
    local tax4 = (bankamount / 100 * 8) -- change for percentage/tax bracket
    
    if bankamount <= poor then
      --Player.Functions.RemoveMoney('bank', tax, "Taxes paid")
      TriggerClientEvent('QBCore:Notify', source, "You do not have enough money to be taxed" , "error")
      --TriggerEvent("qb-log:server:CreateLog", "banking", "Taxes", "red", "**"..GetPlayerName(src) .. "** has paid $"..tax.."in taxes.")
    elseif bankamount > poor and bankamount <= notbad then
        Player.Functions.RemoveMoney('bank', tax, "Taxes paid")
        --TriggerClientEvent('QBCore:Notify', source, "You have paid $" ..tax1.. " your taxes off" , "success")
        TriggerClientEvent("qb-taxing:client:SendTaxMail", src, tax)
        TriggerEvent("qb-log:server:CreateLog", "banking", "Taxes", "red", "**"..GetPlayerName(src) .. "** has paid $"..tax1.."in taxes.")

    elseif bankamount > notbad and bankamount <= medium then
        Player.Functions.RemoveMoney('bank', tax1, "Taxes paid")
        TriggerClientEvent("qb-taxing:client:SendTaxMail", src, tax1)
        --TriggerClientEvent('QBCore:Notify', source, "You have paid $" ..tax1.. " your taxes off" , "success")
        TriggerEvent("qb-log:server:CreateLog", "banking", "Taxes", "red", "**"..GetPlayerName(src) .. "** has paid $"..tax1.."in taxes.")
    
    elseif bankamount > medium and bankamount <= rich then
        Player.Functions.RemoveMoney('bank', tax2, "Taxes paid")
        TriggerClientEvent("qb-taxing:client:SendTaxMail", src, tax2)
        --TriggerClientEvent('QBCore:Notify', source, "You have paid $" ..tax2.. " your taxes off" , "success")
        TriggerEvent("qb-log:server:CreateLog", "banking", "Taxes", "red", "**"..GetPlayerName(src) .. "** has paid $"..tax2.."in taxes.")

    elseif bankamount > rich and bankamount <= toorich then
        TriggerClientEvent("qb-taxing:client:SendTaxMail", src, tax3)
        --TriggerClientEvent('QBCore:Notify', source, "You have paid $" ..tax2.. " your taxes off" , "success")
        TriggerEvent("qb-log:server:CreateLog", "banking", "Taxes", "red", "**"..GetPlayerName(src) .. "** has paid $"..tax3.."in taxes.")
    
    elseif bankamount > toorich then
        Player.Functions.RemoveMoney('bank', tax4, "Taxes paid")
        TriggerClientEvent("qb-taxing:client:SendTaxMail", src, tax4)
        --TriggerClientEvent('QBCore:Notify', source, "You have paid $" ..tax3.. " your taxes off" , "success")
        TriggerEvent("qb-log:server:CreateLog", "banking", "Taxes", "red", "**"..GetPlayerName(src) .. "** has paid $"..tax4.."in taxes.")
    end
end)