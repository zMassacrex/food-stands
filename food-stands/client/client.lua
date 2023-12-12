if Config.Framework == "ESX" then
    ESX = Config.FrameworkExport()
else
    QBCore = exports['qb-core']:GetCoreObject()
end

CreateThread(function()
    for k,v in pairs(Config.HotdogsStand) do

        exports['qb-target']:AddTargetModel(GetHashKey(v), {
            name = "HotDogsStand",
            options = {
                {
                    icon = "fa-solid fa-hotdog",
                    label = "Hotdogs Stand",
                    action = function()
                        HotDogs()
                    end,
                },
            },
            distance = 2.0,
        })
    end

    for k,v in pairs(Config.BurgerStand) do

        exports['qb-target']:AddTargetModel(GetHashKey(v), {
            name = "BurgerStand",
            options = {
                {
                    icon = "fa-solid fa-burger",
                    label = "Burger Stand",
                    action = function()
                        Burgers()
                    end,
                },
            },
            distance = 2.0,
        })
    end
end)

function HotDogs()
    lib.registerContext({
        id = 'hotdog_menu',
        title = 'Hotdog Menu',
        options = {
            {
                title = 'Hotdog',
                description = 'delicious hotdog',
                icon = 'fa-solid fa-hotdog',
                onSelect = function()
                    TriggerServerEvent('server:giveitems', Config.ItemsStandSell.hotdog.item, 1, Config.ItemsStandSell.hotdog.price, Config.ItemsStandSell.hotdog.label)
                end,
                metadata = {
                    {label = 'Price', value = '$'..Config.ItemsStandSell.hotdog.price},
                },
            },
            {
                title = 'Cola',
                description = 'refreshing soft drink',
                icon = 'fa-solid fa-bottle-water',
                onSelect = function()
                    TriggerServerEvent('server:giveitems', Config.ItemsStandSell.hcola.item, 1, Config.ItemsStandSell.hcola.price, Config.ItemsStandSell.hcola.label)
                end,
                metadata = {
                    {label = 'Price', value = '$'..Config.ItemsStandSell.hcola.price},
                },
            },
            {
                title = 'Water',
                description = 'refreshing soft drink',
                icon = 'fa-solid fa-bottle-water',
                onSelect = function()
                   TriggerServerEvent('server:giveitems', Config.ItemsStandSell.hwater.item, 1, Config.ItemsStandSell.hwater.price, Config.ItemsStandSell.hwater.label)
                end,
                metadata = {
                    {label = 'Price', value = '$'..Config.ItemsStandSell.hwater.price},
                },
            },
        }
    })

    lib.showContext('hotdog_menu')
end

function Burgers()
    lib.registerContext({
         id = 'burger_menu',
         title = 'Burgers Menu',
         options = {
             {
                 title = 'Burger',
                 description = 'delicious burger',
                 icon = 'fa-solid fa-burger',
                 onSelect = function()
                    TriggerServerEvent('server:giveitems', Config.ItemsStandSell.burger.item, 1, Config.ItemsStandSell.burger.price, Config.ItemsStandSell.burger.label)
                 end,
                 metadata = {
                     {label = 'Price', value = '$'..Config.ItemsStandSell.burger.price},
                 },
             },
             {
                 title = 'Cola',
                 description = 'refreshing soft drink',
                 icon = 'fa-solid fa-bottle-water',
                 onSelect = function()
                    TriggerServerEvent('server:giveitems', Config.ItemsStandSell.bcola.item, 1, Config.ItemsStandSell.bcola.price, Config.ItemsStandSell.bcola.label)
                 end,
                 metadata = {
                     {label = 'Price', value = '$'..Config.ItemsStandSell.bcola.price},
                 },
             },
             {
                 title = 'Water',
                 description = 'refreshing soft drink',
                 icon = 'fa-solid fa-bottle-water',
                 onSelect = function()
                    TriggerServerEvent('server:giveitems', Config.ItemsStandSell.bwater.item, 1, Config.ItemsStandSell.bwater.price, Config.ItemsStandSell.bwater.label)
                 end,
                 metadata = {
                     {label = 'Price', value = '$'..Config.ItemsStandSell.bwater.price},
                 },
             },
         }
     })
 
     lib.showContext('burger_menu')
 end

 RegisterNetEvent('animation:eat:food-stand', function(item)
    if item == 'fs_hotdog' then 
        ExecuteCommand('e hotdog')
    elseif item == 'fs_burger' then
        ExecuteCommand('e burger')
    end

    if Config.Framework == "ESX" then
        if lib.progressBar({
            duration = 6000,
            label = 'Eating..',
            useWhileDead = false,
            canCancel = true,
            disable = {
                car = true,
            },
        }) then 
            ExecuteCommand("e c")
            TriggerEvent('esx_status:add', 'hunger', 300000)
        end
    else
        QBCore.Functions.Progressbar("eat_something", "Eating..", 6000, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            ExecuteCommand("e c")
            TriggerServerEvent("consumables:server:addHunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + math.random(35, 54))
            TriggerServerEvent('hud:server:RelieveStress', math.random(2, 4))
        end)
    end
 end)

 RegisterNetEvent('animation:drink:food-stand', function(item)
    if item == 'fs_kurkakola' then
        ExecuteCommand('e soda')
    elseif item == 'fs_water' then
        ExecuteCommand('e water')
    end

    if Config.Framework == "ESX" then
        if lib.progressBar({
            duration = 6000,
            label = 'Drinking..',
            useWhileDead = false,
            canCancel = true,
            disable = {
                car = true,
            },
        }) then 
            ExecuteCommand("e c")
            TriggerEvent('esx_status:add', 'thirst', 300000)
        end
    else
        QBCore.Functions.Progressbar("eat_something", "Drinking..", 6000, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            ExecuteCommand("e c")
            TriggerServerEvent("consumables:server:addThirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + math.random(35, 54))
            TriggerServerEvent('hud:server:RelieveStress', math.random(2, 4))
        end)
    end
 end)