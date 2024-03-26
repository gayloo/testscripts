local player = game.Players.LocalPlayer
local chatService = game:GetService("Chat")

local function checkMessageType(message)
    -- Check for insulting keywords
    if string.find(message, "idiot") or string.find(message, "stupid") or string.find(message, "fat") then
        return "insult"
    end

    -- Check for insulting keywords
    if string.find(message, "thanks") or string.find(message, "thx") then
        return "thanking"
    end

    if string.find(message, "ddddy") or string.find(message, "bull") then
        return "youlookinrealsussyoverthere"
    end

    if string.find(message, "ĸƴs") or string.find(message, "damn") then
        return "bypass"
    end

    if string.find(message, "hello") or string.find(message, "hi") or string.find(message, "heya") or string.find(message, "hoi") or string.find(message, "hey") then
        return "greeting"
    end

    if string.find(message, "you") and string.find(message, "won") then
        return "playerwinner"
    end

    if string.find(message, "i") and string.find(message, "won") then
        return "otherwinner"
    end
    
    -- Default to normal if no specific type is found
    return "normal"
end

local function getRandomReply(messageType)
    -- Create tables of possible replies for each message type
    local replies = {
        normal = {
            "i dont understand",
            "uhh",
            "what",
            "my code does indeed not understand what you are saying",
            "scuse me?",
            "huh",
            "erm."
        },
        thanking = {
            "no problem",
            "your welcome",
            "no problemo",
            "naturally",
            "no problem, i do this all the time! i can do this for money, i dont, but i could."
        },
        insult = {
            "thats not very nice >:(",
            "meanie D:",
            ":(",
            "wow dude",
            "wow",
            ":/"
        }
        youlookinrealsussyoverthere = {
            "really bro?",
            "...",
            "really?",
            "wow.",
            "jesus.",
            ":|"
        }
        bypass = {
            "...",
            "bro."
        }
        greeting = {
            "hello",
            "hi",
            "whats up?",
            "sup"
        }
        playerwinner = {
            "yay!! i win!",
            "epico",
            "did i do it?",
            "yay!"
        }
        otherwinner = {
            "congrats.",
            "congradulations!",
            "you won!",
            "you did it!"
        }
    }
    
    -- Choose a random reply from the corresponding message type
    local messageReplies = replies[messageType] or replies["normal"]
    return messageReplies[math.random(1, #messageReplies)]
end

chatService.ChatLoaded:Connect(function()
    chatService.MessagePosted:Connect(function(message)
        local speaker = message.Speaker
        local messageType = checkMessageType(message.Message)
        
        if speaker ~= player and messageType ~= "normal" then
            local distance = (speaker.Character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).magnitude
            if distance <= 30 then
                local randomtime = math.random(1,3)
                wait(randomtime)
                local reply = getRandomReply(messageType)
                chatService:Chat(player.Character.Head, reply, Enum.ChatColor.Blue)
            end
        end
    end)
end)
