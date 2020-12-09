-- C O N F I G --
interactionDistance = 4 --The radius you have to be in to interact with the vehicle.
lockDistance = 25 --The radius you have to be in to lock your vehicle.

--  V A R I A B L E S --
engineoff = false
saved = false
controlsave_bool = false

-- T R U N K --
RegisterNetEvent('trunk')
AddEventHandler('trunk',function() 
	local player = GetPlayerPed(-1)
		if controlsave_bool == true then
			vehicle = saveVehicle
		else
			vehicle = GetVehiclePedIsIn(player,true)
		end
		
		local isopen = GetVehicleDoorAngleRatio(vehicle,5)
		local distanceToVeh = GetDistanceBetweenCoords(GetEntityCoords(player), GetEntityCoords(vehicle), 1)
		
		if distanceToVeh <= interactionDistance then
			if (isopen == 0) then
			SetVehicleDoorOpen(vehicle,5,0,0)
			else
			SetVehicleDoorShut(vehicle,5,0)
			end
		else
			ShowNotification("~r~You must be near your vehicle to do that.")
		end
end)

-- H O O D --
RegisterNetEvent('hood')
AddEventHandler('hood',function() 
	local player = GetPlayerPed(-1)
	if controlsave_bool == true then
		vehicle = saveVehicle
	else
		vehicle = GetVehiclePedIsIn(player,true)
	end
		
	local isopen = GetVehicleDoorAngleRatio(vehicle,4)
	local distanceToVeh = GetDistanceBetweenCoords(GetEntityCoords(player), GetEntityCoords(vehicle), 1)
	
	if distanceToVeh <= interactionDistance then
		if (isopen == 0) then
		SetVehicleDoorOpen(vehicle,4,0,0)
		else
		SetVehicleDoorShut(vehicle,4,0)
		end
	else
		ShowNotification("~r~You must be near your vehicle to do that.")
	end
end)

RegisterNetEvent('ChangeDoor')
AddEventHandler('ChangeDoor',function(door) 
	print("netevent changedoor receieved")
	local player = GetPlayerPed(-1)
	local vehicle = GetVehiclePedIsIn(player,true)
	
	local fd = GetVehicleDoorAngleRatio(vehicle,0)
	local fp = GetVehicleDoorAngleRatio(vehicle,1)
	local rd = GetVehicleDoorAngleRatio(vehicle,2)
	local rp = GetVehicleDoorAngleRatio(vehicle,3)
	local distanceToVeh = GetDistanceBetweenCoords(GetEntityCoords(player), GetEntityCoords(vehicle), 1)
	
	if (distanceToVeh <= interactionDistance) then
		if (door == 0) then
			if (fd > 0) then
				SetVehicleDoorShut(vehicle,0,0)
			else
				SetVehicleDoorOpen(vehicle,0,0,0)
			end
		elseif (door == 1) then
			if (fp > 0) then
				SetVehicleDoorShut(vehicle,1,0)
			else
				SetVehicleDoorOpen(vehicle,1,0,0)
			end
		elseif (door == 2) then
			if (rd > 0) then
				SetVehicleDoorShut(vehicle,2,0)
			else
				SetVehicleDoorOpen(vehicle,2,0,0)
			end	
		elseif (door == 3) then
			if (rp > 0) then
				SetVehicleDoorShut(vehicle,3,0)
			else
				SetVehicleDoorOpen(vehicle,3,0,0)
			end
		end
	else
		ShowNotification("~r~You must be near your vehicle to do that.")
	end
end)


function ShowNotification( text )
    SetNotificationTextEntry( "STRING" )
    AddTextComponentString( text )
    DrawNotification( false, false )
end
