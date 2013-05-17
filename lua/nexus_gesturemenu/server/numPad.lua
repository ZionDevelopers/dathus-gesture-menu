--[[ 
 Nexus Gesture Menu
 
 Copyright (c) 2013 Nexus [BR] <http://www.nexusbr.net>
 
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
 Version 1.1.0 by Nexus [BR] on 17-05-2013 02:24 PM
]]

-- Add Command
concommand.Add("NexusGMRegisterKey", function(ply, com, args)
	-- If Key Pressed
	if ply.NexusGMKeyID != nil then
		-- Remove Keypad ID
		numpad.Remove( ply.NexusGMKeyID )
	end
	
	-- Perform KeyPress Action
	ply.NexusGMKeyID = numpad.OnDown(ply, tonumber(args[1]), "NexusGMOpen")	
end)

-- Register Keypad Button
numpad.Register("NexusGMOpen", function (ply)
	-- Start Connection			
	net.Start("NexusGestureMenuOpen")
	-- Send Command To Player
	net.Send(ply)		
	return true
end)
