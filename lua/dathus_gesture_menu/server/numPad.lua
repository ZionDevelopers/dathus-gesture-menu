--[[ 
 Dathus' Gesture Menu
 
 Copyright (c) 2011 - 2025 Dathus [BR] <https://www.juliocesar.me>
 
 This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License.
 To view a copy of this license, visit Common Creative's Website. <https://creativecommons.org/licenses/by-nc-sa/4.0/>
 
 $Id$
 Version 1.3 by Dathus [BR] on 2023-06-05 09:00 PM (GMT -03)
]]

-- Add Command
concommand.Add("DathusGMRegisterKey", function(ply, com, args)
	-- If Key Pressed
	if ply.DathusGMKeyID ~= nil then
		-- Remove Keypad ID
		numpad.Remove( ply.DathusGMKeyID )
	end
	
	-- Perform KeyPress Action
	ply.DathusGMKeyID = numpad.OnDown(ply, tonumber(args[1]), "DathusGMOpen")	
end)

-- Register Keypad Button
numpad.Register("DathusGMOpen", function (ply)
	-- Start Connection			
	net.Start("DathusGestureMenuOpen")
	-- Send Command To Player
	net.Send(ply)		
	return true
end)
