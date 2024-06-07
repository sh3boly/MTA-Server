local spawnX, spawnY, spawnZ = 1948.875, -1713.143, 13.547
function joinHandler()
	fadeCamera(source, true)
	setCameraTarget(source, source)
	outputChatBox("Welcome to My Server", source)
end
addEventHandler("onPlayerJoin", getRootElement(), joinHandler)
-- create the function the command handler calls, with the arguments: thePlayer, command, vehicleModel
    function createVehicleForPlayer(thePlayer, command, vehicleModel)
        -- create a vehicle and stuff
        local x, y, z = getElementPosition(thePlayer)
        x = x + 5

        local createdVehicle = createVehicle(tonumber(vehicleModel), x, y, z)
        if(createdVehicle == false) then
            outputChatBox("Failed to make the car for some reason...", thePlayer)
        end
     end
     
     -- create a command handler
     addCommandHandler("createvehicle", createVehicleForPlayer)

function loginHandler(username,password)
        -- check that the username and password are correct
        if username == "user" and password == "apple" then
            -- the player has successfully logged in, so spawn them
            if (client) then
                spawnPlayer(client, spawnX, spawnY, spawnZ)
                fadeCamera(client, true)
                            setCameraTarget(client, client)
                outputChatBox("Welcome to My Server.", client)
            end
        else
            -- if the username or password are not correct, output a message to the player
            outputChatBox("Invalid username and password. Please re-connect and try again.",client)
            end			
    end
addEvent("submitLogin", true)
addEventHandler("submitLogin", root, loginHandler)

function carSpawnHandler(vehicleID)
    local x, y, z = getElementPosition(client)
    local veh = createVehicle(vehicleID, x, y, z)
    warpPedIntoVehicle(client, veh)
    outputChatBox("Vehicle spawned: " .. vehicleID, client)
end
addEvent("carSpawn", true)
addEventHandler("carSpawn", root, carSpawnHandler)

local vehMark = createMarker(1940.875, -1713.143, 10.547, "cylinder")
function vehicleSpawner(hitElement, matchingDimension)
    if getElementType(hitElement) == "player" and not isPedInVehicle(hitElement) then
        triggerClientEvent(hitElement, "showVehicleSpawnWindow", hitElement)
        outputChatBox("Vehicle spawn window triggered.", hitElement)
    end
end
addEventHandler("onMarkerHit", vehMark, vehicleSpawner)


function gunSpawnHandler(gunID)
    giveWeapon(client, gunID, 200)
end
addEvent("gunSpawn", true)
addEventHandler("gunSpawn", root, gunSpawnHandler)

local gunMark = createMarker(1940.875, -1700.143, 10.547, "cylinder")
function gunSpawner(hitElement, matchingDimension)
    if getElementType(hitElement) == "player" and not isPedInVehicle(hitElement) then
        triggerClientEvent(hitElement, "showGunSpawnWindow", hitElement)
        outputChatBox("Gun spawn window triggered.", hitElement)
    end
end
addEventHandler("onMarkerHit", gunMark, gunSpawner)