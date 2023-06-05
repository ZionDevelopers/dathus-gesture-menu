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
