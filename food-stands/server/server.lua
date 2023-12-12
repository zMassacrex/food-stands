if Config.Framework == "ESX" then
    ESX = Config.FrameworkExport()
else
    QBCore = exports['qb-core']:GetCoreObject()
end

RegisterNetEvent('server:giveitems', function(item, amount, moneyamount, itemlabel)
    if Config.Framework == "ESX" then
        local xPlayer = ESX.GetPlayerFromId(source)

        xPlayer.addInventoryItem(item, amount)
        xPlayer.removeAccountMoney('money', moneyamount)

        xPlayer.showNotification('You have bought +1 '..itemlabel)
    else
        local Player = QBCore.Functions.GetPlayer(source)

        Player.Functions.AddItem(item, amount)
        Player.Functions.RemoveMoney('cash', moneyamount)

        TriggerClientEvent('QBCore:Notify', source, 'You have bought +1 '..itemlabel, 'info', 3000)
    end
end)

--Consumables
local food = {'fs_hotdog', 'fs_burger'}
local drink = {'fs_kurkakola', 'fs_water'}

CreateThread(function()
    if Config.Framework == "ESX" then
        for _, items in ipairs(food) do
            ESX.RegisterUsableItem(items, function(source, item)
                local xPlayer = ESX.GetPlayerFromId(source)
    
                if xPlayer.removeInventoryItem(item, 1) then
                    TriggerClientEvent('animation:eat:food-stand', source, item)
                end
            end)
        end
    
        for _, items in ipairs(drink) do
            ESX.RegisterUsableItem(items, function(source, item)
                local xPlayer = ESX.GetPlayerFromId(source)
    
                if xPlayer.removeInventoryItem(item, 1) then
                    TriggerClientEvent('animation:drink:food-stand', source, item)
                end
            end)
        end
    else
        for _, items in ipairs(food) do
            QBCore.Functions.CreateUseableItem(items , function(source, item)
                local Player = QBCore.Functions.GetPlayer(source)

                if Player.Functions.RemoveItem(item.name, 1, item.slot) then
                    TriggerClientEvent('animation:eat:food-stand', source, item.name)
                end
            end)
        end
    
        for _, items in ipairs(drink) do
            QBCore.Functions.CreateUseableItem(items , function(source, item)
                local Player = QBCore.Functions.GetPlayer(source)
                
                if Player.Functions.RemoveItem(item.name, 1, item.slot) then
                    TriggerClientEvent('animation:drink:food-stand', source, item.name)
                end
            end)
        end
    end
end)