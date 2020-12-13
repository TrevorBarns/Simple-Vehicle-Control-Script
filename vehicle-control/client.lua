-- C O N F I G --
interactionDistance = 3 --The radius you have to be in to interact with the vehicle.

--  V A R I A B L E S --
ped = nil
inVehicle = nil
ped_pos = nil
inFrontOfPlayer = nil
vehId = nil
distanceToVeh = nil

-- T R U N K --
RegisterNetEvent('trunk')
AddEventHandler('trunk',function() 
	if GetVehicle() == true and distanceToVeh <= interactionDistance then
		if GetVehicleDoorAngleRatio(vehId, 5) == 0 then
			if GetVehicleDoorsLockedForPlayer(vehId) == false then
				SetVehicleDoorOpen(vehId,5,0,0)
			else
				ShowNotification("~r~Vehicle is locked.")
			end
		else
			SetVehicleDoorShut(vehId,5,0)
		end
	else
		ShowNotification("~r~You must be near your vehicle to do that.")
	end
end)

-- H O O D --
RegisterNetEvent('hood')
AddEventHandler('hood',function()
	if GetVehicle() == true and distanceToVeh <= interactionDistance then
		if GetVehicleDoorAngleRatio(vehId, 4) == 0 then
			if GetVehicleDoorsLockedForPlayer(vehId) == false then
				SetVehicleDoorOpen(vehId,4,0,0)
			else
				ShowNotification("~r~Vehicle is locked.")
			end
		else
			SetVehicleDoorShut(vehId,4,0)
		end
	else
		ShowNotification("~r~You must be near your vehicle to do that.")
	end
end)

RegisterNetEvent('ChangeDoor')
AddEventHandler('ChangeDoor',function(door) 
	if GetVehicle() == true and distanceToVeh <= interactionDistance then
		local fd = GetVehicleDoorAngleRatio(vehId,0)
		local fp = GetVehicleDoorAngleRatio(vehId,1)
		local rd = GetVehicleDoorAngleRatio(vehId,2)
		local rp = GetVehicleDoorAngleRatio(vehId,3)
		if (door == 0) then
			if (fd > 0) then
				SetVehicleDoorShut(vehId,0,0)
			else
				if GetVehicleDoorsLockedForPlayer(vehId) == false then
					SetVehicleDoorOpen(vehId,0,0,0)
				else
					ShowNotification("~r~Vehicle is locked.")
				end
			end
		elseif (door == 1) then
			if (fp > 0) then
				SetVehicleDoorShut(vehId,1,0)
			else
				if GetVehicleDoorsLockedForPlayer(vehId) == false then
					SetVehicleDoorOpen(vehId,1,0,0)
				else
					ShowNotification("~r~Vehicle is locked.")
				end
			end
		elseif (door == 2) then
			if (rd > 0) then
				SetVehicleDoorShut(vehId,2,0)
			else
				if GetVehicleDoorsLockedForPlayer(vehId) == false then
					SetVehicleDoorOpen(vehId,2,0,0)
				else
					ShowNotification("~r~Vehicle is locked.")
				end
			end	
		elseif (door == 3) then
			if (rp > 0) then
				SetVehicleDoorShut(vehId,3,0)
			else
				if GetVehicleDoorsLockedForPlayer(vehId) == false then
					SetVehicleDoorOpen(vehId,3,0,0)
				else
					ShowNotification("~r~Vehicle is locked.")
				end
			end
		end
	else
		ShowNotification("~r~You must be near your vehicle to do that.")
	end
end)


function GetVehicle()
	ped = GetPlayerPed(PlayerId())
	inVehicle = IsPedInAnyVehicle(ped, true)
	ped_pos = nil
	inFrontOfPlayer = nil
	vehId = nil
	distanceToVeh = nil
	
	if not inVehicle then
	if not inVehicle then
		ped_pos = GetEntityCoords(ped)
		inFrontOfPlayer = GetOffsetFromEntityInWorldCoords( ped, 0.0, interactionDistance, 0.0 )
		vehId = GetVehicleInDirection( ped, ped_pos, inFrontOfPlayer )
		if vehId ~= nil then
			distanceToVeh = GetDistanceBetweenCoords(GetEntityCoords(ped), GetEntityCoords(vehId), 1)
		end
	else
		vehId = GetVehiclePedIsIn(ped, true)
		distanceToVeh = GetDistanceBetweenCoords(GetEntityCoords(ped), GetEntityCoords(vehId), 1)
	end
	
	if distanceToVeh ~= nil then
		return true
	else
		return false
	end
end

function ShowNotification( text )
    SetNotificationTextEntry( "STRING" )
    AddTextComponentString( text )
    DrawNotification( false, false )
end

-- Credit to Konijima
function GetVehicleInDirection( entFrom, coordFrom, coordTo )
	local rayHandle = StartShapeTestCapsule( coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z, interactionDistance+0.0, 10, entFrom, 7 )
    local _, _, _, _, vehicle = GetShapeTestResult( rayHandle )
    
    if ( IsEntityAVehicle( vehicle ) ) then 
        return vehicle
    end 
end
