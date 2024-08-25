if not Framework.QBCore() then return end

local QBCore = exports['qb-core']:GetCoreObject()

function Framework.Salary(src)
    local Player = QBCore.Functions.GetPlayer(src)
    local money = Config.Trash.payments
    local amount = Config.Trash.recyclablematerial.amount
    -- if u want use psbuff
    -- local buff = exports['ps-buffs']:HasBuff(Player.PlayerData.citizenid, "lucky")
    -- if buff then
    --     money = math.floor(money * 1.5)
    --     amount = math.floor(amount * Config.buffMatsMultiplier)
    -- end
    Player.Functions.AddMoney('cash', money, 'sanitation')
    if Config.OxInventory then
        exports.ox_inventory:AddItem(src, Config.Trash.recyclablematerial.item, amount, {quality = 10})
    else
        if exports['qb-inventory']:AddItem(src, Config.Trash.recyclablematerial.item, amount, false, {quality = 10}) then
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items[Config.Trash.recyclablematerial.item], 'add', amount)
        end
    end
    -- if u want to add rep for job
    -- local x = Player.Functions.GetRep('sanitation')
    -- Player.Functions.AddRep('sanitation', x + 1)
end

function Framework.AddItem(src, item, amount)
    if Config.OxInventory then
        exports.ox_inventory:AddItem(src, item, amount)
    else
        if exports['qb-inventory']:AddItem(src, item, amount) then
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items[item], 'add', amount)
        end
    end
end

function Framework.RemoveItem(src, item, amount)
    if Config.OxInventory then
        return exports.ox_inventory:RemoveItem(src, item, amount)
    else
        if exports['qb-inventory']:RemoveItem(src, item, amount) then
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items[item], 'remove', amount)
            return true
        end
        return false
    end
end

function Notification(src, msg, type , time)
    TriggerClientEvent('QBCore:Notify', src, msg, type, time)
end