# Description
Made by Rep Scripts 

Discord : https://discord.gg/VxGs8ceG5W

Tebex: https://rep.tebex.io/

Youtube: https://www.youtube.com/@repscripts

CFX: https://forum.cfx.re/u/q4d195/activity/topics

# Dependencies

* [Framework](https://github.com/qbcore-framework) or (https://github.com/esx-overextended/es_extended) or (https://github.com/Qbox-project/qbx_core)
* [Target] (https://github.com/overextended/ox_target) or (https://github.com/qbcore-framework/qb-target) or (https://github.com/overextended/qtarget)
* [Rep-Tablet](https://github.com/Rep-Scripts/rep-tablet)
* [Rep-TalkToNPC](https://github.com/BahnMiFPS/rep-talkNPC)
* [Pengu_Digiscanner](https://github.com/PenguScript/pengu_digiscanner/)

# Installation
* **Install all the dependencies**
* **Ensure the GOODS**
* **ENJOY**

* **With Ox_inventory:**
```lua
    ["car_door"] = {
        label = "Car Door",
        weight = 7500,
        description = "",
    },

    ["car_trunk"] = {
        label = "Car Trunk",
        weight = 7500,
        description = "",
    },

    ["car_wheel"] = {
        label = "Car Wheel",
        weight = 5000,
        description = "",
    },
```
* **With QB-Core or QBox:**
# Add this item into shared.lua

```lua
    ['car_door'] 			 	 	 = {['name'] = 'car_door', 				['label'] = 'Car Door', 				['weight'] = 7500, 		['type'] = 'item', 		['image'] = 'car_door.png', 			['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = ''},

    ["car_trunk"] 					 = {["name"] = "car_trunk", 			 	["label"] = "Car Trunk", 		        ["weight"] = 7500, 		["type"] = "item", 		["image"] = "car_trunk.png", 				["unique"] = true, 		["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = ""},

    ["car_wheel"] 					 = {["name"] = "car_wheel", 			 	["label"] = "Car Wheel", 		        ["weight"] = 5000, 		["type"] = "item", 		["image"] = "car_wheel.png", 				["unique"] = false, 		["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = ""},
```

* **With ESX:**
```sql
    INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
        ('car_door', 'Delivery List', 8, 0, 1),
        ('car_trunk', 'Car Trunk', 8, 0, 1),
        ('car_wheel', 'Car Wheel', 5, 0, 1),
```

# 2. Add in prop Renewed-Weaponscarry (ver1)
```lua
    ["car_trunk"] =  { carry = true, model = "imp_prop_impexp_trunk_03a", bone = 24817, x = -0.21, y = 0.58, z = 0.0, xr = 79.36, yr = 2.3, zr = -0.3, blockAttack = true, blockCar = true, blockRun = true },
    ["car_door"] =  { carry = true, model = "imp_prop_impexp_car_door_04a", bone = 24817, x = -0.19, y = 0.46, z = -0.61, xr = -89.7, yr = 75.0, zr = 0.0, blockAttack = true, blockCar = true, blockRun = true },
    ["car_wheel"] =  { carry = true, model = "prop_wheel_02", bone = 24817, x = -0.15, y = 0.4, z = 0.02, xr = -185.0, yr = 0.0, zr = 0.0, blockAttack = true, blockCar = true, blockRun = true },
```

# Or new version

```lua
    car_trunk = {
        model = `imp_prop_impexp_trunk_03a`,
        pos = vec3(-0.21, 0.58, 0.0),
        rot = vec3(79.36, 2.3, -0.3),
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
    car_door = {
        model = `imp_prop_impexp_car_door_04a`,
        pos = vec3(-0.19, 0.46, -0.61),
        rot = vec3(-89.7, 75.0, 0.0),
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
    car_wheel = {
        model = `prop_wheel_02`,
        pos = vec3(-0.15, 0.4, 0.02),
        rot = vec3(-185.0, 0.0, 0.0),
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
```