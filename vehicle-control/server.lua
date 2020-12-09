-- T R U N K --
RegisterCommand('trunk', function(source, args, user)
	TriggerClientEvent('trunk', source)
end, false)

-- A L L  D O O R S --
RegisterCommand('door', function(source, args, user)
	if args[1] ~= nil then
		local door = tonumber(args[1])
		if door < 4 and door > -1 then
			TriggerClientEvent('ChangeDoor', source, (door-1))	
		end
	else
		TriggerClientEvent('ChangeDoor', source, 0)		
	end
end, false)

-- R E A R  D O O R S --
RegisterCommand('fdoor', function(source, args, user)
	if args[1] ~= nil then
		if args[1] == "p" or args[1] == "2" then
			TriggerClientEvent('ChangeDoor', source, 1)
		else 
			TriggerClientEvent('ChangeDoor', source, 0)	
		end
	else
			TriggerClientEvent('ChangeDoor', source, 0)		
	end
end, false)

-- R E A R  D O O R S --
RegisterCommand('rdoor', function(source, args, user)
	if args[1] == "p" or args[1] == "2" then
		TriggerClientEvent('ChangeDoor', source, 3)
	else 
		TriggerClientEvent('ChangeDoor', source, 2)
	end
end, false)

-- H O O D --
RegisterCommand('hood', function(source, args, user)
	TriggerClientEvent('hood', source)
end, false)