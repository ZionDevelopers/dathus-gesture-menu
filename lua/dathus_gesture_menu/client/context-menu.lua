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

-- Add Hook for MenuPar Polulate
hook.Add( "PopulateMenuBar", "", function( menubar )

	-- Get / Add Context Menu Bar: Dathus Gesture Menu
	local mbar = menubar:AddOrGetMenu( "Dathus' Gesture Menu" )
	local ChatCommand = ""
	local bt = nil
	
	-- Loop on Act List
	for Command, Label in pairs(DathusGestureMenuOptions) do		
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
	
	mbar:AddCVar( "Loop", "DathusGMLoop", "1", "0" )
	mbar:AddCVar( "Sound", "DathusGMSound", "1", "0" )		
end )