local RSGCore = exports['rsg-core']:GetCoreObject()

Citizen.CreateThread(function()
    for _, v in pairs(Config.CraftingLocations) do
        exports['rsg-target']:AddCircleZone(v.name, v.coords, 1, {
            name = v.name,
            debugPoly = false,
          }, {
            options = {
              {
                type = "client",
                event = 'rsg-crafting:client:craftingMenu',
                icon = "fas fa-gear",
                label = "Crafting",
              },
            },
            distance = 2.0,
          })
        if v.showblip == true then
            local CraftingBlip = N_0x554d9d53f696d002(1664425300, v.coords)
            SetBlipSprite(CraftingBlip, -758970771, 52)
            SetBlipScale(CraftingBlip, 0.2)
        end
    end
end)

RegisterNetEvent('rsg-crafting:client:craftingMenu', function()
    crafting = {}
    for k, v in pairs(Config.CraftingIngrident) do
        local item = {}
        local text = ""
        for k, v in pairs(v.ingredients) do
            text = text .. " " .. RSGCore.Shared.Items[v.item].label .. ":" .. v.amount .. " x " .. ".."
        end
        crafting[#crafting + 1] = {

            title = k,
            description = text,
            event = 'rsg-crafting:client:checkingredients',
            args = {
                name = v.name,
                item = k,
                crafttime = v.crafttime,
                receive = v.receive
            }
        }
    end
    lib.registerContext({
        id = 'rsg:crafting',
        title = 'Crafting Menu',
        options = crafting
    })
    lib.showContext('rsg:crafting')
end)

RegisterNetEvent('rsg-crafting:client:checkingredients', function(data)
    RSGCore.Functions.TriggerCallback('rsg-crafting:server:checkingredients', function(hasRequired)
    if (hasRequired) then
        if Config.Debug == true then
            print("passed")
        end
        TriggerEvent('rsg-crafting:crafting', data.name, data.item, tonumber(data.craftingtime), data.receive)
    else
        if Config.Debug == true then
            print("failed")
        end
        return
    end
    end, Config.CraftingIngrident[data.item].ingredients)
end)

RegisterNetEvent('rsg-crafting:crafting', function(name, item, craftingtime, receive)
    local ingredients = Config.CraftingIngrident[item].ingredients
    local ped = PlayerPedId()
    TaskStartScenarioInPlace(ped, GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), craftingtime, true, false, false, false)
    RSGCore.Functions.Progressbar('crafting', 'crafting'..name, craftingtime, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerServerEvent('rsg-crafting:server:finishcrafting', ingredients, receive)
        ClearPedTasks(ped)
    end)
end)