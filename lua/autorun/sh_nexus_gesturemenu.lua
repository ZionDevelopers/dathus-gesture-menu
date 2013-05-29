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
 Version 1.2.0 by Nexus [BR] on 29-05-2013 03:34 PM
]]

-- Require Gesture List
include("nexus_gesturemenu/shared/gestures.lua")

if SERVER then
	-- Add Files to Client
	AddCSLuaFile()
	AddCSLuaFile("nexus_gesturemenu/client/ui.lua")
	AddCSLuaFile("nexus_gesturemenu/client/panel.lua")
	AddCSLuaFile("nexus_gesturemenu/shared/gestures.lua")
	
	-- Add Network Strings to Pool
	util.AddNetworkString("NexusGestureMenuOpen")
	util.AddNetworkString("NexusGestureMenuAction")
	util.AddNetworkString("NexusGestureMenuPlaySound")
	
	-- Require Chat Commands
	include("nexus_gesturemenu/server/chatCommands.lua")
	-- Require NumPad Register
	include("nexus_gesturemenu/server/numPad.lua")
	-- Require Core
	include("nexus_gesturemenu/server/core.lua")
else	
	-- Register Client ConVar
	CreateClientConVar("NexusGMBindKey", 0, true, false)
	CreateClientConVar("NexusGMLoop", 0, true, false)
	CreateClientConVar("NexusGMSound", 0, true, false)
	
	-- Require Gesture Menu UI
	include("nexus_gesturemenu/client/ui.lua")	
	-- Require Gesture Menu Panel
	include("nexus_gesturemenu/client/panel.lua")
end