if not Framework.QBox() then return end

function Framework.GetPlayerGender()
    Framework.PlayerData = exports['qbx_core']:GetPlayerData()
    if tonumber(Framework.PlayerData.charinfo.gender) == 1 then
        return "Female"
    end
    return "Male"
end
