function createLoginWindow()
	-- define the X and Y positions of the window
	local X = 0.375
	local Y = 0.375
	-- define the width and height of the window
	local Width = 0.25
	local Height = 0.25
	-- create the window and save its element value into the variable 'wdwLogin'
	-- click on the function's name to read its documentation
	wdwLogin = guiCreateWindow(X, Y, Width, Height, "Please Log In", true)

    X = 0.0825
    Y = 0.2
    Width = 0.25
    Height = 0.25


    guiCreateLabel(X, Y, Width, Height, "Username", true, wdwLogin)
    Y = 0.5
    guiCreateLabel(X, Y, Width, Height, "Password", true, wdwLogin)


    X = 0.415
    Y = 0.2
    Width = 0.5
    Height = 0.15
    edtUser = guiCreateEdit(X, Y, Width, Height, "", true, wdwLogin)
    Y = 0.5
    edtPass = guiCreateEdit(X, Y, Width, Height, "", true, wdwLogin)
    guiEditSetMaxLength(edtUser, 50)
    guiEditSetMaxLength(edtPass, 50)


    X = 0.415
    Y = 0.7
    Width = 0.25
    Height = 0.2
    btnLogin = guiCreateButton(X, Y, Width, Height, "Log In", true, wdwLogin)

    guiSetVisible(wdwLogin, false)


end

function clientSubmitLogin(button,state)
	if button == "left" and state == "up" then
		-- get the text entered in the 'username' field
		local username = guiGetText(edtUser)
		-- get the text entered in the 'password' field
		local password = guiGetText(edtPass)

		-- if the username and password both exist
		if username and username ~= "" and password and password ~= "" then
			-- trigger the server event 'submitLogin' and pass the username and password to it
			triggerServerEvent("submitLogin", getRootElement(), username, password)

			-- hide the gui, hide the cursor and return control to the player
			guiSetInputEnabled(false)
			guiSetVisible(wdwLogin, false)
			showCursor(false)
		else
			-- otherwise, output a message to the player, do not trigger the server
			-- and do not hide the gui
			outputChatBox("Please enter a username and password.")
		end
	end
end

addEventHandler("onClientResourceStart", getResourceRootElement(),
    function ()
        createLoginWindow()
        outputChatBox("Welcome to My MTA:SA Server, please log in.")
        if(wdwLogin ~= nil) then 
            guiSetVisible(wdwLogin, true)
        else 
            outputChatBox("An unexpected error has occurred and the login GUI has not been created.")
        end 
        showCursor(true)
        guiSetInputEnabled(true)
        addEventHandler("onClientGUIClick", btnLogin, clientSubmitLogin, false)

    end
)

local wdwVehicles, infernusBtn, secondOptionBtn, thirdOptionBtn, fourthOptionBtn, fifthOptionBtn

function createVehicleSpawnWindow()
    -- define the X and Y positions of the window
    local X = 0.375
    local Y = 0.375
    -- define the width and height of the window
    local Width = 0.25
    local Height = 0.25
    -- create the window and save its element value into the variable 'wdwVehicles'
    wdwVehicles = guiCreateWindow(X, Y, Width, Height, "Vehicle", true)

    X = 0.0825
    Y = 0.2
    Width = 0.25
    Height = 0.1
    infernusBtn = guiCreateButton(X, Y, Width, Height, "Infernus", true, wdwVehicles)
    Y = 0.4
    secondOptionBtn = guiCreateButton(X, Y, Width, Height, "Car 2", true, wdwVehicles)
    X = 0.415
    Y = 0.2
    thirdOptionBtn = guiCreateButton(X, Y, Width, Height, "Car 3", true, wdwVehicles)
    Y = 0.4
    fourthOptionBtn = guiCreateButton(X, Y, Width, Height, "Car 4", true, wdwVehicles)
    X = 0.0825
    Y = 0.6
    fifthOptionBtn = guiCreateButton(X, Y, Width, Height, "Car 5", true, wdwVehicles)
    guiSetVisible(wdwVehicles, false)

    -- Add event handlers for buttons
    addEventHandler("onClientGUIClick", infernusBtn, clientVehicleChoice, false)
    addEventHandler("onClientGUIClick", secondOptionBtn, clientVehicleChoice, false)
    addEventHandler("onClientGUIClick", thirdOptionBtn, clientVehicleChoice, false)
    addEventHandler("onClientGUIClick", fourthOptionBtn, clientVehicleChoice, false)
    addEventHandler("onClientGUIClick", fifthOptionBtn, clientVehicleChoice, false)
end

function clientVehicleChoice(button, state)
    if button == "left" and state == "up" then
        local vehicleID
        if source == infernusBtn then
            vehicleID = 411
        elseif source == secondOptionBtn then
            vehicleID = 415
        elseif source == thirdOptionBtn then
            vehicleID = 429
        elseif source == fourthOptionBtn then
            vehicleID = 451
        elseif source == fifthOptionBtn then
            vehicleID = 541
        end
        if vehicleID then
            triggerServerEvent("carSpawn", getLocalPlayer(), vehicleID)
            guiSetVisible(wdwVehicles, false)
            showCursor(false)
            outputChatBox("Requested vehicle spawn: " .. vehicleID)
        end
    end
end

addEvent("showVehicleSpawnWindow", true)
addEventHandler("showVehicleSpawnWindow", root,
    function()
        if not wdwVehicles then
            createVehicleSpawnWindow()
        end
        guiSetVisible(wdwVehicles, true)
        showCursor(true)
        outputChatBox("Vehicle spawn window displayed.")
    end
)


local wdwGun, gunOneBTn, gunTwoBtn, gunThreeBtn, gunFourBtn, gunFiveBtn

function createGunSpawnWindow()
    -- define the X and Y positions of the window
    local X = 0.375
    local Y = 0.375
    -- define the width and height of the window
    local Width = 0.25
    local Height = 0.25
    -- create the window and save its element value into the variable 'wdwVehicles'
    wdwGun = guiCreateWindow(X, Y, Width, Height, "Guns", true)

    X = 0.0825
    Y = 0.2
    Width = 0.25
    Height = 0.1
    gunOneBTn = guiCreateButton(X, Y, Width, Height, "Gun 1", true, wdwGun)
    Y = 0.4
    gunTwoBtn = guiCreateButton(X, Y, Width, Height, "Gun 2", true, wdwGun)
    X = 0.415
    Y = 0.2
    gunThreeBtn = guiCreateButton(X, Y, Width, Height, "Gun 3", true, wdwGun)
    Y = 0.4
    gunFourBtn = guiCreateButton(X, Y, Width, Height, "Gun 4", true, wdwGun)
    X = 0.0825
    Y = 0.6
    gunFiveBtn = guiCreateButton(X, Y, Width, Height, "Gun 5", true, wdwGun)
    guiSetVisible(wdwGun, false)

    -- Add event handlers for buttons
    addEventHandler("onClientGUIClick", gunOneBTn, clientGunChoice, false)
    addEventHandler("onClientGUIClick", gunTwoBtn, clientGunChoice, false)
    addEventHandler("onClientGUIClick", gunThreeBtn, clientGunChoice, false)
    addEventHandler("onClientGUIClick", gunFourBtn, clientGunChoice, false)
    addEventHandler("onClientGUIClick", gunFiveBtn, clientGunChoice, false)
end

function clientGunChoice(button, state)
    if button == "left" and state == "up" then
        local gunID
        if source == gunOneBTn then
            gunID = 31
        elseif source == gunTwoBtn then
            gunID = 30
        elseif source == gunThreeBtn then
            gunID = 34
        elseif source == gunFourBtn then
            gunID = 28
        elseif source == gunFiveBtn then
            gunID = 24
        end
        if gunID then
            triggerServerEvent("gunSpawn", getLocalPlayer(), gunID)
            guiSetVisible(wdwGun, false)
            showCursor(false)
            outputChatBox("Requested weapon spawn: " .. gunIDgunID)
        end
    end
end

addEvent("showGunSpawnWindow", true)
addEventHandler("showGunSpawnWindow", root,
    function()
        if not wdwGun then
            createGunSpawnWindow()
        end
        guiSetVisible(wdwGun, true)
        showCursor(true)
        outputChatBox("Gun spawn window displayed.")
    end
)
