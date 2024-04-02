print("hi again")
local player = game.Players.LocalPlayer
local chatService = game:GetService("Chat")
local followPlayer = nil
local speaker = nil

local function checkMessageType(message)
	-- Check for insulting keywords
	if string.find(message, "idiot") or string.find(message, "stupid") or string.find(message, "fat") or string.find(message, "nerd") then
		return "insult"
	end

	-- toxicity?!?!
	if string.find(message, "you") and string.find(message, "bad") then
		return "insult"
	end

	-- toxic part 2?!?!
	if string.find(message, "your") and string.find(message, "bad") then
		return "insult"
	end

	-- akshully
	if string.find(message, "you're") and string.find(message, "bad") then
		return "insult"
	end

	-- akshully part 2
	if string.find(message, "youre") and string.find(message, "bad") then
		return "insult"
	end

	-- so smart!!!!
	if string.find(message, "'") and string.find(message, "*") then
		return "nerd"
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

	if string.find(message, "you") and string.find(message, "lost") then
		return "playerdo"
	end

	if string.find(message, "you") and string.find(message, "lose") then
		return "playerdo"
	end

	if string.find(message, "i") and string.find(message, "lost") then
		return "otherdo"
	end

	if string.find(message, "i") and string.find(message, "lose") then
		return "otherdo"
	end

	if string.find(message, "follow me") then
		followPlayer = speaker.Name
		return "alright"
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
		},
		youlookinrealsussyoverthere = {
			"really bro?",
			"...",
			"really?",
			"wow.",
			"jesus.",
			":|"
		},
		bypass = {
			"...",
			"bro."
		},
		greeting = {
			"hello",
			"hi",
			"whats up?",
			"sup"
		},
		playerwinner = {
			"yay!! i win!",
			"epico",
			"did i do it?",
			"yay!"
		},
		otherwinner = {
			"congrats.",
			"congradulations!",
			"you won!",
			"you did it!",
			"*clapping*",
			"*clapping sfx*"
		},
		nerd = {
			"ok? im a chatbot, you think that correcting me would do anything?",
			"uh... ok? im a chatbot, you think that correcting me would do anything?"
		},
		playerdo = {
			"aw...",
			":(",
			"i'll win next time! i believe in myself!",
			"oh..."
		},
		otherdo = {
			"it's ok, i bet you can win the next round!",
			"that's fine, you don't need to go all out on a lego game!",
			"oh... well," .. speaker .. ", still believe in you! go and try again! you are possible!"
		}
	}

	-- Choose a random reply from the corresponding message type
	local messageReplies = replies[messageType] or replies["normal"]
	return messageReplies[math.random(1, #messageReplies)]
end

game.ReplicatedStorage.DefaultChatSystemChatEvents.OnNewMessage:Connect(function(message)
		local speaker = message.Speaker
		local messageType = checkMessageType(message.Message)
		print(speaker)

		if speaker ~= player and messageType ~= "normal" then
			local distance = (speaker.Character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).magnitude
			if distance <= 30 then
				local randomtime = math.random(1,3)
				wait(randomtime)
				local reply = getRandomReply(messageType)
			game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(reply, "All")
			end
		end
	end)
