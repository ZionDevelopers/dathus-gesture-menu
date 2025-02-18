--[[ 
 Dathus' Gesture Menu
 
 Copyright (c) 2011 - 2025 Dathus [BR] <https://www.juliocesar.me>
 
 This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License.
 To view a copy of this license, visit Common Creative's Website. <https://creativecommons.org/licenses/by-nc-sa/4.0/>
 
 $Id$
 Version 1.3 by Dathus [BR] on 2023-06-05 09:00 PM (GMT -03)
]]

-- Setup Apply Key Function
local function applyGestureMenuKey()
	RunConsoleCommand( "DathusGMRegisterKey", GetConVarNumber("DathusGMBindKey") )
end 
	
-- Setup Panel
local function buildPanelKey(panel)
	-- Clear Controls
	panel:ClearControls()
	-- Add Panel Elements
	panel:AddControl("Header", {Text = "Key"})	
	panel:AddControl("Numpad", {Label = "Gesture Menu Key", Command = "DathusGMBindKey", ButtonSize = "18"})	
	
	-- Add Buton to Apply									 
	local Button = vgui.Create("DButton") 
	Button:SetSize(50, 20)
	Button:SetText("Apply")
	Button.DoClick = function( button )
		-- Run Apply on Click
		applyGestureMenuKey()
	end
	
	-- Add Buton to panel		
	panel:AddItem(Button)										 
end

-- Generate Menu On Open
local function spawnMenuOpen()
	buildPanelKey(controlpanel.Get( "GestureMenu"))
end

-- Add Hook Spawn Menu Open
hook.Add( "SpawnMenuOpen", "GestureMenuSpawnMenuOpen", spawnMenuOpen)
 
-- Setup Populate Menu
local function popToolMenu()
	spawnmenu.AddToolMenuOption("Options", "Dathus' Gesture Menu", "Key", "Key", "", "", buildPanelKey)
end

-- Add Hook to Populate Menu
hook.Add("PopulateToolMenu", "GestureMenuPopulatePanel", popToolMenu)

-- Setup Timer for Apply on Start
timer.Create( "RetardedApplyKeyDelay", 1, 1, function()
	-- Apply New Key
	applyGestureMenuKey()
end)
