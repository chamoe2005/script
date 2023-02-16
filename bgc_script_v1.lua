_G.LastSell = 0
_G.player = game:GetService("Players").LocalPlayer
_G.TeleportDelay = 5
_G.EggDelay = 3
_G.TripleEggs = false

--local dropdowns = {}
--dropdowns.Bubblesell = {"No Sell", "Sell 1", "Sell 2"}
--dropdowns.Eggmode = {"None", "Best", "Any"}



local GC = getconnections or get_signal_cons
	if GC then
		for i,v in pairs(GC(_G.player.Idled)) do
			if v["Disable"] then
				v["Disable"](v)
			elseif v["Disconnect"] then
				v["Disconnect"](v)
			end
		end
	else
		_G.player.Idled:Connect(function()
			local VirtualUser = game:GetService("VirtualUser")
			VirtualUser:CaptureController()
			VirtualUser:ClickButton2(Vector2.new())
		end)
	end

local plr = game.Players.LocalPlayer
local char = plr.Character
local root = char.HumanoidRootPart
local library = require(game.ReplicatedStorage:WaitForChild("Nevermore"):WaitForChild("Library"))

local multiplier = 1
local VIP = false
local playerLibrary = library.Save.Get()

for a,b in pairs(playerLibrary.Gamepasses) do
	if b == library.Directory.Gamepasses["Triple Eggs"].ID then
		multiplier = 3
	elseif b == library.Directory.Gamepasses["VIP"].ID then
		VIP = true
	end
end




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
	
	local autobubbleGUI = game:GetService("CoreGui").ScreenGui:FindFirstChild("Auto-Bubble Blow V2", true)
	
	if _G.autobubble and autobubbleGUI ~= nil then
		for a,b in pairs(getconnections(autobubbleGUI.Checkmark.MouseButton1Click)) do
			b:Fire()
		end
	end
	
	_G.SellBubbleDelay = 0
	farm:Dropdown("Sell Bubble Area", {location = _G, flag = "SellBubbleArea", list = {"No Sell", "Sell 1", "Sell 2"} })
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
		if b.name == "VIP Chest" and not VIP then
		else
			farm:Toggle(b.name, {location = _G, flag = b.name})
		end
		_G[b.name] = false
	end
		
	farm:Section("Misc")
	
local RedeemTwitterCodes = function()
	
	local TwitterCodes = {"gofast", "secrets", "season1", "banana", "bandana", "nana", "scramble", "OPE", "stayfrosty", "lucky"} --"happynewyear", "2022", "OmgSanta", "Rudolph", "Release"}

	for i,v in pairs(TwitterCodes) do
		local ohTable1 = {
			[1] = {
				[1] = v
			},
			[2] = {
				[1] = false
			}
		}
		print("Redeeming " .. v)
		game:GetService("ReplicatedStorage").Remotes["redeem twitter code"]:InvokeServer(ohTable1)
		wait(2)

		--local NewItemWindow = game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("New Item")
		--local timeout = 3
		--local endTime = os.time() + timeout
		
		--while (endTime > os.time()) and wait(1) and not NewItemWindow.Enabled do
			--print(NewItemWindow.Enabled)
			--print(endTime - os.time())
		--end
		
		--if NewItemWindow.Enabled then
			--for i, connection in pairs(getconnections(NewItemWindow.Frame.Claim.Activated)) do
				--connection:Fire()
				--print("Closing New Item Window")
			--end
		--end
	end
	
end
	
	
	farm:Button('Redeem Twitter Codes', function() RedeemTwitterCodes() end)
	

	
local pet = wally:CreateWindow('Pets')
	pet:Toggle('Equip Best', {flag = 'EquipBest'})
    pet:Box('Auto Shiny Amount', {location = _G,
        flag = "AutoShinyNum",
        type = 'number'
    })
_G.AutoShinyNum = 0
   
local EquipBestPets = function()
	if pet.flags.EquipBest then
		local ohTable3 = {
			[1] = {
			[1] = false
			},
			[2] = {
				[1] = 2
			}
		}
		game:GetService("ReplicatedStorage").Remotes["equip best pets"]:FireServer(ohTable3)
	end
end


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
			
		elseif playerLibrary.PrizeWheelTime then
			print((playerLibrary.PrizeWheelTime - os.time()) / 60 .. " minutes until Prize Wheel")
			--local NewItemWindow = game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("New Item")
			--print(NewItemWindow.Enabled)
		end
end

		farm:Toggle('Free Prize Wheel', {flag = 'FreePrizeWheel'}, function() SpinPrizeWheel() end)

local Eggs = {}
for a,b in pairs(game:GetService("ReplicatedStorage")["Game Objects"].Eggs:GetChildren()) do
	for c,d in pairs(b:GetChildren()) do
		if require(d[d.Name]).currency and require(d[d.Name]).cost and not require(d[d.Name]).disabled then
			Eggs[d.Name] = {}
			Eggs[d.Name]["World"] = b.Name
			Eggs[d.Name]["Currency"] = require(d[d.Name]).currency
			Eggs[d.Name]["Cost"] = require(d[d.Name]).cost
		end
	end
end

		farm:Toggle('Free Loot', {flag = 'FreeLoot'})
		farm:Toggle('Claim Bubble Pass', {flag = 'ClaimPass'})



function openEgg(egg)

	local tripleEgg = false

	if multiplier == 3 then 
		tripleEgg = true
	end

	local ohTable2 = {
		[1] = {
			[1] = egg,
			[2] = tripleEgg
		},
		[2] = {
			[1] = false,
			[2] = false
		}
	}
	
	local playerLibrary = library.Save.Get()

	if playerLibrary[Eggs[egg].Currency] > (Eggs[egg].Cost * multiplier) then
		_G.player.Character:SetPrimaryPartCFrame(CFrame.new(game:GetService("Workspace").MAP.Eggs[egg].EGG.Position))
		wait(.5)
		--library.Variables.OpeningEgg = false
		game:GetService("ReplicatedStorage").Remotes["buy egg"]:InvokeServer(ohTable2)
		wait(_G.EggDelay)
	end
end


local egg = wally:CreateWindow('Eggs')
	egg:Section('Select Eggs')
	egg:Dropdown("Buy Mode", {location = _G, flag = "BuyEggMode", list = {"None", "Best", "Any"} })
	
 
	for a,b in pairs(Eggs) do
		egg:Toggle(a, {location = _G, flag = a})
		_G[a] = false
	end

local pickups = {"Coins Present", "Coins Bag", "Large Coin", "Medium Coin", "Small Coin", "Large Diamonds", "Small Diamond", "Orb"}


local drop = wally:CreateWindow('Drops')
	drop:Toggle('Collect Drops', {location = _G, flag = 'drops'})
	drop:Box('Range', {location = _G,
        flag = "droprange",
        type = 'number'
    })
    for a,b in pairs(pickups) do
		drop:Toggle(b, {location = _G, flag = b})
		_G[b] = false
	end

function toTarget(pos, targetPos, targetCFrame)
    local tween_s = game:service"TweenService"
    local info = TweenInfo.new((targetPos - pos).Magnitude/200, Enum.EasingStyle.Quad)
    -- local tic_k = tick()
    local tween, err = pcall(function()
        local tween = tween_s:Create(plr.Character["HumanoidRootPart"], info, {CFrame = targetCFrame})
        tween:Play()
    end)
    
	if not tween then return err end
end

local saveSettings = function()

	local update = {}
	local counter = 1
	
	if isfile("bgcsettings.txt") then
		update = game:GetService("HttpService"):JSONDecode(readfile("bgcsettings.txt"))
	end
	
	if update[plr.Name] == nil then
		update[plr.Name] = {}
	end
		
	for a,b in pairs(game:GetService("CoreGui").ScreenGui:GetDescendants()) do
	
			if b.Name == "Checkmark" and b.Text == utf8.char(10003) then
			
				update[plr.Name][b.Parent.name] = true
				
			elseif b.Name == "Checkmark" and b.Text ~= utf8.char(10003) then
			
				update[plr.Name][b.Parent.name] = false

			elseif b.Name == "Box" and b.Text ~= nil and b.Text ~= "" and b.Text ~= 0 then
			
				update[plr.Name][b.Parent.name] = b.Text
				
			elseif b.Name == "Box" and (b.Text == nil or b.Text == "" or b.Text == 0) then
			
				update[plr.Name][b.Parent.name] = 0

			elseif b.Name == "Selection" then
			
				local currentsetting = b.Text
			
				for i,v in pairs(getconnections(b.Parent.drop.MouseButton1Click)) do
					v:Fire()
				end
				wait(.5)
				update[plr.Name][b.Text] = currentsetting
				for i,v in pairs(b.Parent.DropContainer:GetChildren()) do
					if v.Name == "TextButton" and v.Text == currentsetting then
						for x,y in pairs(getconnections(v.MouseButton1Click)) do
							y:Fire()
						end
					end
				end
			
				--for c,d in pairs(dropdowns) do
					--for e,f in pairs(d) do
						--if f == b.Text then
							--print(c)
							--update[plr.Name][c] = b.Text
						--end
					--end
				--end
			end
			
			
			writefile("bgcsettings.txt", game:GetService("HttpService"):JSONEncode(update))
			
	end

end

local loadSettings = function()

		if isfile("bgcsettings.txt") then

			local json = game:GetService("HttpService"):JSONDecode(readfile("bgcsettings.txt"))
			
			if json[plr.Name] ~= nil then

				for a,b in pairs(game:GetService("CoreGui").ScreenGui:GetDescendants()) do

						if b.Name == "Checkmark" and json[plr.Name][b.Parent.name] and b.Text ~= utf8.char(10003) then
					
							for a,b in pairs(getconnections(b.MouseButton1Click)) do
								b:Fire()
							end
					
						elseif b.Name == "Checkmark" and not json[plr.Name][b.Parent.name] and b.Text == utf8.char(10003) then
						
							for a,b in pairs(getconnections(b.MouseButton1Click)) do
								b:Fire()
							end
							
						elseif b.Name == "Box" and json[plr.Name][b.Parent.name] ~= nil and json[plr.Name][b.Parent.name]~= "" and json[plr.Name][b.Parent.name] ~= 0 then
						
							b.Text = json[plr.Name][b.Parent.name]
							for i,v in pairs(getconnections(b.FocusLost)) do
								v:Fire()
							end
						
						elseif b.Name == "Selection" then
						
							for i,v in pairs(getconnections(b.Parent.drop.MouseButton1Click)) do
								v:Fire()
							end
							wait(.5)
							local selectionname = b.Text
						
							--for c,d in pairs(dropdowns) do
								--for e,f in pairs(d) do
									--if f == b.Text then
										--selectionname = c
									--end
								--end
							--end
						
						
							if json[plr.Name][selectionname] ~= nil and json[plr.Name][selectionname] ~= "" and json[plr.Name][selectionname] ~= 0 and b.Text ~= json[plr.Name][selectionname] then 
								--b.Text = json[selectionname]
								--for i,v in pairs(getconnections(b.Parent.drop.MouseButton1Click)) do
									--v:Fire()
								--end
								--wait(.5)
								for i,v in pairs(b.Parent.DropContainer:GetChildren()) do
									if v.Name == "TextButton" and v.Text == json[plr.Name][selectionname] then
										for x,y in pairs(getconnections(v.MouseButton1Click)) do
											y:Fire()
										end
									end
								end
							else
							
								for i,v in pairs(getconnections(b.Parent.drop.MouseButton1Click)) do
									v:Fire()
								end
								
								
							end
						end			
				end
			end
	end
end

local settingsGUI = wally:CreateWindow('Settings')
settingsGUI:Button('Load Settings', function() loadSettings() end)
settingsGUI:Button('Save Settings', function() saveSettings() end)
	

spawn(function()
	while wait(.1) do
		local bestEgg = {["Name"] = nil, ["Cost"] = 0}
		local playerLibrary = library.Save.Get()
		
	
		if _G.BuyEggMode == "Best" then
			for i,v in pairs(Eggs) do
				if playerLibrary[v.Currency] > (v.Cost * multiplier) and v.Cost > bestEgg.Cost and _G[i] then
					bestEgg.Name = i
					bestEgg.Cost = v.Cost
				end
			end
			if bestEgg.Name then
				--print("Opening " .. bestEgg.Name)
				openEgg(bestEgg.Name)
			end
		elseif _G.BuyEggMode == "Any" then
			for i,v in pairs(Eggs) do
				if _G[i] then
					--print("Opening " .. i)
					openEgg(i)
				end
			end
		end
		
		
		
	end
end)

spawn(function()	
	while wait(.1) do
			--if not _G.collectingchests and not _G.sell and farm.flags.Drops == true and (_G.canafford ~= true or _G.eggSkip == true) then
		if _G.drops then		
			local DropTimeout = os.time() + 30
			--_G.CollectingDrops = true
			
			while _G.drops and (DropTimeout > os.time()) and wait() do
			
				local closest = nil
				local dis = math.huge
				for i , v in ipairs(game.Workspace.Stuff.Pickups:GetChildren()) do
					for x,y in pairs(pickups) do
						if _G[y] and tonumber(_G.droprange) ~= nil then
							if v:FindFirstChild('POS') and v:FindFirstChild(y) and v[y]:FindFirstChild("TouchInterest") and (root.Position-v.POS.Position).magnitude <= tonumber(_G.droprange) and (root.Position-v.POS.Position).magnitude < dis then --and farm.flags.Drops == true  and _G.sell ~= true then
								--root.CFrame = CFrame.new(root.CFrame.X,v.CFrame.Y,root.CFrame.Z)
								closest = v.POS
								dis = (root.Position-v.POS.Position).magnitude
							end
						end
					end
				end
				
					
				if closest ~= nil and (target == nil or target.Parent == nil) then
					local dis = closest.CFrame.Y - root.CFrame.Y
					if dis < (closest.Size.Y * -1) or dis > closest.Size.Y then
						root.CFrame = CFrame.new(root.CFrame.X,closest.CFrame.Y + 2,root.CFrame.Z)
					end
					toTarget(root.Position,closest.Position + Vector3.new(0,2,0),closest.CFrame + Vector3.new(0,2,0))
				end
			end
			--_G.CollectingDrops = false
			--end
		end
		
		if farm.flags.FreeLoot then
		
			local playerLibrary = library.Save.Get()
			for a,b in pairs(library.Directory.FreeGifts) do
				local found = false
				for c,d in pairs(playerLibrary.FreeGiftsRedeemed) do
					if a == d then
						found = true
					end
				end
				if playerLibrary.FreeGiftsTime > b.waitTime and not found then
					game:GetService("ReplicatedStorage").Remotes["redeem free gift"]:InvokeServer({[1] = {[1] = a},[2] = {[1] = false}})
					print("Claiming Loot Bag " .. a)
					wait(1)
				end
				wait(1)
			end
		
		
			local closest = nil
			local dis = math.huge
			for i , v in ipairs(game:GetService("Workspace").Stuff.Lootbags:GetChildren()) do
				closest = v:FindFirstChildWhichIsA("MeshPart")
				dis = (root.Position-v:FindFirstChildWhichIsA("MeshPart").Position).magnitude
				if closest ~= nil then
					local dis = closest.CFrame.Y - root.CFrame.Y
					if dis < (closest.Size.Y * -1) or dis > closest.Size.Y then
						root.CFrame = CFrame.new(root.CFrame.X,closest.CFrame.Y + 2,root.CFrame.Z)
					end
					toTarget(root.Position,closest.Position + Vector3.new(0,0,2),closest.CFrame + Vector3.new(0,0,2))
					print("TP to Lootbag " .. v.Name)
					wait(1)
				end
			end
		
		end
	end
end)
	
spawn(function ()
	while(wait(1)) do
		if _G.SellBubbleDelay > 0 and os.time() > (_G.LastSell + _G.SellBubbleDelay) then
			if _G.SellBubbleArea ~= "No Sell" then
				for i = 1, 5 do
					_G.player.Character:SetPrimaryPartCFrame(CFrame.new(game:GetService("Workspace").MAP.Activations[_G.SellBubbleArea].Position))
					wait(.25)
				end
				_G.LastSell = os.time()
			end
		end	
	end
end)

spawn(function()
	while wait(30) do

		local playerLibrary = library.Save.Get()

		if playerLibrary.BubblePass.Owned and farm.flags.ClaimPass then
		
			local allClaimed = true
			local highestEggPrize = 0

			for a,b in pairs(library.Directory.BubblePass) do
			
				if b.eggs <= playerLibrary.BubblePass.CurrentEggs and not playerLibrary.BubblePass.Claimed[a] then
					print("Claiming Bubble Pass Prize #" .. a .. " - " .. b.eggs .. " eggs")

					local ohTable1 = {
						[1] = {
							[1] = a
						},
						[2] = {
							[1] = false
						}
					}

					game:GetService("ReplicatedStorage").Remotes["claim pass prize"]:FireServer(ohTable1)
					wait(1)
				elseif not playerLibrary.BubblePass.Claimed[a] then
					allClaimed = false
				end
				
				if b.eggs > highestEggPrize then
					highestEggPrize = b.eggs
				end

			end
			
			if allClaimed and playerLibrary.BubblePass.CurrentEggs > highestEggPrize then
			
				print("All Bubble Pass Prizes claimed, restarting pass")
			
				local ohTable1 = {
					[1] = {
						[1] = false
					},
					[2] = {
						[1] = 2
					}
				}

				game:GetService("ReplicatedStorage").Remotes["restart bubble pass"]:FireServer(ohTable1)
			else
				print((highestEggPrize - playerLibrary.BubblePass.CurrentEggs) .. " left before Bubble Pass is complete")
			end
			
			
		end
	end
end)

spawn(function()
	while(wait(.5)) do	
		for a,b in pairs(game:GetService("Workspace").MAP.Chests:GetChildren()) do
			if _G[b.name] then
				repeat
					_G.player.Character:SetPrimaryPartCFrame(CFrame.new(game:GetService("Workspace").MAP.Activations[b.name].Position.X + math.random(1,8), game:GetService("Workspace").MAP.Activations[b.name].Position.Y + 20, game:GetService("Workspace").MAP.Activations[b.name].Position.Z + math.random(1,8)))
					wait(1)
				until game:GetService("Workspace").MAP.Chests:FindFirstChild(b.name) == nil
				print("Attempting to grab " .. b.name)
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
		EquipBestPets()
	end
end)

spawn(function()
	while wait(1) do
		local NewItemWindow = game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("New Item")
				
		--while wait(1) and not NewItemWindow.Enabled do
			--print(NewItemWindow.Enabled)
		--end
		if NewItemWindow.Enabled then		
			for i, connection in pairs(getconnections(NewItemWindow.Frame.Claim.Activated)) do
				connection:Fire()
				print("Closing New Item Window")
			end
		end
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
					
					print("Attempting Shiny " .. i)
					
					for i,v in pairs(ohTable1[1][1]) do
						print(i,v)
					end
					
					game:GetService("ReplicatedStorage").Remotes["make pets shiny"]:InvokeServer(ohTable1)
				end
			end

		end
	end
end)


if _G.autoloadsettings then
	loadSettings()
end