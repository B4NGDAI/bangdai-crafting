Config = Config or {}
Config.Crafting = {}

Config.CraftingLocations = {
    {
        name = 'Crafting Valentine',
        coords = vector3(-369.4787, 796.1747, 116.3813),
        showblip = true,
        title = 'tools'
    },
    {
        name = 'Crafting Blackwater',
        coords = vector3(-878.3790, -1362.1334, 43.5280),
        showblip = true,
        title = 'weapon'
    }
}

Config.Crafting['tools'] = {
    ["Shovel"] = {
        name =  'shovel',
        craftingtime = 5000,
        ingredients = {
            [1] = { item = "iron", amount = 1 },
            [2] = { item = "wood", amount = 1 }
        },
        receive = "shovel"
    },
    ["Axe"] = {
        name = 'axe',
        craftingtime = 5000,
        ingredients = {
            [1] = { item = "steel", amount = 1 },
            [2] = { item = "wood", amount = 1 }
        },
        receive = "axe"
    }
}

Config.Crafting['weapon'] = {
    ["Weapon Revolver"] = {
        name = "revolver",
        craftingtime = 5000,
        ingredients = {
            [1] = { item = "iron", amount = 1 },
            [2] = { item = "wood", amount = 1 }
        },
        receive = "weapon_revolver_cattleman"
    }
}
