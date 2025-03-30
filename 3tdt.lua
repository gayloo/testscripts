-- Now, open source!

if not _G.hasRunOnce then
    _G.hasRunOnce = true
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Shiftlock-22314"))()

print("Shiftlock script is loaded!, if is computer, you will get ...")
print("Sorry, it took too long to get the key so i removed it")
local player = game.Players.LocalPlayer

local function enableClimbing()
    while true do
        local character = player.Character
        if character then
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing, true)
            end
        end
        wait(5)
    end
end

task.spawn(enableClimbing)

player.CharacterAdded:Connect(function()
    task.spawn(enableClimbing)
end)


local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "TD 1.31 - V2025_3_25",
   Icon = 0,
   LoadingTitle = "Wait...",
   LoadingSubtitle = "by neoxhackbiem(number)",
   Theme = "Amethyst",
})

local Tab = Window:CreateTab("Main", 10814531047)

local Dropdown = Tab:CreateDropdown({
    Name = "Select Character",
    Options = {"amy", "blaze", "cream", "eggman", "knuckles", "metalsonic", "rouge", "sally", "shadow", "silver", "tails"},
    CurrentOption = {"amy"},
    MultipleOptions = false,
    Flag = "Dropdown1",
    Callback = function(Options)
        selectedCharacter = Options[1]
    end,
})

local autoMorph = false
local Toggle = Tab:CreateToggle({
    Name = "Auto Morph",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        autoMorph = Value
    end,
})

game:GetService("RunService").RenderStepped:Connect(function()
    if autoMorph and selectedCharacter then
        game.ReplicatedStorage.remotes.morphs:FireServer(selectedCharacter)
    end
end)

local Dropdown = Tab:CreateDropdown({
   Name = "Emotes",
   Options = {"angry", "glad", "surprised", "sad", "happy", "worried", "confused", "tired", "enraged", "hurt"},
   CurrentOption = {"Choose Emote"},
   MultipleOptions = false,
   Flag = "Dropdown1",
 Callback = function(Options)
       if Options[1] ~= "none" then
           local args = {
               [1] = Options[1]
           }
           game:GetService("ReplicatedStorage"):WaitForChild("remotes"):WaitForChild("expressions"):FireServer(unpack(args))
       end
   end,
})
local Dropdown = Tab:CreateDropdown({
   Name = "Eyes",
   Options = {"bloodshot", "regularEyes", "removeBloodshot", "scaredEyes"},
   CurrentOption = {"Choose Eyes"},
   MultipleOptions = false,
   Flag = "Dropdown1",
   Callback = function(Options)
       if Options[1] ~= "none" then
           local args = {
               [1] = Options[1]
           }
           game:GetService("ReplicatedStorage"):WaitForChild("remotes"):WaitForChild("expressions"):FireServer(unpack(args))
       end
   end,
})
local Dropdown = Tab:CreateDropdown({
   Name = "Wound",
   Options = {"torsoBlood", "noseWound", "neckWound", "mouthBlood", "headWounds"},
   CurrentOption = {"Choose Wound"},
   MultipleOptions = false,
   Flag = "Dropdown1",
   Callback = function(Options)
       if Options[1] ~= "none" then
           local args = {
               [1] = Options[1]
           }
           game:GetService("ReplicatedStorage"):WaitForChild("remotes"):WaitForChild("expressions"):FireServer(unpack(args))
       end
   end,
})

local Toggle = Tab:CreateToggle({
   Name = "Toggle Debug",
   CurrentValue = false,
   Flag = "Ya",  
   Callback = function(Value)
game.Players.LocalPlayer.PlayerGui.gui.hud.debug.Visible = Value

-- Emote
local player = game.Players.LocalPlayer
local gui = player:WaitForChild("PlayerGui"):WaitForChild("gui"):WaitForChild("hud"):WaitForChild("debug"):WaitForChild("expressionList")

local expressionsFolder = gui:WaitForChild("expressions")
local statesFolder = gui:WaitForChild("states")
local woundsFolder = gui:WaitForChild("wounds")

local function addButtonEvent(button)
    button.MouseButton1Click:Connect(function()
        local args = {
            [1] = button.Name
        }
        game:GetService("ReplicatedStorage"):WaitForChild("remotes"):WaitForChild("expressions"):FireServer(unpack(args))
    end)
end

local function setupButtons(folder)
    for _, button in pairs(folder:GetChildren()) do
        if button:IsA("TextButton") or button:IsA("ImageButton") then
            addButtonEvent(button)
        end
    end
end

setupButtons(expressionsFolder)
setupButtons(statesFolder)
setupButtons(woundsFolder)
-- Actions
local player = game.Players.LocalPlayer
local actions = player:WaitForChild("PlayerGui"):WaitForChild("gui"):WaitForChild("hud"):WaitForChild("debug"):WaitForChild("actions")
local TweenService = game:GetService("TweenService")
-- reset
local resetButton = actions:WaitForChild("reset")
resetButton.MouseButton1Click:Connect(function()
    local character = player.Character
    if character then
        character:BreakJoints()
        player:LoadCharacter()
    end
end)

-- stunned
local stunnedButton = actions:WaitForChild("stunned")
stunnedButton.MouseButton1Click:Connect(function()
    local args = {
        [1] = "buzzsawHit",
        [2] = workspace:WaitForChild("game"):WaitForChild("currentMap"):WaitForChild("you can't run"):WaitForChild("mechanics"):WaitForChild("buzzsaws"):WaitForChild("20")
    }
    game:GetService("ReplicatedStorage"):WaitForChild("remotes"):WaitForChild("actions"):FireServer(unpack(args))
end)
-- morph
local characterList = game.Players.LocalPlayer.PlayerGui.gui.hud.debug.characterList:GetChildren()

for _, button in pairs(characterList) do
    if button:IsA("TextButton") then
        button.MouseButton1Click:Connect(function()
            local args = {
                [1] = button.Text
            }

            game:GetService("ReplicatedStorage"):WaitForChild("remotes"):WaitForChild("morphs"):FireServer(unpack(args))
        end) 
    end
end
end,
})

local isEnabled = false
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Toggle = Tab:CreateToggle({
   Name = "Big Hitbox (Make Easy Attack)",
   CurrentValue = false,
   Flag = "ToggleEasyAttack", 
   Callback = function(Value)
       isEnabled = Value
   end,
})

local function UpdateHitbox()
    if isEnabled then
        for _, player in ipairs(Players:GetPlayers()) do
            local args = {
                [1] = workspace:WaitForChild(player.Name)
            }
            ReplicatedStorage:WaitForChild("remotes"):WaitForChild("hitReg"):FireServer(unpack(args))
        end
    end
end

Players.PlayerAdded:Connect(UpdateHitbox)
Players.PlayerRemoving:Connect(UpdateHitbox)

spawn(function()
    while true do
        wait()
        UpdateHitbox()
    end
end)

Tab:CreateButton({
Name = "Keep the same morph for the next match\n (Not work in the 3rd match)",
Callback = function()
local player = game.Players.LocalPlayer
local humanoid = player.Character and player.Character:FindFirstChildWhichIsA("Humanoid")

if humanoid then
    humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
    humanoid.HealthChanged:Connect(function(health)
        if health < 9999999999999999 then
            humanoid.Health = 99999999999999999999999999999
        end
    end)
end
end,
})

local espExeEnabled = false
local espPlayersEnabled = false

local exeTag = "exe"
local highlightMap = {}

local function createHighlight(exeObject, color)
    local existingHighlight = exeObject:FindFirstChildOfClass("Highlight")
    if existingHighlight then
        existingHighlight:Destroy()
    end
    
    local highlight = Instance.new("Highlight")
    highlight.Parent = exeObject
    highlight.FillColor = color
    highlight.FillTransparency = 0.5
    highlight.OutlineTransparency = 0
end

local function onExeAdded(exeObject)
    if exeObject:IsA("Model") and exeObject:FindFirstChild("Humanoid") then
        createHighlight(exeObject, Color3.fromRGB(255, 0, 0))
    end
end

local function setupExeDetector()
    local exeCollectionService = game:GetService("CollectionService")
    
    for _, exeObject in pairs(exeCollectionService:GetTagged(exeTag)) do
        onExeAdded(exeObject)
    end

    exeCollectionService:GetInstanceAddedSignal(exeTag):Connect(onExeAdded)
end

local function toggleExeEsp(state)
    if state then
        setupExeDetector()
    else
        for _, exeObject in pairs(game:GetService("CollectionService"):GetTagged(exeTag)) do
            local existingHighlight = exeObject:FindFirstChildOfClass("Highlight")
            if existingHighlight then
                existingHighlight:Destroy()
            end
        end
    end
end

local characterColors = {
    tails = Color3.fromRGB(255, 165, 0),
    knuckles = Color3.fromRGB(255, 0, 0),
    eggman = Color3.fromRGB(255, 255, 0),
    amy = Color3.fromRGB(255, 105, 180),
    cream = Color3.fromRGB(255, 218, 185),
    sally = Color3.fromRGB(210, 180, 140),
    shadow = Color3.fromRGB(0, 0, 0),
    rouge = Color3.fromRGB(255, 255, 255),
    blaze = Color3.fromRGB(128, 0, 128),
    silver = Color3.fromRGB(192, 192, 192),
    metalsonic = Color3.fromRGB(0, 0, 255),
    kolossos = Color3.fromRGB(139, 0, 0),
    sonicexe = Color3.fromRGB(139, 25, 45),
    tailsdoll = Color3.fromRGB(139, 80, 0),
}

local function loopThroughDisplayPlayers()
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local displayPlayersFolder = ReplicatedStorage:FindFirstChild("displayPlayers")
    if not displayPlayersFolder then return end

    for modelName, highlight in pairs(highlightMap) do
        if not displayPlayersFolder:FindFirstChild(modelName) then
            highlight:Destroy()
            highlightMap[modelName] = nil
        end
    end

    for _, child in pairs(displayPlayersFolder:GetChildren()) do
        local stats = child:FindFirstChild("stats")
        if stats and stats:FindFirstChild("character") then
            local givenCharacter = stats.character.Value:lower()
            local color = characterColors[givenCharacter]

            if color then
                local model = workspace:FindFirstChild(child.Name)
                if model and model:IsA("Model") then
                    if not highlightMap[model.Name] then
                        local highlight = Instance.new("Highlight")
                        highlight.FillColor = color
                        highlight.FillTransparency = 0.3
                        highlight.OutlineColor = color
                        highlight.OutlineTransparency = 0.2
                        highlight.Enabled = true
                        highlight.Adornee = model
                        highlight.Parent = workspace
                        highlightMap[model.Name] = highlight
                    else
                        local highlight = highlightMap[model.Name]
                        highlight.FillColor = color
                        highlight.OutlineColor = color
                    end
                end
            end
        end
    end
end

local function togglePlayersEsp(state)
    if state then
        espPlayersEnabled = true
        while espPlayersEnabled do
            loopThroughDisplayPlayers()
            wait(1)
        end
    else
        espPlayersEnabled = false
        for _, highlight in pairs(highlightMap) do
            highlight:Destroy()
        end
        highlightMap = {}
    end
end

local ToggleExe = Tab:CreateToggle({
    Name = "ESP Exe",
    CurrentValue = false,
    Flag = "ToggleExe",
    Callback = function(Value)
        espExeEnabled = Value
        toggleExeEsp(espExeEnabled)
    end,
})

local TogglePlayers = Tab:CreateToggle({
    Name = "ESP Survivor",
    CurrentValue = false,
    Flag = "TogglePlayers",
    Callback = function(Value)
        espPlayersEnabled = Value
        togglePlayersEsp(espPlayersEnabled)
    end,
})

local Tab = Window:CreateTab("Teleport", 6723742952)
Tab:CreateButton({
Name = "Teleport to Lobby",
Callback = function()
game.Players.LocalPlayer.Character:MoveTo(Vector3.new(0, 10, 0))
end,
})
Tab:CreateButton({
Name = "Teleport to Game (Can fall the void)",
Callback = function()
game.Players.LocalPlayer.Character:MoveTo(Vector3.new(-272, 155, -313))
end,
})
local Tab = Window:CreateTab("Animations", 110748588642372)
Tab:CreateButton({
	Name = "Stop animation",
	Callback = function()
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

for _, animationTrack in pairs(humanoid:GetPlayingAnimationTracks()) do
    animationTrack:Stop(0)
end
  	end,    
})

local Animations = {
    { Name = "Sonic.exe 2 Idle", Id = "rbxassetid://137659262960225" },
    { Name = "Tails Cannon", Id = "rbxassetid://138560715967682" },
    { Name = "Tails Glide", Id = "rbxassetid://136705072136812" },
    { Name = "Amy Arm Idle", Id = "rbxassetid://16548210127" },
    { Name = "Cream Heal", Id = "rbxassetid://14472382960" },
    { Name = "Downed 2", Id = "rbxassetid://129121832899238" },
    { Name = "Injured 2", Id = "rbxassetid://116366098474267" },
{ Name = "Beaten", Id = "rbxassetid://14526473340" },
{ Name = "Tackled", Id = "rbxassetid://16233637794" },
{ Name = "knuckles punch 2", Id = "rbxassetid://125567395811973" },
{ Name = "Sonic.exe 2 attack", Id = "rbxassetid://16246380498" },
{ Name = " Sonic.exe 2 Changer 2", Id = "rbxassetid://95255389214022"},
{ Name = "Eggman Test 1", Id = "rbxassetid://74930208619120" },
{ Name = "Eggman Test 2", Id = "rbxassetid://90114877445120" }
}

local function PlayAnimation(animationId)
    local character = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")
    local animator = humanoid:FindFirstChild("Animator") or humanoid:WaitForChild("Animator")
    local animation = Instance.new("Animation")
    animation.AnimationId = animationId
    local track = animator:LoadAnimation(animation)
    track:Play()
end

for _, anim in ipairs(Animations) do
    Tab:CreateButton({
        Name = anim.Name,
        Callback = function()
            PlayAnimation(anim.Id)
        end
    })
end

Tab:CreateButton({
Name = "Get More? Click Here",
Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Biem6ondo/Test/refs/heads/main/Testing"))()
end,
})


local Tab = Window:CreateTab("Survivor", 135443303437470)
local loopRunning = false

local ReviveActions = Tab:CreateToggle({
   Name = "Auto Revive (Alway Revive Actions)",
   CurrentValue = false,
   Flag = "Toggle1",
   Callback = function(Value)
       loopRunning = Value
       if loopRunning then
           task.spawn(function()
               while loopRunning do
                   for _, player in ipairs(game:GetService("Players"):GetPlayers()) do
                       local args = {
                           [1] = "revive",
                           [2] = workspace:FindFirstChild(player.Name)
                       }
                       if args[2] then
                           game:GetService("ReplicatedStorage"):WaitForChild("remotes"):WaitForChild("actions"):FireServer(unpack(args))
                       end
                   end
                   task.wait()
               end
           end)
       end
   end,
})

local Players = game:GetService("Players")
local playerNames = {}
for _, player in pairs(Players:GetPlayers()) do
    table.insert(playerNames, player.Name)
end

local Dropdown = Tab:CreateDropdown({
    Name = "Choose Player To Heal (Need Cream)",
    Options = playerNames,
    CurrentOption = {"None"},
    MultipleOptions = false,
    Flag = "Dropdown1",
    Callback = function(Options)
        local selectedPlayer = Options[1]
        local args = {
            [1] = "overheal",
            [2] = workspace:WaitForChild(selectedPlayer)
        }
        game:GetService("ReplicatedStorage"):WaitForChild("remotes"):WaitForChild("abilities"):FireServer(unpack(args))
    end,
})

Players.PlayerAdded:Connect(function(player)
    table.insert(playerNames, player.Name)
    Dropdown:Refresh(playerNames)
end)

Players.PlayerRemoving:Connect(function(player)
    for i, name in ipairs(playerNames) do
        if name == player.Name then
            table.remove(playerNames, i)
            break
        end
    end
    Dropdown:Refresh(playerNames)
end)
local Players = game:GetService("Players")
local playerNames = {}
for _, player in pairs(Players:GetPlayers()) do
    table.insert(playerNames, player.Name)
end

local Dropdown = Tab:CreateDropdown({
    Name = "Choose Player To Shield (Need Sally)",
    Options = playerNames,
    CurrentOption = {"?"},
    MultipleOptions = false,
    Flag = "Dropdown1",
    Callback = function(Options)
        local selectedPlayer = Options[1]
        local args = {
            [1] = "shieldShare",
            [2] = workspace:WaitForChild(selectedPlayer)
        }
        game:GetService("ReplicatedStorage"):WaitForChild("remotes"):WaitForChild("abilities"):FireServer(unpack(args))
    end,
})

Players.PlayerAdded:Connect(function(player)
    table.insert(playerNames, player.Name)
    Dropdown:Refresh(playerNames)
end)

Players.PlayerRemoving:Connect(function(player)
    for i, name in ipairs(playerNames) do
        if name == player.Name then
            table.remove(playerNames, i)
            break
        end
    end
    Dropdown:Refresh(playerNames)
end)

Tab:CreateButton({
Name = "Dead right now",
Callback = function()
local args = {
    [1] = "drown"
}

game:GetService("ReplicatedStorage"):WaitForChild("remotes"):WaitForChild("actions"):FireServer(unpack(args))
end,
})

Tab:CreateButton({
    Name = "Be Minion Right now",
    Callback = function()
        local player = game:GetService("Players").LocalPlayer
        local rs = game:GetService("ReplicatedStorage")
        local ss = game:GetService("SoundService")
        local running = true

        local function getGUI()
            return player:FindFirstChild("PlayerGui")
        end

        local function getHUD()
            local gui = getGUI()
            return gui and gui:FindFirstChild("gui") and gui.gui:FindFirstChild("hud")
        end

        local function disableSpectate()
            local hud = getHUD()
            if hud then
                if hud:FindFirstChild("spectate") then
                    hud.spectate.Visible = false
                end
                if hud:FindFirstChild("healthbars") and not hud.healthbars.Visible then
                    hud.healthbars.Visible = true
                end
            end
        end

        player.CharacterAdded:Connect(function()
            running = false
        end)

        task.spawn(function()
            while running do
                local success, _ = pcall(disableSpectate)
                if not success then
                    running = false
                end
                task.wait(0.1)
            end
        end)

        rs.remotes.actions:FireServer("drown")
        rs.remotes.infect:FireServer()
        task.wait(1.3)

        local gui = getGUI()
        if gui then
            gui.stats:SetAttribute("isDead", false)
            wait(5)
            local hud = getHUD()
            if hud and hud:FindFirstChild("continue") then
                hud.continue.Visible = false
            end
        end

        wait(5)
        ss.mainSounds.current.SoundId = "rbxassetid://133273560899979"
    end,
})

local Label = Tab:CreateLabel("No Use Minion To Spam", "blocks")
local ToggleActive = false
local Shadow_homingAttackState_attacking = Tab:CreateToggle({
   Name = "Spam HomingAttackState: Attacking / Like Spam Sound (shadow)",
   CurrentValue = false,
   Flag = "Toggle1",
   Callback = function(Value)
       ToggleActive = Value
       if ToggleActive then
           spawn(function()
               while ToggleActive do
                   local args = {
                       [1] = "homingAttackState",
                       [2] = "attacking"
                   }
                   game:GetService("ReplicatedStorage"):WaitForChild("remotes"):WaitForChild("abilities"):FireServer(unpack(args))
                   task.wait()
               end
           end)
       end
   end,
})

local ToggleActive = false
local Shadow_boostState_landed = Tab:CreateToggle({
   Name = "Spam BoostState: Landed / Make Everyone Has Camera Shake (shadow)",
   CurrentValue = false,
   Flag = "Toggle1",
   Callback = function(Value)
       ToggleActive = Value
       if ToggleActive then
           spawn(function()
               while ToggleActive do
local args = {
    [1] = "boostState",
    [2] = "landed"
}

game:GetService("ReplicatedStorage").remotes.abilities:FireServer(unpack(args))

                   task.wait()
               end
           end)
       end
   end,
})

local ToggleActive = false
local speedRadius = Tab:CreateToggle({
    Name = "Lag Everyone (Blaze)",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        ToggleActive = Value
        if ToggleActive then
            spawn(function()
                while ToggleActive do
for i = 1, 2 do
                        local args = {
                            [1] = "setHeatWaveParticles",
                            [2] = "punch"
                        }
                        game:GetService("ReplicatedStorage"):WaitForChild("remotes"):WaitForChild("abilities"):FireServer(unpack(args))
                    end
                    local char = game.Players.LocalPlayer.Character
                    if char then
                        local arm = char:FindFirstChild("arm1")
                        if arm then
                            local hand = arm:FindFirstChild("hand")
                            if hand then
                                local hand2 = hand:FindFirstChild("hand")
                                if hand2 then
                                    hand2:Destroy()
                                end
                            end
                        end
                    end
                    task.wait()
                end
            end)
        end
    end,
})

local Paragraph = Tab:CreateParagraph({Title = "[❓] Enable Abilities No Countdown Req.", Content = "You Need Click DEAD RIGHT NOW, and be exe, then toggle ABILITIES NO COUNTDOWN from SONIC.EXE AND MINIONS\nLet fun with abilities no countdown!"})

local Dropdown
local playerNames = {"Survivor", "Exe"}
local selectedPlayers = {}
local currentIndex = 1
local runningGrapple = false
local runningHeatWave = false
local runningOrb = false
local runningflashbang = false
local homingAttack = false
local runningBoost = false

local function getValidSurvivors()
    local survivors = {}
    for _, player in ipairs(game.Players:GetPlayers()) do
        local displayFolder = game.ReplicatedStorage.displayPlayers:FindFirstChild(player.Name)
        if displayFolder then
            local healthValue = displayFolder:FindFirstChild("health")
            if healthValue and healthValue:IsA("NumberValue") and healthValue.Value > 0 then
                table.insert(survivors, player.Name)
            end
        end
    end
    return survivors
end

local function getValidExes()
    local exes = {}
    for _, player in ipairs(game.Players:GetPlayers()) do
        local displayFolder = game.ReplicatedStorage.displayPlayers:FindFirstChild(player.Name)
        if displayFolder then
            local healthValue = displayFolder:FindFirstChild("health")
            if healthValue and healthValue:IsA("NumberValue") and healthValue.Value <= 0 then
                table.insert(exes, player.Name)
            end
        end
    end
    return exes
end

local function updatePlayerList()
    local newPlayerNames = {"Survivor", "Exe"} 

    for _, player in ipairs(game.Players:GetPlayers()) do
        table.insert(newPlayerNames, player.Name)
    end

    if #newPlayerNames ~= #playerNames then
        playerNames = newPlayerNames
        if Dropdown then
            Dropdown:Refresh(playerNames)
        end
    end
end

Dropdown = Tab:CreateDropdown({
    Name = "Choose Players",
    Options = playerNames,
    CurrentOption = {"Choose!"},
    MultipleOptions = true,
    Flag = "Dropdown1",
    Callback = function(Options)
        selectedPlayers = {}

        for _, option in ipairs(Options) do
            if option == "Survivor" then
                for _, survivor in ipairs(getValidSurvivors()) do
                    table.insert(selectedPlayers, survivor)
                end
            elseif option == "Exe" then
                for _, exe in ipairs(getValidExes()) do
                    table.insert(selectedPlayers, exe)
                end
            else
                table.insert(selectedPlayers, option)
            end
        end

        currentIndex = 1
    end,
})

local function getNextPlayer()
    if #selectedPlayers == 0 then return nil end
    local playerName = selectedPlayers[currentIndex]
    currentIndex = (currentIndex % #selectedPlayers) + 1
    return game.Players:FindFirstChild(playerName) and game.Players[playerName].Character
end

local function metal()
    local target = getNextPlayer()
    if target then
        local r = game.ReplicatedStorage.remotes
        r.abilities:FireServer("grapple", target, Vector3.new(0, 0, 0))
    end
end

local function castHeatWave()
    local target = getNextPlayer()
    if target and target:FindFirstChild("HumanoidRootPart") then
        local cf = target.HumanoidRootPart.CFrame
        local r = game.ReplicatedStorage.remotes
        r.abilities:FireServer("heatWave")
        r.abilities:FireServer("releaseHeatWave", cf)
    end
end

local function castOrb()
    local target = getNextPlayer()
    local r = game.ReplicatedStorage.remotes
    r.abilities:FireServer("orb") 

    if target and target:FindFirstChild("HumanoidRootPart") then
        r.abilities:FireServer("throwOrb", target.HumanoidRootPart.Position)
    end
end

local function flashbang()
    local target = getNextPlayer()
    if target and target:FindFirstChild("HumanoidRootPart") then
        local pos = target.HumanoidRootPart.Position - Vector3.new(0, 3, 0)
        local r = game.ReplicatedStorage.remotes
        r.abilities:FireServer("flashbang", pos)
    end
end

local function homingAttackAction()
    local target = getNextPlayer()
    if target then
        local r = game.ReplicatedStorage.remotes
        r.abilities:FireServer("homingAttack")
        r.abilities:FireServer("homingAttackTarget", target)
    end
end

local function boost()
    local target = getNextPlayer()
    if target and target:FindFirstChild("HumanoidRootPart") then
        local r = game.ReplicatedStorage.remotes

        r.abilities:FireServer("boost")

        r.abilities:FireServer("boostPush", {target})
    end
end

local ToggleGrapple = Tab:CreateToggle({
    Name = "Start (Spam Grapple Abilities / Need To Get Closer)",
    CurrentValue = false,
    Flag = "toggle_grapple",
    Callback = function(Value)
        runningGrapple = Value
        while runningGrapple do
            metal()
            task.wait()
        end
    end,
})

local ToggleHeatWave = Tab:CreateToggle({
    Name = "Start (Spam HeatWave Abilities)",
    CurrentValue = false,
    Flag = "toggle_heatwave",
    Callback = function(Value)
        runningHeatWave = Value
        while runningHeatWave do
            castHeatWave()
            task.wait()
        end
    end,
})

local ToggleOrb = Tab:CreateToggle({
    Name = "Start (Spam Orb Abilities / Can't Stun)",
    CurrentValue = false,
    Flag = "toggle_orb",
    Callback = function(Value)
        runningOrb = Value
        while runningOrb do
            castOrb()
            task.wait()
        end
    end,
})

local ToggleFlashBang = Tab:CreateToggle({
    Name = "Start (Spam Flashbang Abilities / Need To Get Closer)",
    CurrentValue = false,
    Flag = "toggle_flashbang",
    Callback = function(Value)
        runningflashbang = Value
        while runningflashbang do
            flashbang()
            task.wait()
        end
    end,
})

local ToggleHomingAttack = Tab:CreateToggle({
    Name = "Start (Spam HomingAttack Abilities / Need To Get Closer)",
    CurrentValue = false,
    Flag = "aiq",
    Callback = function(Value)
        homingAttack = Value
        while homingAttack do
            homingAttackAction()
            task.wait()
        end
    end,
})

local ToggleBoost = Tab:CreateToggle({
    Name = "Start (Spam Boost Abilities / Need To Get Closer)",
    CurrentValue = false,
    Flag = "nsj",
    Callback = function(Value)
        runningBoost = Value
        while runningBoost do
            boost()
            task.wait()
        end
    end,
})
task.spawn(function()
    while true do
        updatePlayerList()
        task.wait(2)
    end
end)

_G.PlayerPosition = nil
local ToggleActive = false

spawn(function()
    while wait(0) do
        local player = game:GetService("Players").LocalPlayer
        if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            _G.PlayerPosition = player.Character.HumanoidRootPart.Position
        end
    end
end)

local Label = Tab:CreateLabel("Spam Abilities (No Players Req.)", "blocks")

local SliverBarrier = Tab:CreateToggle({
   Name = "Spam Barrier (Sliver)",
   CurrentValue = false,
   Flag = "Toggle1",
   Callback = function(Value)
       ToggleActive = Value
       if ToggleActive then
           spawn(function()
               while ToggleActive do
                   local args1 = { [1] = "barrier" }
                   game:GetService("ReplicatedStorage"):WaitForChild("remotes"):WaitForChild("abilities"):FireServer(unpack(args1))
                   
                   local args2 = { 
                       [1] = "placeBarrier", 
                       [2] = CFrame.new(_G.PlayerPosition or Vector3.new(0, 0, 0))
                   }
                   game:GetService("ReplicatedStorage"):WaitForChild("remotes"):WaitForChild("abilities"):FireServer(unpack(args2))

                   wait(0)
               end
           end)
       end
   end,
})

local ToggleActive = false
local speedRadius = Tab:CreateToggle({
   Name = "Spam Speed Radius (Sliver)",
   CurrentValue = false,
   Flag = "Toggle1",
   Callback = function(Value)
       ToggleActive = Value
       if ToggleActive then
           spawn(function()
               while ToggleActive do
                   local args = {
                       [1] = "speedRadius",
                   }
                   game:GetService("ReplicatedStorage"):WaitForChild("remotes"):WaitForChild("abilities"):FireServer(unpack(args))
                   task.wait()
               end
           end)
       end
   end,
})

local Tab = Window:CreateTab("Sonic.exe and minion", 73545495297148)
local teleporting = false
local targetPlayer = nil

local displayPlayers = game:GetService("ReplicatedStorage"):FindFirstChild("displayPlayers")
if not displayPlayers then
    warn("Target: Cannot Found (Fail)")
    return
end

local function getNextPlayerWithHealth()
    for _, playerFolder in ipairs(displayPlayers:GetChildren()) do
        if playerFolder:IsA("Folder") then
            local health = playerFolder:FindFirstChild("health")
            if health and health.Value > 0 then
                local player = game.Players:FindFirstChild(playerFolder.Name)
                if player then
                    return player
                end
            end
        end
    end
    return nil
end

local function teleportToPlayer()
    while teleporting do
        targetPlayer = getNextPlayerWithHealth()
        
        if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local playerRoot = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            local targetRoot = targetPlayer.Character.HumanoidRootPart
            if playerRoot then
                playerRoot.CFrame = targetRoot.CFrame + Vector3.new(0, 0, 0)
            end

            local args = {
                [1] = "attack"
            }
            game:GetService("ReplicatedStorage"):WaitForChild("remotes"):WaitForChild("abilities"):FireServer(unpack(args))

            local minionArgs = {
                [1] = "minionAttack"
            }
            game:GetService("ReplicatedStorage"):WaitForChild("remotes"):WaitForChild("abilities"):FireServer(unpack(minionArgs))

            for _, player in ipairs(game:GetService("Players"):GetPlayers()) do
                local args = {
                    [1] = workspace:WaitForChild(player.Name)
                }
                game:GetService("ReplicatedStorage"):WaitForChild("remotes"):WaitForChild("hitReg"):FireServer(unpack(args))
            end
        end
        wait(0)
    end
end

local canturnoffa = Tab:CreateToggle({
    Name = "Kill All",
    CurrentValue = false,
    Flag = "ToggleKillAll",
    Callback = function(Value)
        teleporting = Value
        if teleporting then
            teleportToPlayer()
        end
    end,
})


local runningm = false 

local canturnoff = Tab:CreateToggle({
   Name = "Abilities No Countdown",
   CurrentValue = false,
   Flag = "LaserHitToggle",
   Callback = function(Value)
      runningm = Value 
      if runningm then
         while runningm and wait() do
            game:GetService("ReplicatedStorage"):WaitForChild("remotes"):WaitForChild("infect"):FireServer()
            
            local player = game.Players.LocalPlayer
            local stats = player:WaitForChild("PlayerGui"):WaitForChild("stats")
            
            if stats then
               stats:SetAttribute("isDead", false)
            end
         end
      end
   end,
})

local player = game.Players.LocalPlayer
local toggleEnabled = false

local function trapAbility()
    while toggleEnabled do
        wait()
        local character = player.Character
        if character and character:FindFirstChild("HumanoidRootPart") then
            local args = {
                [1] = "trap",
                [2] = character.HumanoidRootPart.Position - ((Vector3.new(0, 3, 0)) + Vector3.new(math.random(-40, 40), math.random(-1, 4), math.random(-40, 40)))
            }
            game:GetService("ReplicatedStorage"):WaitForChild("remotes"):WaitForChild("abilities"):FireServer(unpack(args))
        end
    end
end

local TailsDollTrap = Tab:CreateToggle({
    Name = "Spam Trap Abilities (TailsDoll / Need Enable No Abilities Countdown)",
    CurrentValue = false,
    Flag = "ToggleTrap",
    Callback = function(Value)
        toggleEnabled = Value
        if toggleEnabled then
            trapAbility()
        end
    end,
})

player.CharacterAdded:Connect(function()
    wait(1)
    if toggleEnabled then
        trapAbility()
    end
end)

local TailsDollSlash = Tab:CreateToggle({
    Name = "Spam Slash Abilities (TailsDoll)",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        _G.SlashToggle = Value
    end,
})

_G.SlashToggle = false

spawn(function()
    while true do
        wait(0)
        if _G.SlashToggle then
            game.ReplicatedStorage.remotes.abilities:FireServer("slash")
        end
    end
end)

local previousHealth = 0
local function checkHealthChange()
    while teleporting do
        local player, healthValue = getNextPlayerWithHealth()
        if player and healthValue ~= previousHealth and healthValue > 0 then
            previousHealth = healthValue
            teleporting = false

            if healthValue > 0 then
                teleporting = true
                teleportToPlayer()
            end
        end
        task.wait(1)
    end
end

task.spawn(checkHealthChange)
local Tab = Window:CreateTab("Client", 9405930424)

local Input = Tab:CreateInput({
   Name = "Set your health",
   CurrentValue = "",
   PlaceholderText = "Data",
   Flag = "Input1", 
   Callback = function(setdata)
local playerName = game.Players.LocalPlayer.Name
local newHealthValue = setdata

local replicatedStorage = game:GetService("ReplicatedStorage")
local displayPlayers = replicatedStorage:FindFirstChild("displayPlayers")

if displayPlayers then
    local playerData = displayPlayers:FindFirstChild(playerName)
    if playerData and playerData:FindFirstChild("health") then
        playerData.health.Value = newHealthValue
    end
end
   end,
})
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local SkyboxesFolder = ReplicatedStorage:WaitForChild("skyboxes")
local Skyboxes = {}

for _, skybox in ipairs(SkyboxesFolder:GetChildren()) do
    if skybox:IsA("Sky") then
        table.insert(Skyboxes, skybox.Name)
    end
end

local Dropdown = Tab:CreateDropdown({
   Name = "Choose SkyBox",
   Options = Skyboxes,
   CurrentOption = {Skyboxes[1]},
   MultipleOptions = false,
   Flag = "DropdownSkyBox",
   Callback = function(Options)
       for _, skybox in ipairs(SkyboxesFolder:GetChildren()) do
           if skybox.Name == Options[1] then
               local newSky = skybox:Clone()
               newSky.Parent = game.Lighting
               for _, child in ipairs(game.Lighting:GetChildren()) do
                   if child:IsA("Sky") and child ~= newSky then
                       child:Destroy()
                   end
               end
           end
       end
   end,
})

Tab:CreateButton({
Name = "No fog",
Callback = function()
while wait(0.4) do
game.Lighting.atmosphere.Density = 0
game.Lighting.blur.Enabled = false
game.Lighting.bloom.Enabled = false
game.Lighting.colorCorrection.Enabled = false
end
end,
})

local Dropdown = Tab:CreateDropdown({
   Name = "Game Mode",
   Options = {"", "teamVsTeam", "doubleTrouble"},
   CurrentOption = "",
   MultipleOptions = false,
   Flag = "erly",
   Callback = function(optn)
       local selected = tostring(optn[1] or "")
       local settingsDisplay = game.ReplicatedStorage:FindFirstChild("settingsDisplay")
       if settingsDisplay then
           local gamemode = settingsDisplay:FindFirstChild("gamemode")
           if gamemode and gamemode:IsA("StringValue") then
               gamemode.Value = selected
           end
       end
   end,
})

Tab:CreateButton({
Name = "stats",
Callback = function()
local stats = game.Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("stats")

local gui = Instance.new("ScreenGui")
local frame = Instance.new("ScrollingFrame")
local uiList = Instance.new("UIListLayout")
local Title = Instance.new("ImageButton")
local cls = Instance.new("TextButton", Title)
local clsa = Instance.new("TextButton", Title)

cls.Size = UDim2.new(0, 30, 0, 30)
cls.Text = "X"
cls.Position = UDim2.new(0, 270, 0, 0)
cls.MouseButton1Click:Connect(function()
gui:Destroy()
end)

clsa.Size = UDim2.new(0, 30, 0, 30)
clsa.Text = "-"
clsa.Position = UDim2.new(0, 240, 0, 0)
clsa.MouseButton1Click:Connect(function()
frame.Visible = not frame.Visible
end)

Title.Size = UDim2.new(0, 300, 0, 30)
Title.Active = true
Title.Draggable = true
Title.Parent = gui
Title.Position = UDim2.new(0.5, 0, 0.5, 0)

gui.Parent = game.Players.LocalPlayer.PlayerGui
frame.Parent = Title
frame.Size = UDim2.new(0, 300, 0, 200)
frame.Position = UDim2.new(0, 0, 0, 30)
frame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
frame.BorderSizePixel = 0
frame.ClipsDescendants = true
frame.ZIndex = 10
frame.Name = "AttributesFrame"
frame.CanvasSize = UDim2.new(0, 0, 99, 0)

uiList.Parent = frame
uiList.SortOrder = Enum.SortOrder.LayoutOrder
uiList.Padding = UDim.new(0, 5)

local function createBoolButton(name, value)
    local container = Instance.new("Frame")
    container.Size = UDim2.new(1, -10, 0, 40)
    container.BackgroundTransparency = 1
    container.Parent = frame

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.5, -5, 1, 0)
    label.Position = UDim2.new(0, 0, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = "  " .. name
    label.TextColor3 = Color3.new(1, 1, 1)
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = container
label.ZIndex = 999

    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0.5, -5, 1, 0)
    button.Position = UDim2.new(0.5, 5, 0, 0)
    button.BackgroundColor3 = value and Color3.new(0, 0.6, 0) or Color3.new(0.6, 0, 0)
    button.TextColor3 = Color3.new(1, 1, 1)
    button.Text = tostring(value)
    button.Parent = container
button.ZIndex = 999

    button.MouseButton1Click:Connect(function()
        value = not value
        button.Text = tostring(value)
        button.BackgroundColor3 = value and Color3.new(0, 0.6, 0) or Color3.new(0.6, 0, 0)
        stats:SetAttribute(name, value)
    end)
end

local function createTextBox(name, value)
    local container = Instance.new("Frame")
    container.Size = UDim2.new(1, -10, 0, 40)
    container.BackgroundTransparency = 1
    container.Parent = frame
container.ZIndex = 999

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.5, -5, 1, 0)
    label.Position = UDim2.new(0, 0, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = "  " .. name
    label.TextColor3 = Color3.new(1, 1, 1)
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = container
label.ZIndex = 999

    local textBox = Instance.new("TextBox")
    textBox.Size = UDim2.new(0.5, -5, 1, 0)
    textBox.Position = UDim2.new(0.5, 5, 0, 0)
    textBox.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
    textBox.TextColor3 = Color3.new(1, 1, 1)
    textBox.Text = tostring(value)
    textBox.ClearTextOnFocus = false
    textBox.Parent = container
textBox.ZIndex = 999

    textBox.FocusLost:Connect(function()
        local newValue = textBox.Text
        stats:SetAttribute(name, newValue)
    end)
end

for name, value in pairs(stats:GetAttributes()) do
    if type(value) == "boolean" then
        createBoolButton(name, value)
    elseif type(value) == "string" then
        createTextBox(name, value)
    end
end
end,
})

local Tab = Window:CreateTab("Beta", 88065516251752)
Tab:CreateButton({
Name = "[🤖] AI For Exe ",
Callback = function()
local Players = game:GetService("Players")
local PathfindingService = game:GetService("PathfindingService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
local Humanoid = Character:WaitForChild("Humanoid")

local TargetPlayer = nil
local Following = false
local Attacking = false

local ScreenGui = Instance.new("ScreenGui", game.Players.LocalPlayer.PlayerGui)
local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 200, 0, 50)
Frame.Position = UDim2.new(0.5, -100, 0.3, 0)
Frame.BackgroundColor3 = Color3.new(0, 0, 0.2)
Frame.BorderSizePixel = 2
Frame.Draggable = true
Frame.Active = true

local ToggleButton = Instance.new("TextButton", Frame)
ToggleButton.Size = UDim2.new(1, -10, 1, -10)
ToggleButton.Position = UDim2.new(0, 5, 0, 5)
ToggleButton.Text = "BETA!"
ToggleButton.BackgroundColor3 = Color3.new(0, 1, 0)

local function findClosestAlivePlayer()
    local displayPlayers = ReplicatedStorage:FindFirstChild("displayPlayers")
    if not displayPlayers then return nil end

    local closestPlayer = nil
    local closestDistance = math.huge

    for _, playerData in ipairs(displayPlayers:GetChildren()) do
        local healthValue = playerData:FindFirstChild("health")
        if healthValue and healthValue:IsA("NumberValue") and healthValue.Value > 0 then
            local player = Players:FindFirstChild(playerData.Name)
            if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                local distance = (HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
                if distance < closestDistance then
                    closestPlayer = player
                    closestDistance = distance
                end
            end
        end
    end

    return closestPlayer
end

local function updateDisplayPlayers()
    while Following do
        local displayPlayers = ReplicatedStorage:FindFirstChild("displayPlayers")
        if not displayPlayers then
            task.wait(0.1)
        else
            break
        end
    end
end

local function autoJump()
    while Following do
        if Humanoid.MoveDirection.Magnitude > 0 and Humanoid:GetState() ~= Enum.HumanoidStateType.Freefall then
            Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
        task.wait(0.3)
    end
end

local function followTarget()
    while Following do
        updateDisplayPlayers()
        TargetPlayer = findClosestAlivePlayer()
        if not TargetPlayer then
            Following = false
            ToggleButton.Text = "Follow"
            ToggleButton.BackgroundColor3 = Color3.new(0, 1, 0)
            Attacking = false
            break
        end

        local TargetRoot = TargetPlayer.Character.HumanoidRootPart
        local Path = PathfindingService:CreatePath({
            AgentRadius = 2,
            AgentHeight = 5,
            AgentCanJump = true,
            AgentJumpHeight = 7,
            AgentWalkableClimb = 2
        })

        Path:ComputeAsync(HumanoidRootPart.Position, TargetRoot.Position)
        local Waypoints = Path:GetWaypoints()

        for _, Waypoint in ipairs(Waypoints) do
            if not Following then break end
            Humanoid:MoveTo(Waypoint.Position)
            Humanoid.MoveToFinished:Wait()
        end
        task.wait(0)
    end
end

local function attackLoop()
    while Attacking do
        ReplicatedStorage.remotes.abilities:FireServer("attack")
        task.wait(0) 
    end
end

ToggleButton.MouseButton1Click:Connect(function()
    if Following then
        Following = false
        Attacking = false
        ToggleButton.Text = "Start"
        ToggleButton.BackgroundColor3 = Color3.new(0, 1, 0)
    else
        Following = true
        Attacking = true
        ToggleButton.Text = "Stop"
        ToggleButton.BackgroundColor3 = Color3.new(1, 0, 0)

        task.spawn(attackLoop) 
        task.spawn(autoJump) 
        followTarget()
    end
end)
end,
})

local player = game.Players.LocalPlayer
local defaultSpeed = 16
local runSpeed = 35
local currentAnimation

local screenGui = Instance.new("ScreenGui", game.CoreGui)
local button = Instance.new("TextButton", screenGui)

button.Size = UDim2.new(0, 100, 0, 50)
button.Position = UDim2.new(0.5, -50, 0.1, 0)
button.Text = "Run"
button.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
button.Draggable = true
button.Active = true
button.Visible = false

local function stopCurrentAnimation(humanoid)
    if currentAnimation then
        currentAnimation:Stop()
        currentAnimation = nil
    end
end

local function setupCharacter(char)
    local humanoid = char:FindFirstChildOfClass("Humanoid")
    local rootPart = char:FindFirstChild("HumanoidRootPart")

    if humanoid and rootPart then
        stopCurrentAnimation(humanoid)

        local selection = workspace.game.selectionIntro.positions.survivors
        local targetPos

        for i = 1, 7 do
            local part = selection:FindFirstChild("player" .. i)
            if part and #part:GetChildren() == 0 then
                targetPos = part.Position
                break
            end
        end

        if targetPos then
            rootPart.CFrame = CFrame.new(targetPos.X, 2, 113)
            humanoid.WalkSpeed = runSpeed

            local animRun = Instance.new("Animation")
            animRun.AnimationId = "rbxassetid://76389912099262"
            currentAnimation = humanoid:LoadAnimation(animRun)
            currentAnimation:Play()

            humanoid:MoveTo(targetPos)

            humanoid.MoveToFinished:Connect(function()
                stopCurrentAnimation(humanoid)
                local animIdle = Instance.new("Animation")
                animIdle.AnimationId = "rbxassetid://114478970530288"
                currentAnimation = humanoid:LoadAnimation(animIdle)
                currentAnimation:Play()
                humanoid.WalkSpeed = defaultSpeed
            end)
        end
    end
end

button.MouseButton1Click:Connect(function()
    if player.Character then
        setupCharacter(player.Character)
    end
end)

local part = Instance.new("Part", workspace)
part.Size = Vector3.new(13, 408, 133)
part.Position = Vector3.new(-187.25, -7.018, -39.75)
part.Transparency = 1
part.CanCollide = true
part.Anchored = true
part.Rotation = Vector3.new(90, 90, 0)

Tab:CreateToggle({
Name = "Show Me On SelectionIntro",
CurrentValue = false,
Flag = "hhhhhhh",
Callback = function(Value)
button.Visible = Value
end,
})

local Tab = Window:CreateTab("Misc", 18683003750)

Tab:CreateButton({
Name = "Anti Dead Or Stun (Public!)",
Callback = function()
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:FindFirstChildWhichIsA("Humanoid")
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
local runService = game:GetService("RunService")
local userInputService = game:GetService("UserInputService")

local speed = 5
local tpwalking = true
local gravitySpeed = 0.5
local anchoredState = false
local gravityEnabled = true
local jumpEnabled = true
local tpwalkEnabled = true

local function isOnGround()
    local rayOrigin = humanoidRootPart.Position
    local rayDirection = Vector3.new(0, -3.5, 0)
    local raycastParams = RaycastParams.new()
    raycastParams.FilterDescendantsInstances = {character}
    raycastParams.FilterType = Enum.RaycastFilterType.Blacklist
    local raycastResult = workspace:Raycast(rayOrigin, rayDirection, raycastParams)  
    return raycastResult ~= nil
end

local function jumpCharacter()
    if jumpEnabled and humanoid and humanoidRootPart then
        character:TranslateBy(Vector3.new(0, 15, 0))
        task.wait(0.2)
        while gravityEnabled and not isOnGround() do  
            character:TranslateBy(Vector3.new(0, -gravitySpeed, 0))  
            task.wait(0.02)  
        end  
    end
end

local gui = Instance.new("ScreenGui", player.PlayerGui)
gui.ResetOnSpawn = true

local speedLabel = Instance.new("TextLabel", gui)
speedLabel.Size = UDim2.new(0, 200, 0, 50)
speedLabel.Position = UDim2.new(0.5, -100, 0.1, 0)
speedLabel.BackgroundTransparency = 0.5
speedLabel.TextScaled = true
speedLabel.Visible = false
speedLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
speedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
speedLabel.Font = Enum.Font.SourceSansBold

local function toggleAnchoredState()
    anchoredState = not anchoredState
    humanoidRootPart.Anchored = anchoredState
    gravityEnabled = anchoredState
    jumpEnabled = anchoredState
    tpwalkEnabled = anchoredState
    print(anchoredState and "HumanoidRootPart Anchored: ON" or "HumanoidRootPart Anchored: OFF")
end

if userInputService.TouchEnabled then
    print("You are mobile")

    local speedBox = Instance.new("TextBox", gui)
    speedBox.Size = UDim2.new(0, 200, 0, 50)
    speedBox.Position = UDim2.new(0.5, 0, 0, 0)
    speedBox.PlaceholderText = "Enter Speed"
    speedBox.Text = ""
    speedBox.ClearTextOnFocus = true
    speedBox.BackgroundTransparency = 0.3
    speedBox.BorderSizePixel = 0
    speedBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    speedBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    speedBox.Font = Enum.Font.SourceSansBold
speedBox.AnchorPoint = Vector2.new(0.5, 0.5)

    local corner = Instance.new("UICorner", speedBox)
    corner.CornerRadius = UDim.new(0, 10)

    local applyBtn = Instance.new("TextButton", gui)
    applyBtn.Size = UDim2.new(0, 200, 0, 50)
    applyBtn.Position = UDim2.new(0.5, 0, 0.08, 0)
    applyBtn.Text = "Apply Speed"
    applyBtn.BackgroundTransparency = 0.3
    applyBtn.BorderSizePixel = 0
    applyBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    applyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    applyBtn.Font = Enum.Font.SourceSansBold
applyBtn.TextScaled = true
applyBtn.AnchorPoint = Vector2.new(0.5, 0.5)

    local corner2 = Instance.new("UICorner", applyBtn)
    corner2.CornerRadius = UDim.new(0, 10)

    applyBtn.MouseButton1Click:Connect(function()
        local newSpeed = tonumber(speedBox.Text)
        if newSpeed and newSpeed > 0 then
            speed = newSpeed
            speedLabel.Text = "Speed: " .. speed
            speedLabel.Visible = true
            task.wait(1)
            speedLabel.Visible = false
        end
    end)

    local toggleBtn = Instance.new("TextButton", gui)
    toggleBtn.Size = UDim2.new(0, 200, 0, 50)
    toggleBtn.Position = UDim2.new(0, 0, 0.4, 0)
    toggleBtn.Text = "Disabled"
    toggleBtn.BackgroundTransparency = 0.3
    toggleBtn.BorderSizePixel = 0
    toggleBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    toggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    toggleBtn.Font = Enum.Font.SourceSansBold
toggleBtn.TextScaled = true

    local corner3 = Instance.new("UICorner", toggleBtn)
    corner3.CornerRadius = UDim.new(0, 10)

    toggleBtn.MouseButton1Click:Connect(function()
        toggleAnchoredState()
        toggleBtn.Text = anchoredState and "Enabled" or "Disabled"
    end)

    local jumpBtn = player.PlayerGui.TouchGui.TouchControlFrame:FindFirstChild("JumpButton")
    if jumpBtn then
        jumpBtn.MouseButton1Click:Connect(jumpCharacter)
    end
else
    print("You are computer")

    game.StarterGui:SetCore("SendNotification", {
        Title = "Speed Control",
        Text = "Press V + Scroll (Down, Up) to (Decrease, Increase) Speed and V to Toggle",
        Duration = 5
    })

    userInputService.InputChanged:Connect(function(input)
        if userInputService:IsKeyDown(Enum.KeyCode.V) and (input.UserInputType == Enum.UserInputType.MouseWheel) then
            if input.Position.Z > 0 then
                speed = math.min(speed + 1, 100)
            else
                speed = math.max(speed - 1, 1)
            end

            speedLabel.Text = "Speed: " .. speed
            speedLabel.Visible = true

            task.wait(1)
            speedLabel.Visible = false
        end
    end)

    userInputService.InputBegan:Connect(function(input, gameProcessed)
        if not gameProcessed then
            if input.KeyCode == Enum.KeyCode.V then
                toggleAnchoredState()
            elseif input.KeyCode == Enum.KeyCode.Space then
                jumpCharacter()
            end
        end
    end)
end

runService.Heartbeat:Connect(function(delta)
    if tpwalkEnabled and tpwalking and humanoid and humanoid.MoveDirection.Magnitude > 0 then
        character:TranslateBy(humanoid.MoveDirection * speed * delta * 10)
    end
end)

runService.RenderStepped:Connect(function()
    if gravityEnabled and not isOnGround() then
        humanoidRootPart.CFrame = humanoidRootPart.CFrame * CFrame.new(0, -gravitySpeed, 0)
    end
end)
end,
})

local player = game.Players.LocalPlayer

local toggleState = false
local Toggle = Tab:CreateToggle({
    Name = "Can Climb",
    CurrentValue = false,
    Flag = "Toggle_Ladder",
    Callback = function(Value)
        toggleState = Value

        local currentMap = game.Workspace:FindFirstChild("game") and game.Workspace.game:FindFirstChild("currentMap")
        if not currentMap then return end

        for _, part in ipairs(currentMap:GetDescendants()) do
            if part:IsA("BasePart") and part.Name == "ladder" then
                part.Transparency = toggleState and 0 or 1
                part.CanCollide = toggleState
            end
        end
    end,
})

local Toggle = Tab:CreateToggle({
    Name = "Client Abilities No Countdown + Fix Abilities No Countdown",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        _G.ToggleState = Value
    end,
})

_G.ToggleState = false

spawn(function()
    while true do
        wait(0)
        if _G.ToggleState then
            if game.ReplicatedStorage.displayPlayers:FindFirstChild(game.Players.LocalPlayer.Name) and 
               game.ReplicatedStorage.displayPlayers[game.Players.LocalPlayer.Name]:FindFirstChild("cooldowns") then

                for _, child in ipairs(game.ReplicatedStorage.displayPlayers[game.Players.LocalPlayer.Name].cooldowns:GetChildren()) do
                    if child:IsA("NumberValue") then
                        child:Destroy()
                    end
                end
            else
               
            end
        end
    end
end)

local player = game.Players.LocalPlayer
local lastExit = nil
local teleportEnabled = false

local function findExit()
    local map = game.Workspace:FindFirstChild("game") and game.Workspace.game:FindFirstChild("currentMap")
    if not map then return nil end

    local exitRing = nil
    for _, obj in ipairs(map:GetDescendants()) do
        if obj:IsA("Model") and obj.Name == "exitRing" and obj.PrimaryPart then
            exitRing = obj
            break
        end
    end

    if exitRing then return exitRing.PrimaryPart end

    local function checkExits(path)
        local exits = path and path:FindFirstChild("default") and path.default:FindFirstChild("exits")
        if exits then
            for _, obj in ipairs(exits:GetChildren()) do
                if obj:IsA("Part") and (obj.Name == "1" or obj.Name == "2" or obj.Name == "3" or obj.Name == "4") and obj:FindFirstChildOfClass("TouchTransmitter") then
                    return obj
                end
            end
        end
        return nil
    end

    return checkExits(map:FindFirstChild("you can't run")) or checkExits(map:FindFirstChild("base"))
end

task.spawn(function()
    while true do
        if teleportEnabled then
            local character = player.Character
            if character and character:FindFirstChild("HumanoidRootPart") then
                local exit = findExit()
                if exit and exit ~= lastExit then
                    lastExit = exit
                    character.HumanoidRootPart.CFrame = exit.CFrame
                end
            end
        end
        task.wait(0.5)
    end
end)

local Toggle = Tab:CreateToggle({
    Name = "Auto Escape",
    CurrentValue = false,
    Flag = "Toggle_Teleport",
    Callback = function(Value)
        teleportEnabled = Value
    end,
})

Tab:CreateButton({
Name = "Aimbot",
Callback = function()
local gui = Instance.new("ScreenGui") local title = Instance.new("TextLabel") local frame = Instance.new("TextButton") local close = Instance.new("TextButton") local minimize = Instance.new("TextButton") local textBox = Instance.new("TextBox") local aimButton = Instance.new("TextButton")

gui.Parent = game.CoreGui title.Parent = gui title.Size = UDim2.new(0, 200, 0, 50) title.Position = UDim2.new(0.5, -100, 0.3, 0) title.BackgroundColor3 = Color3.fromRGB(50, 50, 50) title.Text = "Simple Aimbot" title.TextColor3 = Color3.fromRGB(255, 255, 255)

title.Active = true title.Draggable = true

frame.Parent = title frame.Size = UDim2.new(1, 0, 3, 0) frame.Position = UDim2.new(0, 0, 1, 0) frame.BackgroundColor3 = Color3.fromRGB(70, 70, 70) frame.Text = "" frame.AutoButtonColor = false

close.Parent = title close.Size = UDim2.new(0, 30, 0, 30) close.Position = UDim2.new(1, -35, 0, 10) close.BackgroundColor3 = Color3.fromRGB(200, 50, 50) close.Text = "X" close.TextColor3 = Color3.fromRGB(255, 255, 255)

minimize.Parent = title minimize.Size = UDim2.new(0, 30, 0, 30) minimize.Position = UDim2.new(1, -55, 0, 25) minimize.BackgroundColor3 = Color3.fromRGB(200, 200, 50) minimize.Text = "-" minimize.TextColor3 = Color3.fromRGB(255, 255, 255) minimize.AnchorPoint = Vector2.new(0.5, 0.5)

textBox.Parent = frame textBox.Size = UDim2.new(0.8, 0, 0, 30) textBox.Position = UDim2.new(0.1, 0, 0.1, 0) textBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255) textBox.PlaceholderText = "Enter Name"

aimButton.Parent = frame aimButton.Size = UDim2.new(0.8, 0, 0, 30) aimButton.Position = UDim2.new(0.1, 0, 0.3, 0) aimButton.BackgroundColor3 = Color3.fromRGB(100, 100, 255) aimButton.Text = "Start Aimbot" aimButton.TextColor3 = Color3.fromRGB(255, 255, 255)

local aimbotEnabled = false local runService = game:GetService("RunService") local players = game:GetService("Players") local camera = game.Workspace.CurrentCamera

local function getTargetPlayer(name) for _, player in pairs(players:GetPlayers()) do if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then local displayName = player.DisplayName:lower() local username = player.Name:lower() if displayName:find(name:lower()) or username:find(name:lower()) then return player.Character.HumanoidRootPart end end end return nil end

aimButton.MouseButton1Click:Connect(function() local targetName = textBox.Text if targetName ~= "" then aimbotEnabled = not aimbotEnabled aimButton.Text = aimbotEnabled and "Stop Aimbot" or "Start Aimbot" if aimbotEnabled then runService:BindToRenderStep("Aimbot", Enum.RenderPriority.Camera.Value, function() local target = getTargetPlayer(targetName) if target then camera.CFrame = CFrame.new(camera.CFrame.Position, target.Position) end end) else runService:UnbindFromRenderStep("Aimbot") end else print("Please enter a name!") end end)

players.PlayerAdded:Connect(function() if aimbotEnabled then local target = getTargetPlayer(textBox.Text) if not target then aimButton.Text = "Start Aimbot" aimbotEnabled = false end end end)

players.PlayerRemoving:Connect(function() if aimbotEnabled then local target = getTargetPlayer(textBox.Text) if not target then aimButton.Text = "Start Aimbot" aimbotEnabled = false end end end)

minimize.MouseButton1Click:Connect(function() frame.Visible = not frame.Visible end)

close.MouseButton1Click:Connect(function() gui:Destroy() end) end,
})

Tab:CreateButton({
Name = "Jump No Delay",
Callback = function()
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local UserInputService = game:GetService("UserInputService")
local jumping = false

local function isGrounded()
    local humanoid = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        return humanoid:GetState() == Enum.HumanoidStateType.Running or humanoid:GetState() == Enum.HumanoidStateType.Landed
    end
    return false
end

local function jump()
    if isGrounded() then
        LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
    end
end

local function startJumping()
    jumping = true
    while jumping do
        jump()
        wait(0)
    end
end

local function stopJumping()
    jumping = false
end

local function removeJumpButton()
    local touchGui = PlayerGui:FindFirstChild("TouchGui")
    if touchGui then
        local touchControlFrame = touchGui:FindFirstChild("TouchControlFrame")
        if touchControlFrame then
            local jumpButton = touchControlFrame:FindFirstChild("JumpButton")
            if jumpButton then
                jumpButton:Destroy()
            end
        end
    end
end

local function createJumpButton()
    local touchGui = PlayerGui:FindFirstChild("TouchGui")
    if touchGui then
        local touchControlFrame = touchGui:FindFirstChild("TouchControlFrame")
        if touchControlFrame then
            local jumpButton = Instance.new("ImageButton")
            jumpButton.Name = "JumpButton"
            jumpButton.Size = UDim2.new(0, 120, 0, 120)
            jumpButton.Position = UDim2.new(1, -150, 1, -150)
            jumpButton.Parent = touchControlFrame
            jumpButton.BackgroundColor3 = Color3.new(0, 0, 0)
            jumpButton.MouseButton1Down:Connect(startJumping)
            jumpButton.MouseButton1Up:Connect(stopJumping)
        end
    end
end

UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
    if gameProcessedEvent then return end
    if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == Enum.KeyCode.Space then
        startJumping()
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == Enum.KeyCode.Space then
        stopJumping()
    end
end)

removeJumpButton()
createJumpButton()
end,
})

local running = false 

local Toggle = Tab:CreateToggle({
   Name = "Toggle laserHit Sound (Spam)",
   CurrentValue = false,
   Flag = "LaserHitToggle",
   Callback = function(Value)
      running = Value 
      if running then
         while running and wait() do
            game:GetService("ReplicatedStorage"):WaitForChild("remotes"):WaitForChild("actions"):FireServer("laserHit")
         end
      end
   end,
})

Tab:CreateButton({
Name = "One Click laserHit Sound",
Callback = function()
            game:GetService("ReplicatedStorage"):WaitForChild("remotes"):WaitForChild("actions"):FireServer("laserHit")
end,
})



Tab:CreateButton({
Name = "Floor (Selection Intro) canCollide",
Callback = function()
game.Workspace.game.selectionIntro.floor.floor.CanCollide = true
end,
})

Tab:CreateButton({
Name = "All Abilities (Unfinished)",
Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Biem6ondo/Sonic.exe/refs/heads/main/allskill.txt"))()
end,
})

local idtwo = false

local Toggle = Tab:CreateToggle({
    Name = "Hitbox mode",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        idtwo = Value
        if not idtwo then
            for _, v in pairs(workspace:GetDescendants()) do
                if v:IsA("BasePart") and v.Name == "hitbox" then
                    v.Transparency = 1
                end
            end
        else
            task.spawn(function()
                while idtwo do
                    for _, v in pairs(workspace:GetDescendants()) do
                        if v:IsA("BasePart") and v.Name == "hitbox" then
                            v.Transparency = 0.5
                        end
                    end
                    wait(2)
                end
            end)
        end
    end
})

local hitboxSizes = {}

for _, v in pairs(workspace:GetDescendants()) do
    if v:IsA("BasePart") and v.Name == "hitbox" then
        hitboxSizes[v] = v.Size
    end
end

Tab:CreateButton({
Name = "+5 Hitbox",
Callback = function()
for _, v in pairs(workspace:GetDescendants()) do
if v:IsA("BasePart") and v.Name == "hitbox" then
v.Size = v.Size + Vector3.new(5, 5, 5)
end
end
end,
})

Tab:CreateButton({
Name = "-5 Hitbox",
Callback = function()
for _, v in pairs(workspace:GetDescendants()) do
if v:IsA("BasePart") and v.Name == "hitbox" then
v.Size = v.Size - Vector3.new(5, 5, 5)
end
end
end,
})

Tab:CreateButton({
Name = "View Players Setting",
Callback = function()

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.CoreGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0.3, 0, 0.5, 0)
frame.Position = UDim2.new(0.35, 0, 0.25, 0)
frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
frame.Parent = screenGui
frame.Active = true
frame.Draggable = true

local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -35, 0, 5)
closeButton.Text = "X"
closeButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.Parent = frame
closeButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

local scrollFrame = Instance.new("ScrollingFrame")
scrollFrame.Size = UDim2.new(1, -10, 1, -40)
scrollFrame.Position = UDim2.new(0, 5, 0, 35)
scrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
scrollFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
scrollFrame.ScrollBarThickness = 5
scrollFrame.Parent = frame

local listLayout = Instance.new("UIListLayout")
listLayout.Parent = scrollFrame
listLayout.SortOrder = Enum.SortOrder.LayoutOrder

local function updateStats()
    for _, child in pairs(scrollFrame:GetChildren()) do
        if child:IsA("TextLabel") then
            child:Destroy()
        end
    end
    
    local statsFolder = ReplicatedStorage:FindFirstChild("displayStats")
    if not statsFolder then return end
    
    for _, playerFolder in pairs(statsFolder:GetChildren()) do
        if playerFolder:IsA("Folder") and playerFolder:FindFirstChild("settings") then
            local playerName = playerFolder.Name
            local settingsFolder = playerFolder:FindFirstChild("settings")
            
            local title = Instance.new("TextLabel")
            title.Size = UDim2.new(1, -10, 0, 25)
            title.Text = "* Player: " .. playerName
            title.TextColor3 = Color3.fromRGB(255, 255, 255)
            title.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
            title.Parent = scrollFrame
            
            for _, setting in pairs(settingsFolder:GetChildren()) do
                if setting:IsA("NumberValue") or setting:IsA("BoolValue") or setting:IsA("StringValue") then
                    local valueText = setting.Value
                    if setting:IsA("BoolValue") then
                        valueText = valueText and "Enable" or "Disabled"
                    end
                    
                    local settingLabel = Instance.new("TextLabel")
                    settingLabel.Size = UDim2.new(1, -10, 0, 25)
                    settingLabel.Text = setting.Name .. ": " .. tostring(valueText)
                    settingLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
                    settingLabel.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
                    settingLabel.Parent = scrollFrame
settingLabel.BorderSizePixel = 0
                end
            end
        end
    end
    
    scrollFrame.CanvasSize = UDim2.new(0, 0, 0, listLayout.AbsoluteContentSize.Y)
end

listLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    scrollFrame.CanvasSize = UDim2.new(0, 0, 0, listLayout.AbsoluteContentSize.Y)
end)

while true do
    updateStats()
    wait(5)
end
end, })

local executorSupportsHook = pcall(getrawmetatable, game)
local xValue = nil
local blockInvoke = true
local runningRandom = false

local commands = {}

commands["help"] = function()
    return "Commands: help, random x y, stop (disable block), stoprandom (stop random loop), enter a number to set fake ping"
end

commands["random"] = function(x, y)
    x, y = tonumber(x), tonumber(y)
    if x and y then
        runningRandom = true
        spawn(function()
            while runningRandom do
                xValue = math.random(x, y)
                wait(2)
            end
        end)
        return "Random mode activated (" .. x .. " to " .. y .. ")"
    end
    return "Error: Invalid parameters"
end

commands["stoprandom"] = function()
    runningRandom = false
    return "Random mode stopped"
end

commands["stop"] = function()
    blockInvoke = false
    return "InvokeServer block disabled"
end

local function executeCommand(input)
    local num = tonumber(input)
    if num then
        xValue = num
        blockInvoke = true
        return "Fake ping set to " .. num
    end

    local words = {}
    for word in input:gmatch("%S+") do
        table.insert(words, word)
    end

    if #words == 1 and commands[words[1]] then
        return commands[words[1]]()
    elseif #words == 3 and commands[words[1]] then
        return commands[words[1]](words[2], words[3])
    end

    return "Command does not exist or has incorrect syntax"
end

local inputPlaceholder = executorSupportsHook and "Enter a number or command..." or "Executor not supported"

local Input = Tab:CreateInput({
   Name = "Set Fake Ping (Type Help)",
   CurrentValue = "",
   PlaceholderText = inputPlaceholder,
   RemoveTextAfterFocusLost = false,
   Flag = "Input1",
   Callback = function(Text)
       local result = executeCommand(Text)
       if result then
           Rayfield:Notify({
               Title = "Ping Notification",
               Content = result,
               Duration = 4,
               Image = "rewind",
           })
       end
   end,
})

if executorSupportsHook then
    local mt = getrawmetatable(game)
    setreadonly(mt, false)

    local oldNamecall = mt.__namecall

    mt.__namecall = newcclosure(function(self, ...)
        local args = {...}
        if self == game.ReplicatedStorage.remotes.gameStats and getnamecallmethod() == "InvokeServer" then
            if blockInvoke and xValue then
                return oldNamecall(self, 0, xValue)
            end
        end
        return oldNamecall(self, unpack(args))
    end)

    setreadonly(mt, true)



else
    Rayfield:Notify({
        Title = "Executor Error",
        Content = "Your executor does not support metatable hooking.",
        Duration = 5,
        Image = "rewind",
    })
end

local RunService = game:GetService("RunService")

local function getPing()
    return game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue()
end

task.spawn(function()
    while true do
        if getPing() >= 5000 then
Rayfield:Notify({
   Title = "Fixing Ping",
   Content = "Your Ping Is Being Fixed, Please Wait!",
   Duration = 1,
   Image = "rewind",
})


for _, v in pairs({ToggleHeatWave, ToggleOrb, ToggleFlashBang, SliverBarrier, TailsDollTrap, ReviveActions, ToggleGrapple, TailsDollSlash, Shadow_homingAttackState_attacking, Shadow_boostState_landed}) do  
    v:Set(false)  
end

        end
        task.wait(5)
    end
end)

local Player = game:GetService("Players").LocalPlayer

Player.CharacterAdded:Connect(function(Character)
    canturnoff:Set(false)
canturnoffa:Set(false)
end)

print("Disabled welcome notify because is suck")

local userInputService = game:GetService("UserInputService")

if userInputService.TouchEnabled then
    print("You are mobile")
else
    print("You are computer")
end

end

task.defer(function()
    local lastCount = 0
    while task.wait(0.05) do
        local CurrentMap = workspace:FindFirstChild("game") and workspace.game:FindFirstChild("currentMap")
        if CurrentMap then
            local children = CurrentMap:GetChildren()
            if #children ~= lastCount then
                lastCount = #children
                for _, v in ipairs(children) do
                    if v:IsA("MeshPart") and (v.Name == "stuff" or v.Name == "impact") and v.Parent then
                        v:Destroy()
                    end
                end
            end
        end
    end
end)
