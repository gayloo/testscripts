local name2 = game.Players.LocalPlayer.Name
local playerchar = game.Workspace[name2].vals.character.Value

local uis = game:GetService("UserInputService")
uis.InputBegan:Connect(function(input, e)
  if e then return end
  if input.KeyCode == Enum.KeyCode.E then
game.ReplicatedStorage.events.action:FireServer("glide")
  end
end)
uis.InputBegan:Connect(function(input, f)
  if f then return end
  if input.KeyCode == Enum.KeyCode.F then
game:GetService("ReplicatedStorage"):WaitForChild("events"):WaitForChild("action"):FireServer("attack")
wait(0.8)
game:GetService("ReplicatedStorage"):WaitForChild("events"):WaitForChild("action"):FireServer("stop attack")
  end
end)

uis.InputBegan:Connect(function(input, tree)
  if tree then return end
  if input.KeyCode == Enum.KeyCode.R then
game:GetService("ReplicatedStorage"):WaitForChild("events"):WaitForChild("action"):FireServer("speed boost")
  end
end)

uis.InputBegan:Connect(function(input, q)
  if q then return end
  if input.KeyCode == Enum.KeyCode.Q then
local name = game.Players.LocalPlayer.Name
local A_1 = "revive"
local A_2 = game.Workspace[name]
local Event = game:GetService("ReplicatedStorage").events.action
Event:FireServer(A_1, A_2)
  end
end)

uis.InputBegan:Connect(function(input, p)
  if p then return end
  if input.KeyCode == Enum.KeyCode.P then
game:GetService("ReplicatedStorage"):WaitForChild("events"):WaitForChild("infect"):FireServer()
  end
end)
