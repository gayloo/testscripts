loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))();
loadstring(game:HttpGet("https://pastebin.com/raw/PqBt2KtX"))(); -- no buggy graphics

loadstring(game:HttpGet("https://pastebin.com/raw/3r3D2tRT"))(); -- explorer

local uis = game:GetService("UserInputService")
uis.InputBegan:Connect(function(input, iprayforyou)
  if input.KeyCode == Enum.KeyCode.G then
 game.Players.LocalPlayer.PlayerGui.gui.hud.debug.Visible = true
 game.Players.LocalPlayer.PlayerGui.gui.hud.continue.Visible = false
 game.Players.LocalPlayer.PlayerGui.gui.hud.text.Visible = false
settings().Rendering.QualityLevel = 10
  end
end)

uis.InputBegan:Connect(function(input, todd)
  if input.KeyCode == Enum.KeyCode.H then
 game.ReplicatedStorage.remotes.morphs:FireServer("sonicexe_2")
 game.ReplicatedStorage.remotes.morphs:FireServer("sonicexe")
  end
end)

uis.InputBegan:Connect(function(input, zero)
  if input.KeyCode == Enum.KeyCode.Zero then
game.ReplicatedStorage.remotes.morphs:FireServer("tails")
game.ReplicatedStorage.remotes.morphs:FireServer("knuckles")
game.ReplicatedStorage.remotes.morphs:FireServer("eggman")
game.ReplicatedStorage.remotes.morphs:FireServer("amy")
game.ReplicatedStorage.remotes.morphs:FireServer("cream")
game.ReplicatedStorage.remotes.morphs:FireServer("sally")
game.ReplicatedStorage.remotes.morphs:FireServer("shadow")
game.ReplicatedStorage.remotes.morphs:FireServer("rouge")
  end
end)

print("Updated Lobby!")

-- seperator


uis.InputBegan:Connect(function(input, a)
  if input.KeyCode == Enum.KeyCode.Nine then
game.ReplicatedStorage.remotes.expressions:FireServer("scared")
game.ReplicatedStorage.remotes.expressions:FireServer("sad")
settings().Rendering.QualityLevel = 10
  end
end)

uis.InputBegan:Connect(function(input, b)
  if input.KeyCode == Enum.KeyCode.Eight then
game.ReplicatedStorage.remotes.expressions:FireServer("scared")
game.ReplicatedStorage.remotes.expressions:FireServer("worried")
settings().Rendering.QualityLevel = 10
  end
end)

uis.InputBegan:Connect(function(input, c)
  if input.KeyCode == Enum.KeyCode.Seven then
game.ReplicatedStorage.remotes.expressions:FireServer("happy")
settings().Rendering.QualityLevel = 10
  end
end)

uis.InputBegan:Connect(function(input, d)
  if input.KeyCode == Enum.KeyCode.Six then
game.ReplicatedStorage.remotes.expressions:FireServer("tired")
settings().Rendering.QualityLevel = 10
  end
end)

uis.InputBegan:Connect(function(input, e)
  if input.KeyCode == Enum.KeyCode.Five then
game.ReplicatedStorage.remotes.expressions:FireServer("scared")
game.ReplicatedStorage.remotes.expressions:FireServer("angry")
settings().Rendering.QualityLevel = 10
  end
end)

uis.InputBegan:Connect(function(input, f)
  if input.KeyCode == Enum.KeyCode.Four then
game.ReplicatedStorage.remotes.expressions:FireServer("scared")
game.ReplicatedStorage.remotes.expressions:FireServer("enraged")
settings().Rendering.QualityLevel = 10
  end
end)

uis.InputBegan:Connect(function(input, g)
  if input.KeyCode == Enum.KeyCode.Three then
game.ReplicatedStorage.remotes.expressions:FireServer("normal")
game.ReplicatedStorage.remotes.expressions:FireServer("normalEyes")
game.ReplicatedStorage.remotes.expressions:FireServer("normaleyes")
settings().Rendering.QualityLevel = 10
  end
end)

uis.InputBegan:Connect(function(input, h)
  if input.KeyCode == Enum.KeyCode.Two then
game.ReplicatedStorage.remotes.expressions:FireServer("scared")
game.ReplicatedStorage.remotes.expressions:FireServer("scaredEyes")
game.ReplicatedStorage.remotes.expressions:FireServer("scaredeyes")
settings().Rendering.QualityLevel = 10
  end
end)

uis.InputBegan:Connect(function(input, i)
  if input.KeyCode == Enum.KeyCode.One then
game.ReplicatedStorage.remotes.expressions:FireServer("confused")
settings().Rendering.QualityLevel = 10
  end
end)
