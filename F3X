-- not done lul

local Lib = {}

local Players = game:GetService("Players")
local Client = Players.LocalPlayer

function Lib.Init()
	local serverEndpoint = Client.Character:FindFirstChild("ServerEndpoint", true) or Client:FindFirstChild("ServerEndpoint", true)
	local Functions = {}
	
	function Functions.Anchor(part, anchored)
		serverEndpoint:InvokeServer("SyncAnchor", {{["Part"] = part, ["Anchored"] = anchored}})
	end
	
	function Functions.Destroy(part)
		serverEndpoint:InvokeServer("Remove", {part})
	end
    
    function Functions.Move(part, posX, posY, posZ)
        serverEndpoint:InvokeServer("SyncMove",{{["Part"] = part,["CFrame"] = CFrame.new(posX, posY, posZ, 1, 0, 0, 0, 1, 0, 0, 0, 1)}})
    end
    return Functions
end
return Lib
