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
  end
end)

uis.InputBegan:Connect(function(input, n)
  if n then return end
  if input.KeyCode == Enum.KeyCode.N then
game:GetService("ReplicatedStorage"):WaitForChild("events"):WaitForChild("action"):FireServer("set shock")
  end
end)

uis.InputBegan:Connect(function(input, wan)
  if wan then return end
  if input.KeyCode == Enum.KeyCode.One then
game:GetService("ReplicatedStorage"):WaitForChild("events"):WaitForChild("action"):FireServer("set shield")
  end
end)

uis.InputBegan:Connect(function(input, toooooo)
  if toooooo then return end
  if input.KeyCode == Enum.KeyCode.Two then
game:GetService("ReplicatedStorage"):WaitForChild("events"):WaitForChild("action"):FireServer("arm cannon")
  end
end)

uis.InputBegan:Connect(function(input, tree)
  if tree then return end
  if input.KeyCode == Enum.KeyCode.Three then
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
