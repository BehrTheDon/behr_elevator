local elevatorFloors = {}

function DebugPrint(message)
    if Config.Debug then
        print("^3[Behr_Elevator] ^0" .. message)
    end
end

CreateThread(function()
    DebugPrint("Client Script Initialized")
    Wait(1000) 
    setupElevators()
end)

function setupElevators()
    for _, elevator in ipairs(Config.Elevator) do
        for i = 1, #elevator.info.floors do
            local marketData = elevator.info.floors[i]
            local coords = marketData.coords

            DebugPrint("Setting up Elevators at: " .. coords.x .. ", " .. coords.y .. ", " .. coords.z .. ", " .. coords.w)  -- debug print the coordinates
            
            local zone = CreateInteractionZone(marketData, coords, i)

            elevatorFloors[i] = zone
        end
    end
    
    RegisterContextMenus()
end

function CreateInteractionZone(marketData, coords, elevatorIndex)
    local data = {
        debug = Config.Debug,
        coords = vec4(coords.x, coords.y, coords.z, coords.w),
        size = vec3(2.5, 2.5, 2.5),

        onEnter = function () 
            DebugPrint("Entered elevator zone: " .. elevatorIndex)

            local options = {
                position = Config.OxTextPosition,
                icon = 'fas fa-building'
            }

            lib.showTextUI("[E] - Open Elevator", options)
        end,

        onExit = function ()
            DebugPrint("Exited elevator zone: " .. elevatorIndex)

            lib.hideTextUI()
        end,

        inside = function()
            if IsControlJustReleased(0, 38) then
                lib.showContext(marketData.menuId)
                DebugPrint("Interacting with elevator: " .. elevatorIndex)
            end
        end
    }
    local zone = lib.zones.box(data) 

    return zone
end

function RegisterContextMenus()
    local globalMenuId = 0

    for eIndex, elevator in ipairs(Config.Elevator) do
        globalMenuId = globalMenuId + 1
        local menuId = 'elevator_main_' .. globalMenuId

        for fIndex, floor in ipairs(elevator.info.floors) do
            floor.menuId = menuId
        end

        local options = {}

        for i = #elevator.info.floors, 1, -1 do
            local floor = elevator.info.floors[i]
            if floor.elevator then
                table.insert(options, {
                    title = "Floor " .. floor.level,
                    description = "Travel to floor " .. floor.level,
                    icon = 'fas fa-building',
                    onSelect = function()
                        Wait(300)
                        DebugPrint("Teleporting to floor " .. floor.level .. " at: " .. floor.coords.x .. ", " .. floor.coords.y .. ", " .. floor.coords.z)
                        DoScreenFadeOut(500) -- fade out over 0.5 seconds
                        while not IsScreenFadedOut() do Wait(10) end

                        -- Teleport the player
                        SetEntityCoords(PlayerPedId(), floor.coords.x, floor.coords.y, floor.coords.z, false, false, false, false)
                        SetEntityHeading(PlayerPedId(), floor.coords.w)

                        Wait(500) -- slight wait to make it feel smoother

                        DoScreenFadeIn(500) -- fade back in over 0.5 seconds
                    end
                })
            end
        end

        lib.registerContext({
            id = menuId,
            title = elevator.info.name,
            options = options
        })
    end
end

AddEventHandler('onResourceStop', function(resourceName)
    if resourceName == GetCurrentResourceName() then
        DebugPrint("Stopping black market resource, cleaning up zones and peds")

        for i = 1, #elevatorFloors do
            if elevatorFloors[i] then
                elevatorFloors[i]:remove()
            end
        end

        elevatorFloors = {}

        lib.hideTextUI()
        lib.hideContext()
    end
end)