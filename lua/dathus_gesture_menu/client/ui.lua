--[[ 
 Dathus' Gesture Menu
 
 Copyright (c) 2011 - 2026 Dathus [BR] <https://www.juliocesar.me>
 
 This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License.
 To view a copy of this license, visit Common Creative's Website. <https://creativecommons.org/licenses/by-nc-sa/4.0/>
 
 $Id$
 Version 1.3 by Dathus [BR] on 2023-06-05 09:00 PM (GMT -03)
]]

-- Setup Vars
local loopCurrentGesture = ""
local loopGesture = false

-- Setup Do Gesture Function
local function DoGesture(gesture)
	-- Check if Player are Taunting
	if not LocalPlayer():IsPlayingTaunt() then
		-- If there is Sound to Play
		if DathusGestureMenuSounds[gesture] ~= "" and GetConVar("DathusGMSound"):GetInt() == 1 then
			-- Start Packet
			net.Start("DathusGestureMenuPlaySound")
			-- Send Soudns Table
			net.WriteTable(DathusGestureMenuSounds[gesture])
			-- Send to the Server
			net.SendToServer()
		end
		
		-- Run ACT
		RunConsoleCommand("act", gesture)
	end
end

-- Setup Loop
local function GestureLoop()
	if GetConVar("DathusGMLoop"):GetInt() == 1 and not LocalPlayer():IsPlayingTaunt() then
		DoGesture(loopCurrentGesture)
	elseif GetConVar("DathusGMLoop"):GetInt() == 0 then
		loopGesture = false
		loopCurrentGesture = ""
		timer.Destroy("loopGesture")	
	end
end

-- Setup Do Gesture Function
function ProcessGesture(gesture)
	-- Check if Loop is Turned OFF
	if GetConVar("DathusGMLoop"):GetInt() == 0 and loopGesture == false then
		-- Run ACT
		DoGesture(gesture)
	elseif GetConVar("DathusGMLoop"):GetInt() == 1 and loopGesture == false then
		loopGesture = true
		loopCurrentGesture = gesture
		-- Run ACT
		DoGesture(gesture)
		timer.Create("loopGesture", 0.5, 0, GestureLoop)
	elseif GetConVar("DathusGMLoop"):GetInt() == 0 and loopGesture == true then
		loopGesture = false
		loopCurrentGesture = ""
		timer.Destroy("loopGesture")
	end	
end

-- Setup Gesture Menu Action	
local function DathusGestureMenuAction(len)
	-- Get Command
	local Command = net.ReadString()
	-- Run ACT
	ProcessGesture(Command)
end

-- Setup Gesture Menu Action	
local function DathusGestureMenuOpen(len)
	-- Run Open Menu
	RunConsoleCommand("dathus_gesture_menu")
end

-- Start Gesture Menu Action
net.Receive("DathusGestureMenuAction", DathusGestureMenuAction)
-- Start Gesture Menu Action
net.Receive("DathusGestureMenuOpen", DathusGestureMenuOpen)

-- Setup Gesture Menu
local function OpenDathusGestureMenu()

	-- If Gesture Menu is already loaded
	if GestureMenu == nil then
		-- Setup Menu Initial Height
		local MenuHeight = 40
		
		-- Loop on Act List
		for Command, Label in pairs(DathusGestureMenuOptions) do
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
		GestureMenu:SetTitle("Dathus' Gesture Menu")
		GestureMenu:SetDeleteOnClose(true)
		
		-- Reset I Counter
		i = 0
		
		-- Loop on Act List
		for Command, Label in pairs(DathusGestureMenuOptions) do
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
		loop:SetConVar("DathusGMLoop")
		loop:SetValue(tonumber(GetConVar("DathusGMLoop"):GetInt()))  
		loop:SizeToContents()
		
		local sound = vgui.Create("DCheckBoxLabel", GestureMenu)
		sound:SetPos(110, MenuHeight-30)
		sound:SetText("Sound") 
		sound:SetConVar("DathusGMSound")
		sound:SetValue(tonumber(GetConVar("DathusGMSound"):GetInt()))  
		sound:SizeToContents()
		
		-- Finish to Setup Gesture Menu Window
		GestureMenu:SetVisible(true)
		GestureMenu:SetDraggable(true)
		GestureMenu:ShowCloseButton(true)
		
		-- Create A PopUp Window for Gesture Menu
		GestureMenu:MakePopup()
	end
end

-- Add Gesture Menu Command
concommand.Add("dathus_gesture_menu", OpenDathusGestureMenu)