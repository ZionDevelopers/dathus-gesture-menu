--[[ 
 Dathus' Gesture Menu
 
 Copyright (c) 2011 - 2026 Dathus [BR] <https://www.juliocesar.me>
 
 This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License.
 To view a copy of this license, visit Common Creative's Website. <https://creativecommons.org/licenses/by-nc-sa/4.0/>
 
 $Id$
 Version 1.3 by Dathus [BR] on 2023-06-05 09:00 PM (GMT -03)
]]

-- Setup Sound Function
local function DathusGesturePlaySound(len, ply)
	-- Get Sounds Table
	local sounds = net.ReadTable()
	-- Get Player Model
	local model = ply:GetModel()
	local sound = ""
	
	-- If Player model is Female
	if (string.find(model, "female") or string.find(model, "mossman") or string.find(model, "alyx") or string.find(model, "chell") or string.find(model, "police_fem")) and sounds["female"] ~= nil then
		-- Get a Random Sound
		sound = table.Random(sounds["female"])
	else
		-- Get a Random Sound
		sound = table.Random(sounds["male"])
	end
	
	-- Play a Sound On a Player
	ply:EmitSound(sound, 500, 100)
end

-- Play Sound
net.Receive("DathusGestureMenuPlaySound", DathusGesturePlaySound)