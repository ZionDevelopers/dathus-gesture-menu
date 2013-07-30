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
 Version 1.2.1 by Nexus [BR] on 30-07-2013 10:38 AM
]]

-- Add Hook for MenuPar Polulate
hook.Add( "PopulateMenuBar", "", function( menubar )

	-- Get / Add Context Menu Bar: Nexus Gestures
	local mbar = menubar:AddOrGetMenu( "Nexus Gestures" )
	local ChatCommand = ""
	local bt = nil
	
	-- Loop on Act List
	for Command, Label in pairs(NexusGestureMenuOptions) do		
		-- If Command is Valid
		if(Command ~= nil) then
			-- Remove Spaces
			ChatCommand = string.Replace(Label, " ", "")
			-- Convert string to Lower
			ChatCommand = string.lower(ChatCommand)
			
			bt = mbar:AddOption( Label , function() ProcessGesture(Command) end)	
			bt:SetTooltip("/"..ChatCommand)				
		end
	end
	
	mbar:AddSpacer()
	
	mbar:AddCVar( "Gestures Loop", "NexusGMLoop", "1", "0" )
	mbar:AddCVar( "Gestures Sound", "NexusGMSound", "1", "0" )		
end )