# Description
Made by Rep Scripts 

Discord : https://discord.gg/VxGs8ceG5W

Tebex: https://rep.tebex.io/

Youtube: https://www.youtube.com/@repscripts

CFX: https://forum.cfx.re/u/bahnmifps/activity/topics

# Installation

* **Install all the dependencies**
* **Ensure the GOODS**
* **ENJOY**

* **With QB-Core or QBox:**
# Add this item into shared.lua

```lua
    ['deliverylist'] 			 	 	 = {['name'] = 'deliverylist', 				['label'] = 'Delivery List', 				['weight'] = 0, 		['type'] = 'item', 		['image'] = 'deliverylist.png', 			['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'A long list of customers and deliveries..'},

    ["package"] 					 = {["name"] = "package", 			 	["label"] = "Suspicious Package", 		        ["weight"] = 7500, 		["type"] = "item", 		["image"] = "package.png", 				["unique"] = true, 		["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Package covered in tape and milk stickers. Marked for Police Seizure."},

    ["rolls"] 					 = {["name"] = "rolls", 			 	["label"] = "Roll of Small Notes", 		        ["weight"] = 25, 		["type"] = "item", 		["image"] = "cashroll.png", 				["unique"] = false, 		["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Lots of low denominators - Indicates drug sales."},

    ['bands'] 				 = {['name'] = 'bands', 			  	  	['label'] = 'Band of Notes', 			['weight'] = 50, 		['type'] = 'item', 		['image'] = 'bands.png', 			['unique'] = false, 		['useable'] = false, 	['shouldClose'] = false,	   ['combinable'] = nil,   ['description'] = 'Lots of low denominators - Indicates drug sales.'},
```

* **With Ox_inventory:**

```lua
    ["deliverylist"] = {
        label = "Delivery List",
        weight = 0,
        description = "A long list of customers and deliveries..",
    },

    ["package"] = {
        label = "Suspicious Package",
        weight = 7500,
        description = "Package covered in tape and milk stickers. Marked for Police Seizure",
    },

    ["rolls"] = {
        label = "Roll of Small Notes",
        weight = 25,
        description = "Lots of low denominators - Indicates drug sales",
    },

    ["bands"] = {
        label = "Band of Notes",
        weight = 50,
        description = "Lots of low denominators - Indicates drug sales",
    },

```

* **With ESX:**
```sql
    INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
        ('deliverylist', 'Delivery List', 0, 0, 1),
        ('package', 'Suspicious Package', 8, 0, 1),
        ('rolls', 'Roll of Small Notes', 0, 0, 1),
        ('bands', 'Band of Notes', 0, 0, 1),
```

# 2. Add in prop Renewed-Weaponscarry (ver1)
```lua
 ["package"] =  { carry = true, model = "prop_idol_case_01", bone = 24817, x = -0.20, y = 0.43, z = 0.05, xr = 91.0,
  yr = 0.0, zr = -265.0, blockAttack = true, blockCar = true, blockRun = true },
```
# Or new version
```lua
    package = {
        model = `prop_idol_case_01`,
        pos = vec3(-0.20, 0.43, 0.05),
        rot = vec3(91.0, 0.0, -265.0),
        bone = 24817,
        dict = 'anim@heists@box_carry@',
        anim = 'idle',
        disableKeys = {
            disableSprint = true,
            disableJump = true,
            disableAttack = true,
            disableVehicle = true
        }
    },
}
```
# ENJOY!!
