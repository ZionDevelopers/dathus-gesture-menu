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