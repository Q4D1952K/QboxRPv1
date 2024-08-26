local QBX = exports.qbx_core
local utils = require 'client.utils'

---@diagnostic disable-next-line: duplicate-set-field
function utils.hasPlayerGotGroup(filter)
    return QBX:HasGroup(filter)
end