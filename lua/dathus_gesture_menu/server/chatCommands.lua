--[[ 
 Dathus' Gesture Menu
 
 Copyright (c) 2011 - 2024 Dathus [BR] <https://www.juliocesar.me>
 
 This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License.
 To view a copy of this license, visit Common Creative's Website. <https://creativecommons.org/licenses/by-nc-sa/4.0/>
 
 $Id$
 Version 1.3 by Dathus [BR] on 2023-06-05 09:00 PM (GMT -03)
]]

-- Setup Gesture by Chat
local function GestureByChat (ply, text, isTeamChat) 
	-- Convert to Lower
	text = text:lower()
	
	local params = {}
	local param = ""
	local command = ""
	local Test = ""
	
	-- If is a Command
	if text:sub(1,1) == "/" then
	
		-- Check if got Params
		if string.find(text," ") then
			-- Split Space into Params
			params = text:split(" ")
			-- Get Command
			command = string.lower(string.Replace(params[1], "/", ""))
			-- Check if there is a parameter
			if(params[2] ~= nil) then
				-- Define param
				param = string.lower(params[2])
			else
				command = string.lower(string.Replace(text, "/", ""))
				param = ""
			end
		else
			command = string.lower(string.Replace(text, "/", ""))
			param = ""			
		end
		
		-- Loop on all Acts
		for Gesture, Label in pairs(DathusGestureMenuOptions) do
			-- Remove Spaces
			Test = string.Replace(Label, " ", "")
			-- Convert string to Lower
			Test = string.lower(Test)

			-- if This Act is the User Command
			if command == Test then	
				-- Start Connection			
				net.Start("DathusGestureMenuAction")
				-- Write Command
				net.WriteString(Gesture)
				
				if((param == "all" or param == "*") and ply:IsAdmin()) then
					-- Send Command To Player
					net.Broadcast()
				else 
					net.Send(ply)	
				end
				
				-- Delete chat Entry
				return ""
			end
		end	
	end
end

-- Add PlayerSay Hook for Gesture by Chat
hook.Add("PlayerSay", "DathusGestureMenuCommands", GestureByChat)