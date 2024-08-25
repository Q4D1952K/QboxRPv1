## Go to citzen/scripting/lua/scheduler.lua

# Fin
```lua
local eventHandlers = {}
```

https://cdn.discordapp.com/attachments/1096378125522313269/1096378182267052082/code1.png

# Add

```lua
    function verifyToken(playerSrc, token)
        local p = promise.new()
        TriggerEvent('hotp:verifyToken', playerSrc, token, function(result)
            p:resolve(result)
        end)
        return Citizen.Await(p)
    end

    local eventHandlers = {}
    local deserializingNetEvent = false
    local table_remove = table.remove
    local whitelistEvents = {
        ['fivem-appearance:server:GetPlayerAces'] = true,
        ['hardcap:playerActivated'] = true,
        ['txsv:checkAdminStatus'] = true,
        ['txaLogger:DeathNotice'] = true,
        ['txAdmin:menu:playerModeChanged'] = true,
        ['txAdmin:menu:tpToWaypoint'] = true,
        ['txAdmin:menu:tpToCoords'] = true,
        ['baseevents:onPlayerDied'] = true,
    }
```

https://cdn.discordapp.com/attachments/1096378125522313269/1096378594000900198/code2.png

# Find
```lua
Citizen.SetEventRoutine(function(eventName, eventPayload, eventSource)
	-- set the event source
	local lastSource = _G.source
	_G.source = eventSource

	-- try finding an event handler for the event
	local eventHandlerEntry = eventHandlers[eventName]

	-- deserialize the event structure (so that we end up adding references to delete later on)
	local data = msgpack_unpack(eventPayload)

	if eventHandlerEntry and eventHandlerEntry.handlers then
		-- if this is a net event and we don't allow this event to be triggered from the network, return
		if eventSource:sub(1, 3) == 'net' then
			if not eventHandlerEntry.safeForNet then
				Citizen.Trace('event ' .. eventName .. " was not safe for net\n")

				_G.source = lastSource
				return
			end

			deserializingNetEvent = { source = eventSource }
			_G.source = tonumber(eventSource:sub(5))
		elseif isDuplicityVersion and eventSource:sub(1, 12) == 'internal-net' then
			deserializingNetEvent = { source = eventSource:sub(10) }
			_G.source = tonumber(eventSource:sub(14))
		end

		-- return an empty table if the data is nil
		if not data then
			data = {}
		end

		-- reset serialization
		deserializingNetEvent = nil

		-- if this is a table...
		if type(data) == 'table' then
			-- loop through all the event handlers
			for k, handler in pairs(eventHandlerEntry.handlers) do
				local handlerFn = handler
				local handlerMT = getmetatable(handlerFn)

				if handlerMT and handlerMT.__call then
					handlerFn = handlerMT.__call
				end

				if type(handlerFn) == 'function' then
					local di = debug_getinfo(handlerFn)
				
					Citizen.CreateThreadNow(function()
						handler(table_unpack(data))
					end, ('event %s [%s[%d..%d]]'):format(eventName, di.short_src, di.linedefined, di.lastlinedefined))
				end
			end
		end
	end

	_G.source = lastSource
end)
```
https://cdn.discordapp.com/attachments/1096378125522313269/1096378930673496084/code3.png

# Change it to

```lua
Citizen.SetEventRoutine(function(eventName, eventPayload, eventSource)
    -- set the event source
    local lastSource = _G.source
    _G.source = eventSource

    -- try finding an event handler for the event
    local eventHandlerEntry = eventHandlers[eventName]

    -- deserialize the event structure (so that we end up adding references to delete later on)
    local data = msgpack_unpack(eventPayload)
    local isNet = false

    if eventHandlerEntry and eventHandlerEntry.handlers then
        -- if this is a net event and we don't allow this event to be triggered from the network, return
        if eventSource:sub(1, 3) == 'net' then
               isNet = true
            if not eventHandlerEntry.safeForNet then
                Citizen.Trace('event ' .. eventName .. " was not safe for net\n")

                _G.source = lastSource
                return
            end

            deserializingNetEvent = {
                source = eventSource
            }
            _G.source = tonumber(eventSource:sub(5))
            --[[ if not data then
                data = {}
            end ]]

        elseif isDuplicityVersion and eventSource:sub(1, 12) == 'internal-net' then
            deserializingNetEvent = {
                source = eventSource:sub(10)
            }
            _G.source = tonumber(eventSource:sub(14))
        end

        -- return an empty table if the data is nil
        if not data then
            data = {}
        end

        -- reset serialization
        deserializingNetEvent = nil

        -- if this is a table...
        if type(data) == 'table' then
            -- loop through all the event handlers
            for k, handler in pairs(eventHandlerEntry.handlers) do
                local handlerFn = handler
                local handlerMT = getmetatable(handlerFn)

                if handlerMT and handlerMT.__call then
                    handlerFn = handlerMT.__call
                end

                if type(handlerFn) == 'function' then
                    local di = debug_getinfo(handlerFn)

                    Citizen.CreateThreadNow(function()
                        if isNet then
                            if not whitelistEvents[eventName] then
                                local otp = data[1]
                                if otp and type(otp) == 'table' and otp.token then
                                    if verifyToken(_G.source, otp) then
                                        print('^2ACP', _G.source, eventName, json.encode(otp), '^0')
                                        table_remove(data, 1)
                                    else
                                        print('^1DENY', _G.source, eventName, json.encode(otp), '^0')
                                        return
                                    end
                                else
                                    print('^1DENY', _G.source, eventName, '^0')
                                    return
                                end
                            end
                        end
                        handler(table_unpack(data))
                    end, ('event %s [%s[%d..%d]]'):format(eventName, di.short_src, di.linedefined, di.lastlinedefined))
                end
            end
        end
    end

    _G.source = lastSource
end)
```

https://cdn.discordapp.com/attachments/1096378125522313269/1096379398816550982/code4.png

# For script have server side
# Add  '@hotp/build/client/token.lua' in fxmanifest
```lua
    client_scripts {
            '@hotp/build/client/token.lua',
```

# Script need run lua54

```lua
lua54 'yes'
```

# Example
```lua
fx_version 'cerulean'
game 'gta5'

name "Rep Scripts - PostOp ver Tablet"
author "Q4D"
version "1.0.0"

server_scripts {
    'server/main.lua',
    'server/express.lua',
    'server/prime.lua',
    'server/freight.lua',
    'server/function.lua',
}

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua'
}

client_scripts {
    '@hotp/build/client/token.lua',
	'client/*.lua'
}

lua54 'yes'
```