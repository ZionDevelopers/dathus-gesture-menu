--[[ 
 Dathus' Gesture Menu
 
 Copyright (c) 2013-2023 Dathus [BR] <http://www.Dathusbr.net>
 
 This program is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 2 of the License, or
 (at your option) any later version.
 
 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.
 
 You should have received a copy of the GNU General Public License
 along with this program.  If not, see <http://www.gnu.org/licenses/>.
 
 $Id$
 Version 1.3.X by Dathus [BR] on 2023-06-05 08:00 PM (GMT -03)
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
