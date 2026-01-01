--[[ 
 Dathus' Gesture Menu
 
 Copyright (c) 2011 - 2026 Dathus [BR] <https://www.juliocesar.me>
 
 This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License.
 To view a copy of this license, visit Common Creative's Website. <https://creativecommons.org/licenses/by-nc-sa/4.0/>
 
 $Id$
 Version 1.3 by Dathus [BR] on 2023-06-05 09:00 PM (GMT -03)
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