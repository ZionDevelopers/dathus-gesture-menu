--[[ 
 Dathus' Gesture Menu
 
 Copyright (c) 2011 - 2026 Dathus [BR] <https://www.juliocesar.me>
 
 This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License.
 To view a copy of this license, visit Common Creative's Website. <https://creativecommons.org/licenses/by-nc-sa/4.0/>
 
 $Id$
 Version 1.3 by Dathus [BR] on 2023-06-05 09:00 PM (GMT -03)
]]

-- Require Gesture List
include("dathus_gesture_menu/shared/gestures.lua")

--Setup Loading Log Formatation
function loadingLog (text)
  --Set Max Size
  local size = 32
  --If Text Len < max size
  if(string.len(text) < size) then
    -- Format the text to be Text+Spaces*LeftSize
    text = text .. string.rep( " ", size-string.len(text) )
  else
    --If Text is too much big then cut and add ...
    text = string.Left( text, size-3 ) .. "..."
  end
  --Log Messsage
  Msg( "||  "..text.."||\n" )
end

Msg( "\n/====================================\\\n")
Msg( "||       Dathus' Gesture Menu       ||\n" )
Msg( "||----------------------------------||\n" )
loadingLog("Version 1.3.0")
loadingLog("Updated on 2023-06-05 9:00 PM")
Msg( "\\====================================/\n\n" )

if SERVER then
	-- Add Files to Client
	AddCSLuaFile()
	AddCSLuaFile("dathus_gesture_menu/client/ui.lua")
	AddCSLuaFile("dathus_gesture_menu/client/panel.lua")
	AddCSLuaFile("dathus_gesture_menu/client/context-menu.lua")
	AddCSLuaFile("dathus_gesture_menu/shared/gestures.lua")
	
	-- Add Network Strings to Pool
	util.AddNetworkString("DathusGestureMenuOpen")
	util.AddNetworkString("DathusGestureMenuAction")
	util.AddNetworkString("DathusGestureMenuPlaySound")
	
	-- Require Chat Commands
	include("dathus_gesture_menu/server/chatCommands.lua")
	-- Require NumPad Register
	include("dathus_gesture_menu/server/numPad.lua")
	-- Require Core
	include("dathus_gesture_menu/server/core.lua")
else	
	-- Register Client ConVar
	CreateClientConVar("DathusGMBindKey", 0, true, false)
	CreateClientConVar("DathusGMLoop", 0, true, false)
	CreateClientConVar("DathusGMSound", 0, true, false)
	
	-- Require Gesture Menu UI
	include("dathus_gesture_menu/client/ui.lua")	
	-- Require Gesture Menu Panel
	include("dathus_gesture_menu/client/panel.lua")
	-- Require Gesture Menu Context-Menu
	include("dathus_gesture_menu/client/context-menu.lua")
end