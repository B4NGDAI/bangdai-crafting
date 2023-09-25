local RSGCore = exports['rsg-core']:GetCoreObject()

lib.callback.register('bangdai-crafting:server:checkingredients', function(source, ingredients, jumlah)
    local Player = RSGCore.Functions.GetPlayer(source)
    local icheck = 0

    if not Player then
        return false
    end

    for _, v in pairs(ingredients) do
        local requiredAmount = v.amount * jumlah
        local playerItem = Player.Functions.GetItemByName(v.item)

        if not playerItem or playerItem.amount < requiredAmount then
            return false
        else
            icheck = icheck + 1
        end
    end

    if icheck == #ingredients then
        return true
    else
        return false
    end
end)

-- finish cooking
RegisterServerEvent('bangdai-crafting:server:finishcrafting')
AddEventHandler('bangdai-crafting:server:finishcrafting', function(ingredients, receive, jumlah)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    
    for k, v in pairs(ingredients) do
        if Config.Debug == true then
            print(v.item)
            print(v.amount)
        end
        local requiredAmount = v.amount * jumlah
        Player.Functions.RemoveItem(v.item, requiredAmount)
        TriggerClientEvent('inventory:client:ItemBox', src, RSGCore.Shared.Items[v.item], "remove")
    end
    
    Player.Functions.AddItem(receive, jumlah)
    TriggerClientEvent('inventory:client:ItemBox', src, RSGCore.Shared.Items[receive], "add")
    TriggerClientEvent('RSGCore:Notify', src, "Crafting Success", 'success')
end)
