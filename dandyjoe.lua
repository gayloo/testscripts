local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "toe v0.1",IntroText = "toe, you! again", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

local tab = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local pl = game.Players.LocalPlayer
local char = pl.Character
local humanoid = char:WaitForChild("Humanoid")

local table = {
	speed = 0
}

tab:AddSlider({
	Name = "Walk speed",
	Min = 0,
	Max = 100,
	Default = 16,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "Walk speed",
	Callback = function(Value)
		table.speed = Value
	end    
})


local on = false

tab:AddButton({
	Name = "Change walk speed",
	Callback = function(bool)
		while wait() do
			humanoid.WalkSpeed = table.speed
		end
	end

})



local runservice = game:GetService("RunService")
local esp = Instance.new("Highlight")
esp.Name = "hl"
esp.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
esp.OutlineTransparency = 1


tab:AddButton({
	Name = "Esp stuff",
	Callback = function()

		for _,k in pairs(game.Workspace.CurrentRoom:GetChildren()) do
			if k:IsA("Model") and string.match(k.Name, "Room", 1) then
				local room = k
				for _,v in pairs(room:FindFirstChild("Monsters"):GetChildren()) do
					local folder = v
					runservice.Heartbeat:Connect(function()
						for _, v in pairs(folder:GetChildren()) do
							repeat wait() until v
							if not v:FindFirstChild("hl", 3) then
								local hlclone = esp:Clone()
								hlclone.Adornee = v
								hlclone.Parent = v
								print("added")
							end
						end
					end)
				end
			end
		end

	end
})
