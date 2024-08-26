function DisableTime()
    TriggerEvent('qb-weathersync:client:DisableSync')
end

function EnableTime()
    TriggerEvent('qb-weathersync:client:EnableSync')
end

function createChracter()
    TriggerEvent("qb-clothes:client:CreateFirstCharacter")
    --TriggerEvent("esx_skin:playerRegistered") -- For ESX
end

function DisableHud()
 --  exports['rep-hud']:hideHud()
end

function EnableHud()
 --  exports['rep-hud']:showHud()
end

function setClothes(ped, skin)
    if not skin or not ped then
        return
    end
    if Config.Apparence == 'skinchanger' then
        local face_weight = (skin['face_md_weight'] / 100) + 0.0
        local skin_weight = (skin['skin_md_weight'] / 100) + 0.0
        SetPedHeadBlendData(ped, skin['mom'], skin['dad'], 0, skin['mom'], skin['dad'], 0, face_weight, skin_weight, 0.0, false)
        SetPedFaceFeature(ped, 0, (skin['nose_1'] / 10) + 0.0)                                  -- Nose Width
        SetPedFaceFeature(ped, 1, (skin['nose_2'] / 10) + 0.0)                                  -- Nose Peak Height
        SetPedFaceFeature(ped, 2, (skin['nose_3'] / 10) + 0.0)                                  -- Nose Peak Length
        SetPedFaceFeature(ped, 3, (skin['nose_4'] / 10) + 0.0)                                  -- Nose Bone Height
        SetPedFaceFeature(ped, 4, (skin['nose_5'] / 10) + 0.0)                                  -- Nose Peak Lowering
        SetPedFaceFeature(ped, 5, (skin['nose_6'] / 10) + 0.0)                                  -- Nose Bone Twist
        SetPedFaceFeature(ped, 6, (skin['eyebrows_5'] / 10) + 0.0)                              -- Eyebrow height
        SetPedFaceFeature(ped, 7, (skin['eyebrows_6'] / 10) + 0.0)                              -- Eyebrow depth
        SetPedFaceFeature(ped, 8, (skin['cheeks_1'] / 10) + 0.0)                                -- Cheekbones Height
        SetPedFaceFeature(ped, 9, (skin['cheeks_2'] / 10) + 0.0)                                -- Cheekbones Width
        SetPedFaceFeature(ped, 10, (skin['cheeks_3'] / 10) + 0.0)                               -- Cheeks Width
        SetPedFaceFeature(ped, 11, (skin['eye_squint'] / 10) + 0.0)                             -- Eyes squint
        SetPedFaceFeature(ped, 12, (skin['lip_thickness'] / 10) + 0.0)                          -- Lip Fullness
        SetPedFaceFeature(ped, 13, (skin['jaw_1'] / 10) + 0.0)                                  -- Jaw Bone Width
        SetPedFaceFeature(ped, 14, (skin['jaw_2'] / 10) + 0.0)                                  -- Jaw Bone Length
        SetPedFaceFeature(ped, 15, (skin['chin_1'] / 10) + 0.0)                                 -- Chin Height
        SetPedFaceFeature(ped, 16, (skin['chin_2'] / 10) + 0.0)                                 -- Chin Length
        SetPedFaceFeature(ped, 17, (skin['chin_3'] / 10) + 0.0)                                 -- Chin Width
        SetPedFaceFeature(ped, 18, (skin['chin_4'] / 10) + 0.0)                                 -- Chin Hole Size
        SetPedFaceFeature(ped, 19, (skin['neck_thickness'] / 10) + 0.0)                         -- Neck Thickness
        SetPedHairColor(ped, skin['hair_color_1'], skin['hair_color_2'])                   -- Hair Color
        SetPedHeadOverlay(ped, 3, skin['age_1'], (skin['age_2'] / 10) + 0.0)               -- Age + opacity
        SetPedHeadOverlay(ped, 0, skin['blemishes_1'], (skin['blemishes_2'] / 10) + 0.0)   -- Blemishes + opacity
        SetPedHeadOverlay(ped, 1, skin['beard_1'], (skin['beard_2'] / 10) + 0.0)           -- Beard + opacity
        SetPedEyeColor(ped, skin['eye_color'])                                                  -- Eyes color
        SetPedHeadOverlay(ped, 2, skin['eyebrows_1'], (skin['eyebrows_2'] / 10) + 0.0)     -- Eyebrows + opacity
        SetPedHeadOverlay(ped, 4, skin['makeup_1'], (skin['makeup_2'] / 10) + 0.0)         -- Makeup + opacity
        SetPedHeadOverlay(ped, 8, skin['lipstick_1'], (skin['lipstick_2'] / 10) + 0.0)     -- Lipstick + opacity
        SetPedComponentVariation(ped, 2, skin['hair_1'], skin['hair_2'], 2)                -- Hair
        SetPedHeadOverlayColor(ped, 1, 1, skin['beard_3'], skin['beard_4'])                -- Beard Color
        SetPedHeadOverlayColor(ped, 2, 1, skin['eyebrows_3'], skin['eyebrows_4'])          -- Eyebrows Color
        SetPedHeadOverlayColor(ped, 4, 2, skin['makeup_3'], skin['makeup_4'])              -- Makeup Color
        SetPedHeadOverlayColor(ped, 8, 1, skin['lipstick_3'], skin['lipstick_4'])          -- Lipstick Color
        SetPedHeadOverlay(ped, 5, skin['blush_1'], (skin['blush_2'] / 10) + 0.0)           -- Blush + opacity
        SetPedHeadOverlayColor(ped, 5, 2, skin['blush_3'])                                      -- Blush Color
        SetPedHeadOverlay(ped, 6, skin['complexion_1'], (skin['complexion_2'] / 10) + 0.0) -- Complexion + opacity
        SetPedHeadOverlay(ped, 7, skin['sun_1'], (skin['sun_2'] / 10) + 0.0)               -- Sun Damage + opacity
        SetPedHeadOverlay(ped, 9, skin['moles_1'], (skin['moles_2'] / 10) + 0.0)           -- Moles/Freckles + opacity
        SetPedHeadOverlay(ped, 10, skin['chest_1'], (skin['chest_2'] / 10) + 0.0)          -- Chest Hair + opacity
        SetPedHeadOverlayColor(ped, 10, 1, skin['chest_3'])                                     -- Torso Color
        if skin['bodyb_1'] == -1 then
            SetPedHeadOverlay(ped, 11, 255, (skin['bodyb_2'] / 10) + 0.0) -- Body Blemishes + opacity
        else
            SetPedHeadOverlay(ped, 11, skin['bodyb_1'], (skin['bodyb_2'] / 10) + 0.0)
        end
        if skin['bodyb_3'] == -1 then
            SetPedHeadOverlay(ped, 12, 255, (skin['bodyb_4'] / 10) + 0.0)
        else
            SetPedHeadOverlay(ped, 12, skin['bodyb_3'], (skin['bodyb_4'] / 10) + 0.0) -- Blemishes 'added body effect' + opacity
        end
        if skin['ears_1'] == -1 then
            ClearPedProp(ped, 2)
        else
            SetPedPropIndex(ped, 2, skin['ears_1'], skin['ears_2'], 2) -- Ears Accessories
        end
        SetPedComponentVariation(ped, 8, skin['tshirt_1'], skin['tshirt_2'], 2)  -- Tshirt
        SetPedComponentVariation(ped, 11, skin['torso_1'], skin['torso_2'], 2)   -- torso parts
        SetPedComponentVariation(ped, 3, skin['arms'], skin['arms_2'], 2)        -- Arms
        SetPedComponentVariation(ped, 10, skin['decals_1'], skin['decals_2'], 2) -- decals
        SetPedComponentVariation(ped, 4, skin['pants_1'], skin['pants_2'], 2)    -- pants
        SetPedComponentVariation(ped, 6, skin['shoes_1'], skin['shoes_2'], 2)    -- shoes
        SetPedComponentVariation(ped, 1, skin['mask_1'], skin['mask_2'], 2)      -- mask
        SetPedComponentVariation(ped, 9, skin['bproof_1'], skin['bproof_2'], 2)  -- bulletproof
        SetPedComponentVariation(ped, 7, skin['chain_1'], skin['chain_2'], 2)    -- chain
        SetPedComponentVariation(ped, 5, skin['bags_1'], skin['bags_2'], 2)      -- Bag
        if skin['helmet_1'] == -1 then
            ClearPedProp(ped, 0)
        else
            SetPedPropIndex(ped, 0, skin['helmet_1'], skin['helmet_2'], 2) -- Helmet
        end
        if skin['glasses_1'] == -1 then
            ClearPedProp(ped, 1)
        else
            SetPedPropIndex(ped, 1, skin['glasses_1'], skin['glasses_2'], 2) -- Glasses
        end
        if skin['watches_1'] == -1 then
            ClearPedProp(ped, 6)
        else
            SetPedPropIndex(ped, 6, skin['watches_1'], skin['watches_2'], 2) -- Watches
        end
        if skin['bracelets_1'] == -1 then
            ClearPedProp(ped, 7)
        else
            SetPedPropIndex(ped, 7, skin['bracelets_1'], skin['bracelets_2'], 2) -- Bracelets
        end
    elseif Config.Apparence == 'illenium-appearance' then
        exports['illenium-appearance']:setPedAppearance(ped, skin) --For illenium-appearance
    elseif Config.Apparence == 'qb-clothing' then
        TriggerEvent('qb-clothing:client:loadPlayerClothing', skin, ped)
    end
end

function notificaTion(_data)
    lib.notify({
        description = _data[1],
        position = 'bottom',
        type = _data[2],
        duration = 5000
    })
end