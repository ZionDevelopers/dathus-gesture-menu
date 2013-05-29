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

-- Setup Vars
local loopCurrentGesture = ""
local loopGesture = false

-- Setup Do Gesture Function
local function DoGesture(gesture)
	-- Check if Player are Taunting
	if not LocalPlayer():IsPlayingTaunt() then
		-- If there is Sound to Play
		if NexusGestureMenuSounds[gesture] ~= "" and GetConVar("NexusGMSound"):GetInt() == 1 then
			-- Start Packet
			net.Start("NexusGestureMenuPlaySound")
			-- Send Soudns Table
			net.WriteTable(NexusGestureMenuSounds[gesture])
			-- Send to the Server
			net.SendToServer()
		end
		
		-- Run ACT
		RunConsoleCommand("act", gesture)
	end
end

-- Setup Loop
local function GestureLoop()
	if GetConVar("NexusGMLoop"):GetInt() == 1 and not LocalPlayer():IsPlayingTaunt() then
		DoGesture(loopCurrentGesture)
	elseif GetConVar("NexusGMLoop"):GetInt() == 0 then
		loopGesture = false
		loopCurrentGesture = ""
		timer.Destroy("loopGesture")	
	end
end

-- Setup Do Gesture Function
local function ProcessGesture(gesture)
	-- Check if Loop is Turned OFF
	if GetConVar("NexusGMLoop"):GetInt() == 0 and loopGesture == false then
		-- Run ACT
		DoGesture(gesture)
	elseif GetConVar("NexusGMLoop"):GetInt() == 1 and loopGesture == false then
		loopGesture = true
		loopCurrentGesture = gesture
		-- Run ACT
		DoGesture(gesture)
		timer.Create("loopGesture", 0.5, 0, GestureLoop)
	elseif GetConVar("NexusGMLoop"):GetInt() == 0 and loopGesture == true then
		loopGesture = false
		loopCurrentGesture = ""
		timer.Destroy("loopGesture")
	end	
end

-- Setup Gesture Menu Action	
local function NexusGestureMenuAction(len)
	-- Get Command
	local Command = net.ReadString()
	-- Run ACT
	ProcessGesture(Command)
end

-- Setup Gesture Menu Action	
local function NexusGestureMenuOpen(len)
	-- Run Open Menu
	RunConsoleCommand("nexus_gesturemenu")
end

-- Start Gesture Menu Action
net.Receive("NexusGestureMenuAction", NexusGestureMenuAction)
-- Start Gesture Menu Action
net.Receive("NexusGestureMenuOpen", NexusGestureMenuOpen)

-- Setup Gesture Menu
local function OpenNexusGestureMenu()

	-- If Gesture Menu is already loaded
	if GestureMenu ~= nil then
		-- Make it Invisible
		GestureMenu:Close()
	end
	
	-- Setup Menu Initial Height
	local MenuHeight = 40
	
	-- Loop on Act List
	for Command, Label in pairs(NexusGestureMenuOptions) do
		-- If Command is Valid
		if Command ~= nil then
			-- Increase the Menu Height
			MenuHeight = MenuHeight + 30
		end
	end
	
	-- Setup Gesture Menu Window
	local GestureMenu = vgui.Create("DFrame")
	GestureMenu:SetPos((ScrW()/4)-100,(ScrH()/2)-(MenuHeight/2))
	GestureMenu:SetSize(220, MenuHeight)
	GestureMenu:SetTitle("Nexus Gesture Menu")
	
	-- Reset I Counter
	i = 0
	
	-- Loop on Act List
	for Command, Label in pairs(NexusGestureMenuOptions) do
		-- If Command is Valid
		if(Command ~= nil) then
			-- Remove Spaces
			ChatCommand = string.Replace(Label, " ", "")
			-- Convert string to Lower
			ChatCommand = string.lower(ChatCommand)
			
			-- Setup Act Button
			local Button = vgui.Create("DButton", GestureMenu)
			Button:SetText(Label)
			Button:SetSize(180,20)
			Button:SetPos(20,65+(28*(i-1)))
			Button:SetTooltip("/"..ChatCommand)
			Button.DoClick = function()
				ProcessGesture(Command)
			end
			
			-- Increase I Counter
			i = i + 1
		end
	end
	
	
	local loop = vgui.Create("DCheckBoxLabel", GestureMenu)
	loop:SetPos(50, MenuHeight-30)
	loop:SetText("Loop") 
	loop:SetConVar("NexusGMLoop")
	loop:SetValue(tonumber(GetConVar("NexusGMLoop"):GetInt()))  
	loop:SizeToContents()
	
	local sound = vgui.Create("DCheckBoxLabel", GestureMenu)
	sound:SetPos(110, MenuHeight-30)
	sound:SetText("Sound") 
	sound:SetConVar("NexusGMSound")
	sound:SetValue(tonumber(GetConVar("NexusGMSound"):GetInt()))  
	sound:SizeToContents()
	
	-- Finish to Setup Gesture Menu Window
	GestureMenu:SetVisible(true)
	GestureMenu:SetDraggable(true)
	GestureMenu:ShowCloseButton(true)
	
	-- Create A PopUp Window for Gesture Menu
	GestureMenu:MakePopup()
end

-- Add Gesture Menu Command
concommand.Add("nexus_gesturemenu", OpenNexusGestureMenu)