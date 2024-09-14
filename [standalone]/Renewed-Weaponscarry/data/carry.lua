return {

    -- Used in Renewed-Fuel
    oilbarrel = {
        slowMovement = 10, -- Slow playermovement by percentage, 100 = cant walk, 0 = normal speed. (recommend 10-20)
        model = `prop_barrel_exp_01a`,
        pos = vec3(0.01, -0.27, 0.27),
        rot = vec3(3.0, 0.0, 0.0),
        bone = 28422,
        dict = 'anim@heists@box_carry@',
        anim = 'idle',
        disableKeys = {
            disableSprint = true,
            disableJump = true,
            disableAttack = true,
            disableDriving = true,
            disableVehicleEnter = true
        }
    },


    -- Used in Renewed-Garbagejob
    trashbag = {
        model = `prop_cs_rub_binbag_01`,
        pos = vec3(0.0, 0.0, 0.0),
        rot = vec3(180.0, 200.0, 80.0),
        bone = 28422,
        dict = 'anim@heists@narcotics@trash',
        anim = 'walk',
        disableKeys = {
            disableSprint = false,
            disableJump = true,
            disableAttack = true,
            disableVehicle = true
        }
    },
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
        rot = vec3(-185, 0.0, 0.0),
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
