local RSGCore = exports['rsg-core']:GetCoreObject()

RSGCore.Functions.CreateCallback('rsg-crafting:server:checkingredients', function(source, cb, ingredients, jumlah)
    local src = source
    local icheck = 0
    local Player = RSGCore.Functions.GetPlayer(src)
    
    for k, v in pairs(ingredients) do
        if Player.Functions.GetItemByName(v.item) and Player.Functions.GetItemByName(v.item).amount >= v.amount * jumlah then
            icheck = icheck + 1
            if icheck == #ingredients then
                cb(true)
            end
        else
            TriggerClientEvent('RSGCore:Notify', src, "you don't have enough required item: " .. v.item, 'error')
            cb(false)
            return
        end
    end
end)

-- finish cooking
RegisterServerEvent('rsg-crafting:server:finishcrafting')
AddEventHandler('rsg-crafting:server:finishcrafting', function(ingredients, receive, jumlah)
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
    
    Player.Functions.AddItem(receive, jumlah) -- Hanya menambahkan 1 item yang dihasilkan
    TriggerClientEvent('inventory:client:ItemBox', src, RSGCore.Shared.Items[receive], "add")
    TriggerClientEvent('RSGCore:Notify', src, "Pembuatan selesai", 'success')
end)
