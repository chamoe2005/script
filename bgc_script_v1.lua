_G.LastSell = 0
_G.player = game:GetService("Players").LocalPlayer
_G.TeleportDelay = 3

local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   wait(1)
   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

local library = require(game.ReplicatedStorage:WaitForChild("Nevermore"):WaitForChild("Library"))





local fartsound = Instance.new("Sound")
fartsound.SoundId = "rbxassetid://6454805792"
fartsound.Looped = false
fartsound.Parent = workspace

local wally = loadstring(game:HttpGet(("https://raw.githubusercontent.com/chamoe2005/script/main/wally"),true))()
local farm = wally:CreateWindow('Auto Farm')

	farm:Section("Farm")
    --farm:Toggle('Auto-Bubble Blow', {flag = 'Bubble'})
	farm:Toggle('Auto-Bubble Blow V2', {flag = 'Bubble2'}, function() library.Variables.AutoClicker = farm.flags.Bubble2 end)
    farm:Box('Sell Bubble Delay', {location = _G,
        flag = "SellBubbleDelay",
        type = 'number'
    })
	_G.SellBubbleDelay = 0
	farm:Dropdown("Sell Bubble Area", {location = _G, flag = "SellBubbleArea", list = {"No Sell", "Sell 1", "Sell 2"}})
	_G.SellBubbleArea = "No Sell"
    
	farm:Button('Unknown', function() 
	spawn(function() 
		local fartsound = Instance.new("Sound")
		fartsound.SoundId = "rbxassetid://6454805792"
		fartsound.Looped = false
		fartsound.Parent = workspace
		fartsound:Play() 
	end) end)
	
	farm:Section("Chests")
	for a,b in pairs(library.Directory.Chests) do
		farm:Toggle(b.name, {location = _G, flag = b.name})
		_G[b.name] = false
	end
	
	farm:Section("Misc")

local pet = wally:CreateWindow('Pets')
    pet:Box('Auto Shiny Amount', {location = _G,
        flag = "AutoShinyNum",
        type = 'number'
    })
_G.AutoShinyNum = 0
   

local SpinPrizeWheel = function()
		local playerLibrary = library.Save.Get()
		if ((not playerLibrary.PrizeWheelTime) or (os.time() > playerLibrary.PrizeWheelTime)) and farm.flags.FreePrizeWheel then
			local ohTable1 = {
				[1] = {
					[1] = false
				},
				[2] = {
					[1] = 2
				}
			}

			game:GetService("ReplicatedStorage").Remotes["free wheel spin"]:InvokeServer(ohTable1)
			
			local NewItemWindow = game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("New Item")
			
			while wait(1) and not NewItemWindow.Enabled do
				print(NewItemWindow.Enabled)
			end
			
			for i, connection in pairs(getconnections(NewItemWindow.Frame.Claim.Activated)) do
				connection:Fire()
				print("Closing New Item Window")
			end
		else
			print((playerLibrary.PrizeWheelTime - os.time()) / 60 .. " minutes until Prize Wheel")
			local NewItemWindow = game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("New Item")
			print(NewItemWindow.Enabled)
		end
end

		farm:Toggle('Free Prize Wheel', {flag = 'FreePrizeWheel'}, function() SpinPrizeWheel() end)
 
	
spawn(function ()
	while(wait(1)) do
		if _G.SellBubbleDelay > 0 and os.time() > (_G.LastSell + _G.SellBubbleDelay) then
			if _G.SellBubbleArea ~= "No Sell" then
				_G.player.Character:SetPrimaryPartCFrame(CFrame.new(game:GetService("Workspace").MAP.Activations[_G.SellBubbleArea].Position))
				wait(.1)
				_G.LastSell = os.time()
			end
		end	
	end
end)

spawn(function()
	while(wait(60)) do	
		for a,b in pairs(game:GetService("Workspace").MAP.Chests:GetChildren()) do
			if _G[b.name] then
				_G.player.Character:SetPrimaryPartCFrame(CFrame.new(game:GetService("Workspace").MAP.Activations[b.name].Position))
				print(b.name .. " grabbed!")
				wait(_G.TeleportDelay)
			end
		end
	end
end)

spawn(function()
	while wait(60) do
		SpinPrizeWheel()
	end
end)

spawn(function()
	while wait(5) do
		if _G.AutoShinyNum > 0 and _G.AutoShinyNum <= 6 then
			local playerLibrary = library.Save.Get()
			local Pets = {}
			local ohTable1 = {
				[1] = {
					[1] = {}
				},
				[2] = {
					[1] = false
				}
			}
			for i,v in pairs(playerLibrary.Pets) do
				if not v.s then
					if Pets[v.nk] then
						Pets[v.nk] ++
					else
						Pets[v.nk] = 1
					end
				end
			end

			for i,v in pairs(Pets) do
				if v >= _G.AutoShinyNum then
					local counter = 1
					for a,b in pairs(playerLibrary.Pets) do
						if counter <= _G.AutoShinyNum and b.nk == i and not b.s and not b.lock then
							ohTable1[1][1][counter] = b.uid
							counter++
						end
					end
					
					print("Making Shiny " .. i)
					
					for i,v in pairs(ohTable1[1][1]) do
						print(i,v)
					end
					
					game:GetService("ReplicatedStorage").Remotes["make pets shiny"]:InvokeServer(ohTable1)
				end
			end

		end
	end
end)
