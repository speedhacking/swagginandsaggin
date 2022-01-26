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
        serverEndpoint:InvokeServer("SyncMove", {{["Part"] = part, ["CFrame"] = CFrame.new(posX, posY, posZ)}})
    end

    function Functions.Color(part, r, g, b)
        serverEndpoint:InvokeServer("SyncColor",{{["Part"] = part,["Color"] = Color3.fromRGB(r, g, b),["UnionColoring"] = true}})
    end

    function Functions.Decorate(part, type)
        serverEndpoint:InvokeServer("CreateDecorations",{{["Part"] = part, ["DecorationType"] = type}})
    end

    function Functions.editDecorate(part, type, edit, val)
        serverEndpoint:InvokeServer("SyncDecorate",{{["Part"] = part, ["DecorationType"] = type,[edit] = val}})
    end

    function Functions.Light(part, type)
        serverEndpoint:InvokeServer("CreateLights",{{["Part"] = part, ["LightType"] = type}})
    end

    function Functions.editLight(part, type, edit, val)
        serverEndpoint:InvokeServer("SyncLighting",{{["Part"] = part, ["LightType"] = type,[edit] = val}})
    end
    return Functions
end
return Lib
