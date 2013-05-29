local function NexusGesturePlaySound(len, ply)
	local sounds = net.ReadTable()
	local model = ply:GetModel()
	local sound = ""
	
	if (string.find(model, "female") or string.find(model, "mossman") or string.find(model, "alyx")) and sounds["female"] ~= nil then
		sound = table.Random(sounds["female"])
	else
		sound = table.Random(sounds["male"])
	end
	
	ply:EmitSound(sound, 500, 100)
end

-- Play Sound
net.Receive("NexusGestureMenuPlaySound", NexusGesturePlaySound)