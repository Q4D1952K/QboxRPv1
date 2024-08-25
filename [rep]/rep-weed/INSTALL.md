Made by Rep Scripts
Discord: https://discord.gg/WK7nYmDhrN (24/7 support and updates)
Tebex: https://rep.tebex.io/

# **INSTALLATION VIDEO GUIDE**

https://youtu.be/rBnhWZc61AU

# Dependencies


# Installation:


### IMPORTANT ###

# Change "localhost" from app.js and hyperdata.js to your server ip

# Turn on TCP port like FiveM (default is 3001, u can change it)

### QS-Inventory

# Search for the following code:
    ```lua
        function AddItem(source, item, amount, slot, info, data, created, lastinventory)
    ```

# Add the following code after the whole function:

```lua
    RegisterNetEvent('rep-weed:server:saveDry',function (type,id)
        if type == "trunk" then
            if IsVehicleOwned(id) then
                if Trunks[id.label] == "Trunk-None" or not Trunks[id].items then return end
                    for _, item in pairs(Trunks[id].items) do
                        item.description = nil
                    end
                    MySQL.insert('INSERT INTO inventory_trunk (plate, items) VALUES (:plate, :items) ON DUPLICATE KEY UPDATE items = :items', {
                        ['plate'] = id,
                        ['items'] = json.encode(Trunks[id].items)
                    })
                end
        elseif type == "glovebox" then
            if (IsVehicleOwned(id)) then
                if Gloveboxes[id].label == "Glovebox-None" or not Gloveboxes[id].items then return end
                for _, item in pairs(Gloveboxes[id].items) do
                    item.description = nil
                end
                MySQL.insert('INSERT INTO inventory_glovebox (plate, items) VALUES (:plate, :items) ON DUPLICATE KEY UPDATE items = :items', {
                    ['plate'] = id,
                    ['items'] = json.encode(Gloveboxes[id].items)
                })
            end
        elseif type == "stash" then
            if Stashes[id].label == "Stash-None" or not Stashes[id].items then return end
            for _, item in pairs(Stashes[id].items) do
                item.description = nil
            end
            MySQL.insert('INSERT INTO inventory_stash (stash, items) VALUES (:stash, :items) ON DUPLICATE KEY UPDATE items = :items', {
                ['stash'] = id,
                ['items'] = json.encode(Stashes[id].items)
            })
        end
    end)

    RegisterNetEvent('rep-weed:server:updateDry',function (type,id, slot, item)
        if type == 'player' then
            inventories[source][slot] = item
        elseif type == 'stash' then
            Stashes[id].items[slot] = item
        elseif type == 'trunk' then
            Trunks[id].items[slot] = item
        elseif type == "glovebox" then
            Gloveboxes[id].items[slot] = item
        end
    end)
```

# Search for the following code:

```lua
    TriggerClientEvent(Config.InventoryPrefix .. ':client:OpenInventory', src, {}, inventories[src], secondInv)
```

# Add the following code before trigger:

```lua
    TriggerEvent('rep-weed:server:checkDry', inventories[src], secondInv)
```

# Search for the following code:

```lua
    TriggerClientEvent(Config.InventoryPrefix .. ':client:OpenInventory', src, {}, inventories[src])
```

# Add the following code before trigger:

```lua
    TriggerEvent('rep-weed:server:checkDry', inventories[src])
```

# Search for the following code:

```lua
    function GiveItemToPlayer(source, item, amount)
```

# After it
```lua
	elseif itemData['name'] == 'briefcase' then
			info.ID = 'briefcase_' .. math.random(111111, 999999)
			info.weight = 10000
			info.slots = 10
```

# Add this
```lua
    if itemData['name'] == "femaleseed" then
        info.strain = "Unknown"
        info.n = 0
        info.p = 0
        info.k = 0
    elseif itemData['name'] == "driedbud" then
        info.strain = "Unknown"
        info.n = 0
        info.p = 0
        info.k = 0
        info.remainweight = 100
    elseif itemData['name'] == "weedpackage" then
        info.strain = "Unknown"
        info.n = 0
        info.p = 0
        info.k = 0
        info.remainweight = 100
    elseif itemData['name'] == "weedbaggie" then
        info.strain = "Unknown"
        info.n = 0
        info.p = 0
        info.k = 0
    elseif itemData['name'] == "wetbud" then
        info.strain = "Unknown"
        info.n = 0
        info.p = 0
        info.k = 0
        info.dry = 0
    elseif itemData['name'] == "joint" then
        info.strain = "Unknown"
        info.dry = 0
        info.n = 0
        info.p = 0
        info.k = 0
    elseif itemData['name'] == "wateringcan" then
        info.water = 0
```

### New QB-Inventory

# Search for the following code:
```lua
    TriggerClientEvent('qb-inventory:client:openInventory', source, QBPlayer.PlayerData.items, formattedInventory)
```

# Add the following code before trigger:

```lua
    TriggerEvent('rep-weed:server:checkDry', QBPlayer.PlayerData.items, formattedInventor)
```

# Search for the following code:
```lua
    AddEventHandler('txAdmin:events:serverShuttingDown', function()
```

# Add the following code before event handler:

```lua
    RegisterNetEvent('rep-weed:server:updateDry',function (name, slot, item)
        Inventories[name].items[slot] = item
    end)

    RegisterNetEvent('rep-weed:server:saveDry',function (name)
        if Inventories[name].isOpen then
            MySQL.prepare('INSERT INTO inventories (identifier, items) VALUES (?, ?) ON DUPLICATE KEY UPDATE items = ?', { 
                name, json.encode(Inventories[name].items), json.encode(Inventories[name].items) 
            })
        end
    end)
```

# Search for the following code:

```lua
   QBCore.Commands.Add('giveitem', 'Give An Item (Admin Only)', { { name = 'id', help = 'Player ID' }, { name = 'item', help = 'Name of the item (not a label)' }, { name = 'amount', help = 'Amount of items' } }, false, function(source, args)
```

# After it
```lua
	elseif itemData['name'] == 'harness' then
        info.uses = 20
```

# Add this
```lua
    if itemData['name'] == "femaleseed" then
        info.strain = "Unknown"
        info.n = 0
        info.p = 0
        info.k = 0
    elseif itemData['name'] == "driedbud" then
        info.strain = "Unknown"
        info.n = 0
        info.p = 0
        info.k = 0
        info.remainweight = 100
    elseif itemData['name'] == "weedpackage" then
        info.strain = "Unknown"
        info.n = 0
        info.p = 0
        info.k = 0
        info.remainweight = 100
    elseif itemData['name'] == "weedbaggie" then
        info.strain = "Unknown"
        info.n = 0
        info.p = 0
        info.k = 0
    elseif itemData['name'] == "wetbud" then
        info.strain = "Unknown"
        info.n = 0
        info.p = 0
        info.k = 0
        info.dry = 0
    elseif itemData['name'] == "joint" then
        info.strain = "Unknown"
        info.dry = 0
        info.n = 0
        info.p = 0
        info.k = 0
    elseif itemData['name'] == "wateringcan" then
        info.water = 0
```


## NEWEST QB ##

# Go to qb-core file, find config.lua

# Search for the following code:

```lua
  metadata = {
        hunger = 100,
        thirst = 100,
        stress = 0,
```


# Add

```lua
    weed_rep = 0
```

# And go to rep-weed/server/framework/qb. Find Framework.setPlayerRep and Framework.getPlayerRep change 'weed-rep' to 'weed_rep'


## QBOX ##

# Go to qb-core file, find server/player.lua

# Search for the following code:

```lua
  function CheckPlayerData(source, playerData)
```


# After

```lua
    playerData.metadata.health = playerData.metadata.health or 200
```

# Add

```lua
    playerData.metadata.weed_rep = playerData.metadata.weed_rep or 0
```

# And go to rep-weed/server/framework/qbox. Find Framework.setPlayerRep and Framework.getPlayerRep change 'weed-rep' to 'weed_rep'
