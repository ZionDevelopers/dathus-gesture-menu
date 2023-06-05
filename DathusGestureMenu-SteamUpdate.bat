@echo off
cd /d "V:\SteamLibrary\SteamApps\common\GarrysMod\bin"
gmad.exe create -folder "D:\Github\dathus-gesture-menu" -out "D:\Github\dathus-gesture-menu.gma"
gmpublish update -addon "D:\Github\dathus-gesture-menu.gma" -id "145640726" -changes "Change it later"
pause