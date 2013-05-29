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
		for Gesture, Label in pairs(NexusGestureMenuOptions) do
			-- Remove Spaces
			Test = string.Replace(Label, " ", "")
			-- Convert string to Lower
			Test = string.lower(Test)

			-- if This Act is the User Command
			if command == Test then	
				-- Start Connection			
				net.Start("NexusGestureMenuAction")
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
hook.Add("PlayerSay", "NexusGestureMenuCommands", GestureByChat)