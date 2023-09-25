Config = Config or {}
Config.Crafting = {}

Config.skillcheck = true -- set false if u want use progressbar

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
    },
    -- example for adding new location and new menu
    -- {
    --     name = 'Crafting anywhere',
    --     coords = vector3(-878.3790, -1362.1334, 43.5280),
    --     showblip = true,
    --     title = 'any'
    -- },
}

Config.Crafting['tools'] = {
    ["Shovel"] = {
        name = 'shovel',
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
    },
    ['goldsmelt'] = {
        name = "goldsmelt",
        craftingtime = 10000,
        category = 'watch',
        ingredients = {
            [2] = { item = 'bucket', amount = 2 },
            [3] = { item = 'goldpan', amount = 1 },
            [4] = { item = 'needles', amount = 4 },
            [1] = { item = 'coal', amount = 10 },
        },
        receive = 'goldsmelt'
    },
    ['lockpick'] = {
        name = "lockpick",
        craftingtime = 6000,
        category = 'watch',
        ingredients = {
            [2] = { item = 'steel', amount = 2 },
            [3] = { item = 'wood', amount = 1 },
        },
        receive = 'lockpick'
    },
    ['moonshinekit'] = {
        name = "moonshinekit",
        craftingtime = 10000,
        category = 'watch',
        ingredients = {
            [2] = { item = 'bucket', amount = 2 },
            [3] = { item = 'goldpan', amount = 2 },
            [4] = { item = 'needles', amount = 5 },
            [1] = { item = 'coal', amount = 5 },
        },
        receive = 'moonshinekit'
    },
    ['phonograph'] = {
        name = "phonograph",
        craftingtime = 10000,
        category = 'watch',
        ingredients = {
            [2] = { item = 'corneta', amount = 1 },
            [3] = { item = 'box', amount = 1 },
            [1] = { item = 'needles', amount = 5 },
        },
        receive = 'phonograph'
    },
    ['pocket_watch_platinium'] = {
        name = "pocket_watch_platinium",
        craftingtime = 10000,
        category = 'watch',
        ingredients = {
            [2] = { item = 'bezel', amount = 1 },
            [3] = { item = 'glass', amount = 1 },
            [4] = { item = 'gasket', amount = 1 },
            [5] = { item = 'needles', amount = 2 },
            [6] = { item = 'goldbar', amount = 1 },
            [1] = { item = 'silverbar', amount = 1 },
        },
        receive = 'pocket_watch_platinium'
    },
    ['pocket_watch_gold'] = {
        name = "pocket_watch_gold",
        craftingtime = 10000,
        category = 'watch',
        ingredients = {
            [2] = { item = 'bezel', amount = 1 },
            [3] = { item = 'glass', amount = 1 },
            [4] = { item = 'gasket', amount = 1 },
            [5] = { item = 'needles', amount = 2 },
            [1] = { item = 'goldbar', amount = 1 },
        },
        receive = 'pocket_watch_gold'
    },
    ['pocket_watch_silver'] = {
        name = "pocket_watch_silver",
        craftingtime = 10000,
        category = 'watch',
        ingredients = {
            [2] = { item = 'bezel', amount = 1 },
            [3] = { item = 'glass', amount = 1 },
            [4] = { item = 'gasket', amount = 1 },
            [5] = { item = 'needles', amount = 2 },
            [1] = { item = 'silverbar', amount = 1 },
        },
        receive = 'pocket_watch_silver'
    },
    ['weapon_kit_binoculars'] = {
        name = "weapon_kit_binoculars",
        craftingtime = 10000,
        category = 'watch',
        ingredients = {
            [2] = { item = 'bezel', amount = 4 },
            [3] = { item = 'glass', amount = 4 },
            [4] = { item = 'gasket', amount = 1 },
            [1] = { item = 'needles', amount = 2 },
        },
        receive = 'weapon_kit_binoculars'
    },
    ['weapon_kit_binoculars_improved'] = {
        name = "weapon_kit_binoculars_improved",
        craftingtime = 10000,
        category = 'watch',
        ingredients = {
            [2] = { item = 'bezel', amount = 4 },
            [3] = { item = 'glass', amount = 4 },
            [4] = { item = 'gasket', amount = 2 },
            [1] = { item = 'needles', amount = 2 },
        },
        receive = 'weapon_kit_binoculars_improved'
    },
    ['weapon_kit_camera'] = {
        name = "weapon_kit_camera",
        craftingtime = 10000,
        category = 'watch',
        ingredients = {
            [2] = { item = 'bezel', amount = 3 },
            [3] = { item = 'glass', amount = 2 },
            [4] = { item = 'gasket', amount = 2 },
            [5] = { item = 'needles', amount = 2 },
            [1] = { item = 'box', amount = 1 },
        },
        receive = 'weapon_kit_camera'
    },
    ['weapon_kit_camera_advanced'] = {
        name = "weapon_kit_camera_advanced",
        craftingtime = 10000,
        category = 'watch',
        ingredients = {
            [2] = { item = 'bezel', amount = 5 },
            [3] = { item = 'glass', amount = 2 },
            [4] = { item = 'gasket', amount = 3 },
            [5] = { item = 'needles', amount = 2 },
            [1] = { item = 'box', amount = 1 },
        },
        receive = 'weapon_kit_camera_advanced'
    },
    ['weapon_melee_electric_lantern'] = {
        name = "weapon_melee_electric_lantern",
        craftingtime = 10000,
        category = 'watch',
        ingredients = {
            [2] = { item = 'bezel', amount = 1 },
            [3] = { item = 'glass', amount = 2 },
            [4] = { item = 'needles', amount = 5 },
            [1] = { item = 'bucket', amount = 1 },
        },
        receive = 'weapon_melee_electric_lantern'
    },
    ['weapon_melee_lantern'] = {
        name = "weapon_melee_lantern",
        craftingtime = 10000,
        category = 'watch',
        ingredients = {
            [2] = { item = 'bezel', amount = 2 },
            [3] = { item = 'glass', amount = 2 },
            [4] = { item = 'smallmcandle', amount = 2 },
            [5] = { item = 'needles', amount = 1 },
            [1] = { item = 'bucket', amount = 2 },
        },
        receive = 'weapon_melee_electric_lantern'
    },
    ['weapon_melee_lantern_halloween'] = {
        name = "weapon_melee_lantern_halloween",
        craftingtime = 10000,
        category = 'watch',
        ingredients = {
            [2] = { item = 'bezel', amount = 2 },
            [3] = { item = 'glass', amount = 2 },
            [4] = { item = 'candle', amount = 2 },
            [5] = { item = 'needles', amount = 1 },
            [1] = { item = 'bucket', amount = 2 },
        },
        receive = 'weapon_melee_lantern_halloween'
    },
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

-- example for adding new
-- Config.Crafting['any'] = {
--     ["any"] = {
--         name = "any",
--         craftingtime = 5000,
--         ingredients = {
--             [1] = { item = "iron", amount = 1 },
--             [2] = { item = "wood", amount = 1 }
--         },
--         receive = "any"
--     }
-- }
