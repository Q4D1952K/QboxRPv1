# Description
Made by Rep Scripts 

Discord : https://discord.gg/VxGs8ceG5W

Tebex: https://rep.tebex.io/

Youtube: https://www.youtube.com/@repscripts

CFX: https://forum.cfx.re/u/bahnmifps/activity/topics

# Dependencies
* [Framework](https://github.com/qbcore-framework) or (https://github.com/esx-overextended/es_extended) or (https://github.com/Qbox-project/qbx_core)
* [Target] (https://github.com/overextended/ox_target) or (https://github.com/qbcore-framework/qb-target) or (https://github.com/overextended/qtarget)
* [Rep-Tablet](https://github.com/Rep-Scripts/rep-tablet)
* [Rep-TalkToNPC](https://github.com/BahnMiFPS/rep-talkNPC)
# Installation

* **Install all the dependencies**
* **Ensure the GOODS**
* **ENJOY**

* **With QB-Core or QBox:**
# Add this job into shared.lua
```lua
    ['postop'] = {
        label = 'PostOp',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = 'Driver',
                payment = 50
            },
            ['1'] = {
                name = 'Manager',
                payment = 50
            },
            ['2'] = {
                name = 'Boss',
                isboss = true,
                payment = 50
            },
        },
    },
```

* **With ESX:**
```sql
    INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
    ('postop', 'Post Op', 0)
    INSERT INTO `job_grades` (`job_name`,  `grade`,  `name`,  `label`,  `salary`, `skin_male`, `skin_female`) VALUES
    ('postop', 0, 'driver', 'Driver', 100, '{}', '{}'),
    ('postop', 1, 'manager', 'Manager', 100, '{}', '{}'),
    ('postop', 2, 'boss', 'Boss', 100, '{}', '{}')
```

# ENJOY!!
