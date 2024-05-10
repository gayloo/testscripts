local shield = game.Players.LocalPlayer.PlayerGui.gui.frame.healthbars.player.bar.shield.light_blue
local uis = game:GetService("UserInputService")
uis.InputBegan:Connect(function(input, r)
  if input.KeyCode == Enum.KeyCode.R then
	for i, sun2 in pairs(game.Players.LocalPlayer.PlayerGui.gui.frame.healthbars.player:GetDescendants()) do
		if sun2.ClassName == "UiGradient" and sun.Name ~= "light_blue" then
		sun2:Destroy()
		end
  local colordye0 = shield:Clone()
  colordye0.Parent = game.Players.LocalPlayer.PlayerGui.gui.frame.healthbars.player.bar.health
  local colordye1 = shield:Clone()
  colordye1.Parent = game.Players.LocalPlayer.PlayerGui.gui.frame.healthbars.player.bar.blood
  local colordye2 = shield:Clone()
  colordye2.Parent = game.Players.LocalPlayer.PlayerGui.gui.frame.healthbars.player.bar.character
  local colordye3 = shield:Clone()
  colordye3.Parent = game.Players.LocalPlayer.PlayerGui.gui.frame.healthbars.player.health_txt
  local colordye4 = shield:Clone()
  colordye4.Parent = game.Players.LocalPlayer.PlayerGui.gui.frame.healthbars.player.deco_2
  local colordye5 = shield:Clone()
  colordye5.Parent = game.Players.LocalPlayer.PlayerGui.gui.frame.healthbars.player.health_txt
	for i, sun in pairs(game.Players.LocalPlayer.Character.head:GetChildren()) do
		if sun.ClassName == "Part" or sun.ClassName == "UnionOperation" do
			if sun.BrickColor == "Gold" or sun.BrickColor == "Deep orange" then
				sun.BrickColor = BrickColor.new("Cyan")
			end
		end
	end
	for i, sun in pairs(game.Players.LocalPlayer.Character.leg1:GetChildren()) do
		if sun.ClassName == "Part" or sun.ClassName == "UnionOperation" do
			if sun.BrickColor == "Gold" or sun.BrickColor == "Deep orange" then
				sun.BrickColor = BrickColor.new("Cyan")
			end
		end
	end
	for i, sun in pairs(game.Players.LocalPlayer.Character.leg2:GetChildren()) do
		if sun.ClassName == "Part" or sun.ClassName == "UnionOperation" do
			if sun.BrickColor == "Gold" or sun.BrickColor == "Deep orange" then
				sun.BrickColor = BrickColor.new("Cyan")
			end
		end
	end
	for i, sun in pairs(game.Players.LocalPlayer.Character.arm1:GetChildren()) do
		if sun.ClassName == "Part" or sun.ClassName == "UnionOperation" do
			if sun.BrickColor == "Gold" or sun.BrickColor == "Deep orange" then
				sun.BrickColor = BrickColor.new("Cyan")
			end
		end
	end
	for i, sun in pairs(game.Players.LocalPlayer.Character.arm2:GetChildren()) do
		if sun.ClassName == "Part" or sun.ClassName == "UnionOperation" do
			if sun.BrickColor == "Gold" or sun.BrickColor == "Deep orange" then
				sun.BrickColor = BrickColor.new("Cyan")
			end
		end
	end
	for i, sun in pairs(game.Players.LocalPlayer.Character.leg1:GetChildren()) do
		if sun.ClassName == "Part" or sun.ClassName == "UnionOperation" do
			if sun.BrickColor == "Gold" or sun.BrickColor == "Deep orange" then
				sun.BrickColor = BrickColor.new("Cyan")
			end
		end
	end
	for i, sun in pairs(game.Players.LocalPlayer.Character.leg2:GetChildren()) do
		if sun.ClassName == "Part" or sun.ClassName == "UnionOperation" do
			if sun.BrickColor == "Gold" or sun.BrickColor == "Deep orange" then
				sun.BrickColor = BrickColor.new("Cyan")
			end
		end
	end

	end
  end
end)
