Config = {}

-- IMPORTANT REQUIRES QB-TARGET OR OX-TARGET

Config.Framework = "QB-Core" -- "ESX" / "QB-Core"
Config.FrameworkExport = function()
    if Config.Framework == "ESX" then
        return exports['es_extended']:getSharedObject()
    else
        return exports['qb-core']:GetCoreObject()
    end
end

Config.HotdogsStand = {
    -- Hotdogs Stand
    "prop_hotdogstand_01"
}

Config.BurgerStand = {
    -- Burger Stand
    "prop_burgerstand_01"
}

Config.ItemsStandSell = {
    -- Hotdogs Stand
    hotdog = {
        item = 'fs_hotdog', -- you can change the item if you want to use one you have
        label = 'Hotdog',
        price = 2
    },
    hcola = {
        item = 'fs_kurkakola', -- you can change the item if you want to use one you have
        label = 'Kurka Kola',
        price = 1
    },
    hwater = {
        item = 'fs_water', -- you can change the item if you want to use one you have
        label = 'Bottle Water',
        price = 1
    },

    -- Burger Stand
    burger = {
        item = 'fs_burger', -- you can change the item if you want to use one you have
        label = 'Burger',
        price = 2
    },
    bcola = {
        item = 'fs_kurkakola', -- you can change the item if you want to use one you have
        label = 'Kurka Kola',
        price = 1
    },
    bwater = {
        item = 'fs_water', -- you can change the item if you want to use one you have
        label = 'Bottle Water',
        price = 1
    },
}