local RSGCore = exports['rsg-core']:GetCoreObject()

local function RegAnim()
    local dict = "mech_inventory@crafting@fallbacks"
    lib.requestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Wait(10)
    end
    local ped = PlayerPedId()
    TaskPlayAnim(ped, dict, "full_craft_and_stow", 1.0, -1.0, -1, 1, 0, false, false, false)
end

CreateThread(function()
    for _, v in pairs(Config.CraftingLocations) do
        exports['rsg-target']:AddCircleZone(v.name, v.coords, 1, {
            name = v.name,
            debugPoly = false,
        }, {
            options = {
                {
                    icon = "fas fa-gear",
                    label = "Crafting",
                    action = function()
                        local title = v.title
                        TriggerEvent("bangdai-crafting:client:craftingMenu", title)
                    end,
                },
            },
            distance = 2.0,
        })
        if not v.showblip then return end
        local CraftingBlip = N_0x554d9d53f696d002(1664425300, v.coords)
        SetBlipSprite(CraftingBlip, -758970771, 52)
        SetBlipScale(CraftingBlip, 0.2)
    end
end)


RegisterNetEvent('bangdai-crafting:client:craftingMenu', function(title)
    local crafting = {}
    local metadata = {}

    local craftingCategory = Config.Crafting[title]

    if craftingCategory then
        for k, v in pairs(craftingCategory) do
            metadata = {}

            for i, ingredient in ipairs(v.ingredients) do
                metadata[#metadata + 1] = {
                    label = RSGCore.Shared.Items[ingredient.item].label,
                    value = ingredient.amount
                }
            end

            crafting[#crafting + 1] = {
                title = k,
                metadata = metadata,
                event = 'bangdai-crafting:client:checkingredients',
                args = {
                    name = v.name,
                    item = k,
                    craftingtime = v.craftingtime,
                    receive = v.receive,
                    ingredients = v.ingredients
                }
            }
        end

        lib.registerContext({
            id = 'bangdai:crafting',
            title = 'Crafting Menu',
            options = crafting
        })
        lib.showContext('bangdai:crafting')
    else
        print("Invalid crafting category:", title)
    end
end)


RegisterNetEvent('bangdai-crafting:client:checkingredients', function(data)
    local input = lib.inputDialog('Crafting Amount', {
        { type = 'input', label = 'Amount', required = true, min = 1, max = 50 },
    })

    if not input then return end

    local jumlah = tonumber(input[1])

    if jumlah then
        RSGCore.Functions.TriggerCallback('bangdai-crafting:server:checkingredients', function(hasRequired)
            if (hasRequired) then
                if Config.Debug == true then
                    print("passed")
                end
                TriggerEvent('bangdai-crafting:crafting', data.name, data.item, tonumber(data.craftingtime), data.receive, jumlah, data.ingredients)
            else
                if Config.Debug == true then
                    print("failed")
                end
                return
            end
        end, data.ingredients, jumlah)
    end
end)


RegisterNetEvent('bangdai-crafting:crafting', function(name, item, craftingtime, receive, jumlah, ingredients)
    local ped = PlayerPedId()
    RegAnim()
    RSGCore.Functions.Progressbar('crafting', 'crafting'..name, craftingtime, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerServerEvent('bangdai-crafting:server:finishcrafting', ingredients, receive, jumlah)
        ClearPedTasks(ped)
    end)
end)
