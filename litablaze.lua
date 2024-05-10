wait(1)
print("hi chat")

game.StarterGui:SetCore("SendNotification", {
Title = "hi chat"; -- the title (ofc)
Text = "the script is working, woohoo"; -- what the text says (ofc)
Icon = "rbxassetid://2831666959"; -- the image if u want. 
Duration = 3; -- how long the notification should in secounds
})

game.Players.LocalPlayer.PlayerGui.gui.frame.healthbars.partner_template.frame.health_txt.Text = "Ability Ready"
while wait(0.1) do
if cd >= 0 then
	local cd = cd -= 0.1
	if cd >= 0 then
		local calc = cd / 26
		local again = calc - 1
		local final = again * -1
		game.Players.LocalPlayer.PlayerGui.gui.frame.healthbars.partner_template.frame.health_txt.Visible = false
	end
	elseif canfly == false then
		game.Players.LocalPlayer.PlayerGui.gui.frame.healthbars.partner_template.frame.health_txt.Visible = true
	end
	else
		game.Players.LocalPlayer.PlayerGui.gui.frame.healthbars.partner_template.frame.health_txt.Visible = false
	end
end
elseif canfly == false then
	game.Players.LocalPlayer.PlayerGui.gui.frame.healthbars.partner_template.frame.health_txt.Visible = true
end
else
	game.Players.LocalPlayer.PlayerGui.gui.frame.healthbars.partner_template.frame.health_txt.Visible = false
end
wait()
game.Players.LocalPlayer.PlayerGui.gui.frame.healthbars.partner_template.bar.hp.Size = UDim2.new(final, 0, 0.8849, 0)
end

local uis = game:GetService("UserInputService")
	uis.InputBegan:Connect(function(input, jyhgtfd)
	if input.KeyCode == Enum.KeyCode.X then
		settings().Rendering.QualityLevel = 10
		if cd <= 0 and canfly == true then
			game.ReplicatedStorage.events.action:FireServer("glide")
			local canfly = false
			wait(10)
			local cd = 26
			local canfly = true
			game.ReplicatedStorage.events.action:FireServer("stop glide")
	end
end)
