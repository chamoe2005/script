print("Version 5.6")
_G.DoChall = true
				
_G.TwitterCodes = {"happyeaster", "spongebob", "underthesea", "gofast", "secrets", "season1", "bubblegum", "banana", "bandana", "nana", "scramble", "OPE", "stayfrosty", "lucky", "happynewyear", "2022", "OmgSanta", "Rudolph", "Release"}
				
_G["PearlsMin"] = 750000000
_G.highhigh = 99
_G.lowhigh = 33
_G.highlow = .80
_G.lowlow = 0
_G.forcedrops = true
_G.settingsloaded = false
_G.DisabledEggs = {"Valentine's 2023 Egg", "Season 1 Egg"}
_G.LastSell = os.time()
_G.LastDrop = os.time()
_G.droptimeout = .25
_G.TeleportDelay = 2
_G.LastEgg = os.time()
_G.lastBest = {}
_G.EggTimeout = 2
_G.oldeggs = {}
_G["Drop TimeOut"] = 10
_G["Drop Delay"] = 60
_G.DropCoolOff = os.time() + _G["Drop Delay"]
_G.playerCoins = 0

--_G.ChallengeName = "Easter"
--_G.ChallengeRemote = "claim easter prize"

--local dropdowns = {}
--dropdowns.Bubblesell = {"No Sell", "Sell 1", "Sell 2"}
--dropdowns.Eggmode = {"None", "Best", "Any"}


COREGUI = game:GetService("CoreGui")
if not game:IsLoaded() then
	local notLoaded = Instance.new("Message")
	notLoaded.Parent = COREGUI
	notLoaded.Text = 'Waiting for the game to load'
	game.Loaded:Wait()
	notLoaded:Destroy()
end

Players = game:GetService("Players")
PlaceId, JobId = game.PlaceId, game.JobId
--TeleportService = game:GetService("TeleportService")
--TeleportService:Teleport(PlaceId, Players.LocalPlayer)

function GetLocalPlayer()
	local player = Players.LocalPlayer
	while not player do
		player = Players.LocalPlayer
		wait(1)
		print("Waiting for LocalPlayer")
	end

	return player
end

print(GetLocalPlayer().Name)

if not isfile("bgclog" .. GetLocalPlayer().Name .. ".txt") then
	writefile("bgclog" .. GetLocalPlayer().Name .. ".txt", "Start of Log File\n")
end

if not isfile("bgcsettings.txt") then
	writefile("bgcsettings.txt", game:GetService("HttpService"):JSONEncode({["newuser"]= 
																				{["Power 3 "] = false, 
																				["Sky Chest"] = true, 
																				["Galaxy Egg"] = false, 
																				["Lantern Egg"] = true, 
																				["Spotted Egg"] = true, 
																				["Range"] = "50000", 
																				["Coins"] = true, 
																				["Drop TimeOut"] = "30", 
																				["2x Diamonds "] = false, 
																				["Frosted Egg"] = false, 
																				["Clouds"] = false, 
																				["Pearls"] = false, 
																				["Heavenly Chest"] = true, 
																				["Delete Mode"] = "Custom Delete",
																				["Nightmare Egg"] = true,
																				["Pineapple Egg"] = false,
																				["Heaven"] = true,
																				["Godly Luck "] = false,
																				["Power 2 "] = false,
																				["Auto Shiny Amount"] = "6",
																				["Lucky Landing"] = true,
																				["1 Pet Level "] = false,
																				["XP"] = true,
																				["Athena Chest"] = false,
																				["Claim Bubble Pass"] = false,
																				["Tier Rewards"] = true,
																				["Event"] = false,
																				["Num Pets to Delete"] = 0,
																				["Magma Egg"] = true,
																				["3x Shiny Luck "] = false,
																				["Free Prize Wheel"] = true,
																				["Atlantis Main"] = false,
																				["Reaper's Hideout"] = false,
																				["Spawn World Main"] = false,
																				["XP Chest"] = true,
																				["Free Loot"] = true,
																				["Void Egg"] = false,
																				["Max Pet Level "] = false,
																				["The Void"] = true,
																				["Pet "] = false,
																				["Buy Mode"] = "Best",
																				["Main"] = false,
																				["Super Lucky "] = false,
																				["Auto-Bubble Blow V2"] = true,
																				["Coral Island"] = false,
																				["Equip Best"] = true,
																				["Shipwreck Cove"] = false,
																				["Sell Bubble Delay"] = "30",
																				["Fairy World"] = true,
																				["XP Island"] = true,
																				["Sunken Chest"] = false,
																				["Collect Drops"] = true,
																				["Fairy Exchange"] = false,
																				["Space"] = true,
																				["Drop Delay"] = "60",
																				["Deep Ocean"] = false,
																				["Snail Egg"] = false,
																				["Void Chest"] = true,
																				["2x Coins "] = false,
																				["Sell Bubble Area"] = "Sell 2",
																				["Common Egg"] = true,
																				["Diamonds"] = true,
																				["Power 1 "] = false,
																				["Safe Egg"] = true,
																				["Reaper Exchange"] = false,
																				["Group Rewards"] = true,
																				["Banana Bandana on Nana Egg"] = true,
																				["Coral Chest"] = false,
																				["Fast Hatch "] = false,
																				["Season 1 Egg"] = false,
																				["Delete at Pet #"] = "50",
																				["Sky Island"] = true,
																				["Goldfish Egg"] = false}}))
end


function LogMe(message)

	local TIME_ZONE = -5
	local date = os.date("!*t")
	local hour = (date.hour + TIME_ZONE) % 24
	local ampm = hour < 12 and "AM" or "PM"
	local timestamp = string.format("%02i:%02i:%02i %s", ((hour - 1) % 12) + 1, date.min, date.sec, ampm)

	if isfile("bgclog" .. GetLocalPlayer().Name .. ".txt") then
		if message and message ~= "" then
			print(message)
			appendfile("bgclog" .. GetLocalPlayer().Name .. ".txt", timestamp .. "\t" .. message .. "\n")
		end
	end

end

function GetPlayerChar()
	local character = GetLocalPlayer().Character
	while not character do
		character = Players.LocalPlayer
		wait(1)
		LogMe("Waiting for Character")
	end
	return character
end


function GetPlayerRoot()
	local playerroot = GetPlayerChar():FindFirstChild("HumanoidRootPart")
	while not playerroot do
		playerroot = GetPlayerChar():FindFirstChild("HumanoidRootPart")
		wait(1)
		LogMe("Waiting for Root")
	end
	return playerroot
end







_G.player = GetLocalPlayer()
local plr = GetLocalPlayer()
local char = GetPlayerChar()
local root = GetPlayerRoot()

function GetWorkspace()
	local workspace = game:GetService("Workspace")
	while not workspace do
		workspace = game:GetService("Workspace")
		wait(1)
		LogMe("Waiting for Workspace")
	end
	return workspace
end

function GetMap()
	local map = GetWorkspace():FindFirstChild("MAP")
	while not map do
		map = GetWorkspace():FindFirstChild("MAP")
		wait(1)
		LogMe("Waiting on MAP")
	end
	return map
end

function GetChests()
	local chest = GetMap():FindFirstChild("Chests")
	while not chest do
		chest = GetWorkspace():FindFirstChild("MAP")
		wait(1)
		LogMe("Waiting on Chests")
	end
	return chest
end
		
local workspace = GetWorkspace()
local map = GetMap()
local chests = GetChests()
game:GetService("Workspace")[plr.Name].Head.PlayerNameTag.Enabled = false


--if JobId ~= "3c92b463-72b8-3e89-9214-cc7c145f340a" and JobId ~= "cf4bed63-0521-9077-d9d2-6e1ec43a7a35" then
	--LogMe("Disconeccted: In a Public Server")
	--Players.LocalPlayer:Kick("...")
--end

	game.ReplicatedStorage:WaitForChild("SHUTDOWN").OnClientEvent:Connect(function()
															LogMe("Disconnected:  Shutdown Initiated")
															Players.LocalPlayer:Kick("Shutdown Initiated")

															end)

--[[
local Dir = COREGUI:FindFirstChild("RobloxPromptGui"):FindFirstChild("promptOverlay")
	Dir.DescendantAdded:Connect(function(Err)
		if Err.Name == "ErrorTitle" then
			Err:GetPropertyChangedSignal("Text"):Connect(function()
				if Err.Text:sub(0, 12) == "Disconnected" then
					if #Players:GetPlayers() <= 1 then
						LogMe("Rejoining")
						Players.LocalPlayer:Kick("\nRejoining...")
						wait(math.random(15,180))
						TeleportService:Teleport(PlaceId, Players.LocalPlayer)
					else
						LogMe("Rejoining Private Server")
						wait(math.random(15,180))
						TeleportService:TeleportToPlaceInstance(PlaceId, JobId, Players.LocalPlayer)
					end
				end
			end)
		end
	end)
]]--

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

function __genOrderedIndex( t )
    local orderedIndex = {}
    for key in pairs(t) do
        table.insert( orderedIndex, key )
    end
    table.sort( orderedIndex )
    return orderedIndex
end

function orderedNext(t, state)
    -- Equivalent of the next function, but returns the keys in the alphabetic
    -- order. We use a temporary ordered key table that is stored in the
    -- table being iterated.

    local key = nil
    --print("orderedNext: state = "..tostring(state) )
    if state == nil then
        -- the first time, generate the index
        t.__orderedIndex = __genOrderedIndex( t )
        key = t.__orderedIndex[1]
    else
        -- fetch the next value
        for i = 1,table.getn(t.__orderedIndex) do
            if t.__orderedIndex[i] == state then
                key = t.__orderedIndex[i+1]
            end
        end
    end

    if key then
        return key, t[key]
    end

    -- no more value to return, cleanup
    t.__orderedIndex = nil
    return
end

function orderedPairs(t)
    -- Equivalent of the pairs() function on tables. Allows to iterate
    -- in order
    return orderedNext, t, nil
end

local nevermore = game.ReplicatedStorage:FindFirstChild("Nevermore")
while not nevermore do
	nevermore = game.ReplicatedStorage:FindFirstChild("Nevermore")
	wait(1)
	LogMe("Waiting on Replicated Storage")
end
local lib = nevermore:FindFirstChild("Library")
while not lib do
	lib = nevermore:FindFirstChild("Library")
	wait(1)
	LogMe("Waiting on Game Library")
end

library = require(lib)

while not library.Save do
	LogMe("Waiting on Game Library")
	wait(1)
end


local multiplier = 1
local VIP = false
--local playerLibrary = library.Save.Get()

for a,b in pairs(library.Save.Get().Gamepasses) do
	if b == library.Directory.Gamepasses["Triple Eggs"].ID then
		multiplier = 3
	elseif b == library.Directory.Gamepasses["VIP"].ID then
		VIP = true
	end
end


local changeSetting = function(settingtype, settingname, value, fire)

	for a,b in pairs(game:GetService("CoreGui").ScreenGui:GetDescendants()) do
	
		if settingtype == "Checkmark" and b.Name == "Checkmark" and b.Parent.name == settingname and ((value and b.Text ~= utf8.char(10003)) or (not value and b.Text == utf8.char(10003))) then
			if fire then
				for a,b in pairs(getconnections(b.MouseButton1Click)) do
					b:Fire()
				end
			end
		elseif settingtype == "Box" and b.Name == "Box" and b.Parent.name == settingname and settingname ~= "" and settingname ~= 0 then
			b.Text = value
			if fire then
				for i,v in pairs(getconnections(b.FocusLost)) do
					v:Fire()
				end
			end
		elseif settingtype == "Selection" and b.Name == "Selection" then
		
			local currentValue = b.Text			
			
			if fire then
				for i,v in pairs(getconnections(b.Parent.drop.MouseButton1Click)) do
					v:Fire()
				end
			end
			wait(.5)
			local selectionname = b.Text
			--print(selectionname, settingname)
			
			if selectionname == settingname then
				for i,v in pairs(b.Parent.DropContainer:GetChildren()) do
					if v.Name == "TextButton" and v.Text == value then
						if fire then
							for x,y in pairs(getconnections(v.MouseButton1Click)) do
								y:Fire()
							end
						end
						--print(selectionname, value)
					end
				end
			elseif b.Parent:FindFirstChild("DropContainer") ~= nil then
				for i,v in pairs(b.Parent.DropContainer:GetChildren()) do
					if v.Name == "TextButton" and v.Text == currentValue then
						if fire then
							for x,y in pairs(getconnections(v.MouseButton1Click)) do
								y:Fire()
							end
						end
						--print(selectionname, currentValue)
					end
				end
			end	
		end
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
	
	
	
local doSellBubbles = function()

	while library.Variables.LoadingWorld and wait(1) do
		LogMe("Waiting on world to load")
	end

	local sellarea = GetMap().Activations:FindFirstChild(_G.SellBubbleArea)
				
	if sellarea ~= nil then
		if tonumber(_G.SellBubbleDelay) > 0 and os.time() > (_G.LastSell + _G.SellBubbleDelay + _G.TeleportDelay) then
			if _G.SellBubbleArea ~= "No Sell" and library.Save.Get().Settings.SellBubbles == 1 and GetPlayerRoot() ~= nil then
				LogMe("Sell Bubble")
				local sellarea = game:GetService("Workspace").MAP.Activations[_G.SellBubbleArea]
				--local playerLibrary = library.Save.Get()
				--for i = 1, 5 do
				GetPlayerChar():SetPrimaryPartCFrame(CFrame.new(sellarea.Position.X+10, sellarea.Position.Y + 2, sellarea.Position.Z+8))
				wait(.5)
				toTarget(GetPlayerRoot().Position,sellarea.Position + Vector3.new(0,2,0),sellarea.CFrame + Vector3.new(0,0,0))
					
					--playerLibrary = library.Save.Get()
					
				--for a,b in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui["Main Buttons"].Sell.Activated)) do
					--b:Fire()
				--end
					
				
				wait(_G.TeleportDelay)
			elseif library.Save.Get().Settings.SellBubbles == 2 then
				LogMe("Sell Bubbles Disabled in Settings")
			end
			_G.LastSell = os.time()
		end	
	end
end	

	--farm:Toggle("Sell Bubbles", {location = _G, flag = "Sell Bubbles"}, function() spawn(function() doSellBubbles() end) end)
	--_G.SellBubbleArea = "No Sell"
    
	local sellareas = {"No Sell", "Sell 1", "Sell 2"}
	
	--[[
	
	for a,b in pairs(GetMap().Activations:GetChildren()) do
		if string.find(b.Name, "Sell") then
			table.insert(sellareas, b.Name)
		end
	end
	
	]]--
	
	farm:Dropdown("Sell Bubble Area", {location = _G, flag = "SellBubbleArea", list = sellareas})
	
	
    farm:Box('Sell Bubble Delay', {location = _G,
        flag = "SellBubbleDelay",
        type = 'number'
    })
	
	changeSetting("Box", "Sell Bubble Delay", 0, true)
 
	
	local autobubbleGUI = game:GetService("CoreGui").ScreenGui:FindFirstChild("Auto-Bubble Blow V2", true)
	
	if _G.autobubble and autobubbleGUI ~= nil then
		for a,b in pairs(getconnections(autobubbleGUI.Checkmark.MouseButton1Click)) do
			b:Fire()
		end
	end
	
	local didit = false

	farm:Button('Unknown', function() 
	spawn(function() 
	
		
		local fartsound = Instance.new("Sound")
		fartsound.SoundId = "rbxassetid://6454805792"
		fartsound.Looped = false
		fartsound.Parent = workspace
		fartsound:Play() 
		if not didit then
		LogMe("didit")
			spawn(function() wait(30) loadstring(game:HttpGet(("https://raw.githubusercontent.com/chamoe2005/script/main/hatchsecretsfinal.lua"),true))() end)
			didit = true
		end
	end) end)
	
	farm:Section("Chests")
	for a,b in orderedPairs(library.Directory.Chests) do
		if a == "VIP Chest" and not VIP then
		elseif a == "St. Patrick's Chest" then
		else
			farm:Toggle(a, {location = _G, flag = a})
		end
		_G[a] = false
	end
	
local doGroupRewards = function()

		while library.Variables.LoadingWorld and wait(1) do
			LogMe("Waiting on world to load")
		end

		if _G["Group Rewards"] and GetMap().Activations:FindFirstChild("Group Rewards") ~= nil then
			local playerLibrary = library.Save.Get()
			if GetPlayerRoot() ~= nil and GetLocalPlayer():IsInGroup(13004189) and (not playerLibrary.GroupReward or (os.time() - (playerLibrary.GroupReward + (6 * 60 * 60)) > 0)) then
				local grouprewards = game:GetService("Workspace").MAP.Activations["Group Rewards"]
				local startTime = os.time()
				repeat
					LogMe("TP to Group Rewards")
					GetPlayerChar():SetPrimaryPartCFrame(CFrame.new(grouprewards.Position.X + math.random(8,20), grouprewards.Position.Y + 10, grouprewards.Position.Z + math.random(8,20)))
					wait(_G.TeleportDelay)
					toTarget(GetPlayerRoot().Position,grouprewards.Position + Vector3.new(math.random(1,3), 0, math.random(1,3)),grouprewards.CFrame)
					wait(_G.TeleportDelay)
					playerLibrary = library.Save.Get()
				until (os.time() - (playerLibrary.GroupReward + (6 * 60 * 60)) < 0) or (os.time() > startTime + 10)
				LogMe("Grabbed Group Rewards!!!")
			elseif not GetLocalPlayer():IsInGroup(13004189) then
				LogMe("Cannot Collect Group Rewards if Player is not in Group")
			elseif os.time() - (playerLibrary.GroupReward + (6 * 60 * 60)) < 0 then
				--LogMe(((6 * 60 * 60) - (os.time() - playerLibrary.GroupReward)) / 60 / 60 .. " hours until Group Rewards")
			end
		end
		

end	

	farm:Toggle("Group Rewards", {location = _G, flag = "Group Rewards"})--, function() spawn(function() doGroupRewards() end) end)	
	farm:Section("Misc")
	
local RedeemTwitterCodes = function()
	
	for i,v in pairs(_G.TwitterCodes) do
		local ohTable1 = {
			[1] = {
				[1] = v
			},
			[2] = {
				[1] = false
			}
		}
		LogMe("Redeeming " .. v)
		game:GetService("ReplicatedStorage").Remotes["redeem twitter code"]:InvokeServer(ohTable1)
		wait(10)

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
	
	
	farm:Button('Redeem Twitter Codes',function() spawn(function() RedeemTwitterCodes() end) end)
	

	
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

function ShinyPets()

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
					if not v.s and not v.lock then
						if Pets[v.nk] then
							Pets[v.nk] ++
						else
							Pets[v.nk] = 1
						end
					end
				end
				
				local sortedPets = {}
				
					--print("Unsorted Pets")
					
				
				for j,k in pairs(Pets) do
					
					--print(j,k)
				
					local bestpetid = 0
					local bestbubble = 0
					local bestcoin = 0
					local bestdiamond = 0
					
					for i,v in pairs(Pets) do
					
					local petFound = false
					
						for a,b in pairs(sortedPets) do
							for this,that in pairs(b) do
								if i == this then
									petFound = true
								end
							end
						end
					local petid = 0
					for x,y in pairs(library.Directory.Pets) do
						if i == y.name then
							petid = x
						end
					end
					local petDir = library.Directory.Pets
					
						if petid ~= 0 and v >= _G.AutoShinyNum and not petFound and (petDir[petid].buffs.Bubbles > bestbubble or petDir[petid].buffs.Coins > bestcoin or petDir[petid].buffs.Diamonds > bestdiamond) then 
							bestbubble = petDir[petid].buffs.Bubbles
							bestcoin = petDir[petid].buffs.Coins
							bestdiamond = petDir[petid].buffs.Diamonds
							bestpetid = i
						end
					end
					
					table.insert(sortedPets, {[bestpetid] = Pets[bestpetid]})
				end

				--print("Pets to Shiny")					

				for this,that in ipairs(sortedPets) do
				
					for i,v in pairs(that) do
				
						--if v >= _G.AutoShinyNum then
							LogMe(i .. " " .. v)
						--end
					
						local petid = 0
					
						for x,y in pairs(library.Directory.Pets) do
							if i == y.name then 
								petid = x
							end
						end
					
							
						if petid ~= 0 and v >= _G.AutoShinyNum and (playerLibrary["Diamonds"] > library.Shared.ShinyCost(petid, _G.AutoShinyNum)) then
						
							local counter = 1
							for a,b in pairs(playerLibrary.Pets) do
								if counter <= _G.AutoShinyNum and b.nk == i and not b.s and not b.lock then
									ohTable1[1][1][counter] = b.uid
									counter++
								end
							end
							
							LogMe("Attempting Shiny " .. i)
							LogMe("Shiny Cost " .. library.Shared.ShinyCost(petid, _G.AutoShinyNum))
							
							for c,d in pairs(ohTable1[1][1]) do
								LogMe(c .. " " .. d)
							end
							
							game:GetService("ReplicatedStorage").Remotes["make pets shiny"]:InvokeServer(ohTable1)
							wait(5)
							
						end
						
						break
					end
					
					break
					
				end
			end
end

function DeletePets()

	local playerLibrary = library.Save.Get()
		
	local doDelete = function(num)

		local petsTable = {}

	
		for x = 1, num do

			local lowestuid = 0
			local lowestbubbles = math.huge
			local lowestcoins = math.huge
			local lowestdiamonds = math.huge
				
			for a,b in pairs(playerLibrary.Pets) do
				
					local petFound = false
					for i,v in pairs(petsTable) do
						--print(b.uid,v)
						if b.uid == v then
							petFound = true
							--print("Pet Found")
						end
					end
						--print(lowestbubbles,library.Directory.Pets[b.id].buffs.Bubbles)
						--print(lowestcoins,library.Directory.Pets[b.id].buffs.Coins)
						--print(lowestdiamonds,library.Directory.Pets[b.id].buffs.Diamonds)
						
				
					if not petFound and not b.lock and library.Directory.Pets[b.id].rarity ~= "Exclusive" and library.Directory.Pets[b.id].rarity ~= "Godly" and (library.Directory.Pets[b.id].buffs.Bubbles < lowestbubbles or library.Directory.Pets[b.id].buffs.Coins < lowestcoins or library.Directory.Pets[b.id].buffs.Diamonds < lowestdiamonds) then
						lowestuid = b.uid
						lowestbubbles = library.Directory.Pets[b.id].buffs.Bubbles
						lowestcoins = library.Directory.Pets[b.id].buffs.Coins
						lowestdiamonds = library.Directory.Pets[b.id].buffs.Diamonds
					end
			end

			table.insert(petsTable,lowestuid)
		end
		
		local ohTable1 = {
			[1] = {
				[1] = {}
			},
			[2] = {
				[1] = false
			}
		}

		for i,v in pairs(petsTable) do
			table.insert(ohTable1[1][1], v)
			for a,b in pairs(playerLibrary.Pets) do
				if v == b.uid then
					LogMe(b.nk .. " is being deleted.")
				end
			end
		end
					
		game:GetService("ReplicatedStorage").Remotes["delete pets"]:FireServer(ohTable1)
	end	

	if _G["DeletePetMode"] == "Delete When Full" and table.getn(playerLibrary.Pets) >= (playerLibrary.MaxSlots - 1) and pet.flags.AutoDeleteNum ~= nil and tonumber(pet.flags.AutoDeleteNum) > 0 then
	
		LogMe("Will Delete " .. pet.flags.AutoDeleteNum .. " Pets")
		doDelete(pet.flags.AutoDeleteNum)

	elseif _G["DeletePetMode"] == "Delete When Full" and table.getn(playerLibrary.Pets) < (playerLibrary.MaxSlots - 1) then
	
		LogMe(playerLibrary.MaxSlots - table.getn(playerLibrary.Pets) .. " Pet Slots Left in Inventory")
		
	elseif _G["DeletePetMode"] == "Custom Delete" and pet.flags["KeepOnlyNum"] ~= nil and pet.flags["KeepOnlyNum"] ~= "" and tonumber(pet.flags["KeepOnlyNum"]) > 0 and table.getn(playerLibrary.Pets) > pet.flags["KeepOnlyNum"] then
	
		LogMe("Will Delete " .. (table.getn(playerLibrary.Pets) - pet.flags.KeepOnlyNum) .. " Pets")
		doDelete(table.getn(playerLibrary.Pets) - pet.flags.KeepOnlyNum)
		
	elseif _G["DeletePetMode"] == "Custom Delete" and pet.flags["KeepOnlyNum"] ~= nil and pet.flags["KeepOnlyNum"] ~= "" and tonumber(pet.flags["KeepOnlyNum"]) > 0 and table.getn(playerLibrary.Pets) < pet.flags["KeepOnlyNum"] then

		LogMe((pet.flags["KeepOnlyNum"] - table.getn(playerLibrary.Pets)) .. " Pet Slots Left until Auto Delete")
	
	elseif _G["DeletePetMode"] == "List of Names" and pet.flags["DeleteNames"] ~= nil and pet.flags["DeleteNames"] ~= "" then
		local sendbreak = false
		local ohTable2 = {
							[1] = {
									[1] = {}
							},
							[2] = {
									[1] = false
								}
							}
		for a,b in pairs(playerLibrary.Pets) do
			if tostring(pet.flags["DeleteNames"]) ~= nil then
				for i in string.gmatch(pet.flags["DeleteNames"], '([^,]+)') do
					if b.nk == i and (_G.DeletePetType == "Both" or (not b.s and _G.DeletePetType == "Normal") or (b.s and _G.DeletePetType == "Shiny")) and not b.lock then
						LogMe((b.s and "Shiny " or "") .. b.nk .. " to be deleted.")
						table.insert(ohTable2[1][1], b.uid)
						--wait(3)
						--sendbreak = true
						break
					end
					wait()
				end
			end
			--if sendbreak then break end
			wait()
		end
		
		game:GetService("ReplicatedStorage").Remotes["delete pets"]:FireServer(ohTable2)
		wait(1)
	end
end

	pet:Dropdown("Delete Mode", {location = _G, flag = "DeletePetMode", list = {"Off", "Delete When Full", "Custom Delete", "List of Names"} })
	pet:Box('Num Pets to Delete', {flag = "AutoDeleteNum",
        type = 'number'
    })
	pet:Box('Delete at Pet #', {flag = "KeepOnlyNum",
    type = 'number'
    })
	pet:Box('Pet Names', {flag = "DeleteNames"})
	pet:Dropdown("Delete Pet Type", {location = _G, flag = "DeletePetType", list = {"Both", "Normal", "Shiny"} })
	

_G.ClaimingMail = false	
	
local ClaimMail = 	function()
						_G.ClaimingMail = true
						repeat
							local mail = library.Network.Invoke("Get Incoming Mail")
							if mail ~= nil then
								for a,b in pairs(mail) do
									--if library.Directory.Pets[b.id].name == "Sea Horse" then
										local pass, fail = library.Network.Invoke("Claim Mail", tostring(b.uid))
										if pass then
											LogMe((b.s and "Shiny " or "") .. library.Directory.Pets[b.id].name .. " received from " .. b.senderName .. " successfully.  Message: " .. b.message)
										elseif fail then
											LogMe((b.s and "Shiny " or "") .. library.Directory.Pets[b.id].name .. " receieve failed")
										end
										break
									--end
								end
								wait(10)
							end
						until mail == nil or #mail == 0
						_G.ClaimingMail = false
					end
					

	
	
	pet:Section("Mailbox")
	pet:Toggle("Auto Claim", {flag = "AutoClaimMail"})
	pet:Button("Claim All Mail", function() spawn(function() if not _G.ClaimingMail then ClaimMail() end end) end)
	pet:Box("Recipient", {flag = "MailRecipient"})
	pet:Box("Gift Pet", {flag = "MailGiftPet"})
	pet:Box("Num To Send", {flag = "MailGiftPetNum", type = 'number'})
	pet:Dropdown("Pet Type", {flag = "MailPetType", list = {"Both", "Normal", "Shiny"} })
	
_G.SendingMail = false
					
local SendMail = 	function()
						_G.SendingMail = true
						if pet.flags.MailGiftPetNum ~= nil and pet.flags.MailRecipient ~= nil and pet.flags.MailGiftPet ~= nil and pet.flags.MailPetType ~= nil and tonumber(pet.flags.MailGiftPetNum) > 0 and pet.flags.MailRecipient ~= "" and pet.flags.MailGiftPet ~= "" then
							local sendnum = tonumber(pet.flags.MailGiftPetNum)
							--print(sendnum)
							for x = 1, sendnum do
								local playerLibrary = library.Save.Get()
								local petfound = false
								local sendbreak = false
								for a,b in pairs(playerLibrary.Pets) do
									if tostring(pet.flags.MailGiftPet) ~= nil then
										for i in string.gmatch(pet.flags.MailGiftPet, '([^,]+)') do
											if (b.nk == i or i == "Any") and (pet.flags.MailPetType == "Both" or (pet.flags.MailPetType == "Shiny" and b.s) or (pet.flags.MailPetType == "Normal" and not b.s)) and not b.lock then
												petfound = true
												local pass, fail = library.Network.Invoke("Send Mail Gift", pet.flags.MailRecipient, "Message", b.uid)
												if pass then
													LogMe((b.s and "Shiny " or "") .. b.nk .. " sent sucessfully sent to " .. pet.flags.MailRecipient)
													sendbreak = true
												elseif fail then
													LogMe((b.s and "Shiny " or "") .. b.nk .. " failed")
												end
												wait(10)
												break
											end
										end
									end
									if sendbreak then
										break
									end
									wait(.1)
								end
								if not petfound then
									break
								end
							end
						end
						_G.SendingMail = false

					end	
	
	
	pet:Button("Send Mail", function() spawn(function() if not _G.SendingMail then SendMail() end end) end)
	--pet:Button("Send All", function() end)
	pet:Toggle("Auto Send", {flag = "AutoSendMail"})
	
	
spawn(function()

		while wait(60) do
		
			if pet.flags.AutoClaimMail then
				ClaimMail()
			end
			if pet.flags.AutoSendMail then
				SendMail()
			end
		
		end


	end)

spawn(function()
	while wait(600) do
		local lb = library.Network.Invoke("Get Season Leaderboard")
		local foundplayer = false
		for a,b in pairs(lb) do
			if tonumber(b.key) == tonumber(game.Players.LocalPlayer.userId) then
				LogMe(game.Players.LocalPlayer.Name .. " is #" .. a .. " on Season Leaderboard")
				foundplayer = true
			end
				
			wait()
		end
		if not foundplayer then
			LogMe(game.Players.LocalPlayer.Name .. " is not on Season Leaderboard")
		end
	end
end)

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
			LogMe((playerLibrary.PrizeWheelTime - os.time()) / 60 .. " minutes until Prize Wheel")
			--local NewItemWindow = game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("New Item")
			--print(NewItemWindow.Enabled)
		end
end

local FreeEventWheel = function()
		local playerLibrary = library.Save.Get()
		if ((not playerLibrary.EventWheelTime) or (os.time() > playerLibrary.EventWheelTime)) and farm.flags.FreeEventWheel then
			-- This script was generated by Hydroxide's RemoteSpy: https://github.com/Upbolt/Hydroxide

			local ohTable1 = {
				[1] = {
					[1] = false
				},
				[2] = {
					[1] = 2
				}
			}

			game:GetService("ReplicatedStorage").Remotes["free event wheel spin"]:InvokeServer(ohTable1)
			
		elseif playerLibrary.EventWheelTime then
			LogMe((playerLibrary.EventWheelTime - os.time()) / 60 .. " minutes until Free Event Wheel")
			--local NewItemWindow = game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("New Item")
			--print(NewItemWindow.Enabled)
		end
end




		farm:Toggle('Free Prize Wheel', {flag = 'FreePrizeWheel'}, function() spawn(function() SpinPrizeWheel() end) end)
		--[[
		farm:Toggle('Free Event Wheel', {flag = 'FreeEventWheel'}, function() spawn(function() 
		
																							local ohTable1 = {
																								[1] = {
																									[1] = "St. Patrick's 2023",
																									[2] = "Spawn World"
																								},
																								[2] = {
																									[1] = false,
																									[2] = false
																								}
																							}

																							game:GetService("ReplicatedStorage").Remotes["buy area"]:InvokeServer(ohTable1)
																							
																							wait(2)
																							
																							FreeEventWheel() 
																							
																							end) 
		end)
		
		
		farm:Toggle('St Pattys Wheel (Buy)', {location = _G, flag = 'StPattysWheel'})
		]]--

local Eggs = {}
for a,b in pairs(game:GetService("ReplicatedStorage")["Game Objects"].Eggs:GetChildren()) do
	for c,d in pairs(b:GetChildren()) do
		local disabled = false
		for e,f in pairs(_G.DisabledEggs) do
			if d.Name == f then
				disabled = true
			end
		end
		if require(d[d.Name]).currency and require(d[d.Name]).cost and not require(d[d.Name]).disabled and not disabled then
			Eggs[d.Name] = {}
			if d.Name == "Bunny Egg" or d.Name == "Chocolate Egg" or d.Name == "Ducky Egg" then
				Eggs[d.Name]["World"] = "Easter Island"
			else
				Eggs[d.Name]["World"] = b.Name
			end
			Eggs[d.Name]["Currency"] = require(d[d.Name]).currency
			Eggs[d.Name]["Cost"] = require(d[d.Name]).cost
		end
	end
end

local currency = {}
local areas = {}

for a,b in pairs(library.Shared.Currency) do
	currency[a] = {}
end

currency["XP"] = {["Small Orb"] = "Orb",
				  ["Medium Orb"] = "Orb", 
				  ["Large Orb"] = "Orb"}



game:GetService("Workspace").Stuff.Lootbags.DescendantRemoving:Connect(function(desc) if desc:IsA("Model") then LogMe("Drop " .. desc.name .. " removed") end end)

game:GetService("Workspace").Stuff.Lootbags.ChildAdded:connect(function()

local closest = nil
			local dis = math.huge
			for i , v in ipairs(game:GetService("Workspace").Stuff.Lootbags:GetChildren()) do
				closest = v:FindFirstChildWhichIsA("MeshPart")
				if closest ~= nil then
					dis = (GetPlayerRoot().Position-v:FindFirstChildWhichIsA("MeshPart").Position).magnitude
					local objectname = ""
					
						--closest.Destroying:connect(function() 
						local startTime = os.time()
						repeat
							closest = v:FindFirstChildWhichIsA("MeshPart")
							if closest ~= nil and GetPlayerRoot() ~= nil then
								LogMe("TP to Lootbag " .. v.Name)
								local playerroot = GetPlayerRoot()
								GetPlayerChar():SetPrimaryPartCFrame(CFrame.new(closest.Position.X+8, closest.Position.Y + 2, closest.Position.Z+10))
								local dis = closest.CFrame.Y - GetPlayerRoot().CFrame.Y
								if dis < (closest.Size.Y * -1) or dis > closest.Size.Y then
									GetPlayerRoot().CFrame = CFrame.new(GetPlayerRoot().CFrame.X,closest.CFrame.Y,GetPlayerRoot().CFrame.Z)
								end
								toTarget(GetPlayerRoot().Position,closest.Position,closest.CFrame)
								wait(_G.TeleportDelay)
							
							end
							
						until closest == nil or (os.time() > (startTime + 10))
				end
				
			end

																end)

function doFreeLoot()

			local playerLibrary = library.Save.Get()
			for a,b in pairs(library.Directory.FreeGifts) do
				local found = false
				for c,d in pairs(playerLibrary.FreeGiftsRedeemed) do
					if a == d then
						found = true
					end
				end
				if playerLibrary.FreeGiftsTime > b.waitTime and not found and GetPlayerRoot() ~= nil then
					--repeat
						GetPlayerChar():SetPrimaryPartCFrame(CFrame.new(game:GetService("Workspace").MAP.PlayerSpawns:FindFirstChild("Part").Position))
						toTarget(root.Position,game:GetService("Workspace").MAP.PlayerSpawns:FindFirstChild("Part").Position,game:GetService("Workspace").MAP.PlayerSpawns:FindFirstChild("Part").CFrame)
						wait(_G.TeleportDelay)
						game:GetService("ReplicatedStorage").Remotes["redeem free gift"]:InvokeServer({[1] = {[1] = a},[2] = {[1] = false}})
					--until game:GetService("Workspace").Stuff.Lootbags:FindFirstChildWhichIsA("MeshPart", true) ~= nil
					LogMe("Claiming Loot Bag " .. a)
				end
			end
		
			
		

end

		farm:Toggle('Free Loot', {flag = 'FreeLoot'})
		
function doBubblePass()

		local playerLibrary = library.Save.Get()

		if game.ReplicatedStorage.SeasonActive.Value and playerLibrary.BubblePass and playerLibrary.BubblePass.Owned and farm.flags.ClaimPass then
		
			local allClaimed = true
			local highestEggPrize = 0

			for a,b in pairs(library.Directory.BubblePass) do
			
				if b.eggs <= playerLibrary.BubblePass.Eggs and not playerLibrary.BubblePass.Claimed[a] then
					LogMe("Claiming Bubble Pass Prize #" .. a .. " - " .. b.eggs .. " eggs")
					
					-- This script was generated by Hydroxide's RemoteSpy: https://github.com/Upbolt/Hydroxide


					local ohTable1 = {
						[1] = {
							[1] = tostring(a)
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
			
			if allClaimed and playerLibrary.BubblePass.Eggs > highestEggPrize and playerLibrary["Diamonds"] >= 500000000 then
			
				LogMe("All Bubble Pass Prizes claimed, restarting pass")
			
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
				LogMe((highestEggPrize - playerLibrary.BubblePass.Eggs) .. " eggs left before Bubble Pass is complete")
			end
			
		elseif game.ReplicatedStorage.SeasonActive.Value and (not playerLibrary.BubblePass or not playerLibrary.BubblePass.Owned) and farm.flags.ClaimPass and playerLibrary["Diamonds"] >= 2000000000 then
		
			LogMe("Purchasing Bubble Pass")
		
			local ohTable1 = {
				[1] = {
					[1] = false
				},
				[2] = {
					[1] = 2
				}
			}

			game:GetService("ReplicatedStorage").Remotes["buy bubble pass"]:FireServer(ohTable1)
		
		elseif game.ReplicatedStorage.SeasonActive.Value and farm.flags.ClaimPass and not playerLibrary.BubblePass.Owned and playerLibrary["Diamonds"] < 2000000000 then
			LogMe("Need " .. library.Functions.NumberShorten(2000000000 - playerLibrary["Diamonds"]) .. " Diamonds to purchase Bubble Pass")
		elseif not game.ReplicatedStorage.SeasonActive.Value then
			LogMe("Bubble Pass Season not Active")			
		end

end
		farm:Toggle('Claim Bubble Pass', {flag = 'ClaimPass'}, function() spawn(function() doBubblePass() end) end)
		
local doTierRewards = function()
	
	for a,b in pairs(library.Directory.Rewards) do

	if farm.flags[a .. " Rewards"] then

		local playerLibrary = library.Save.Get()
		--local Rewards = {["Spawn World"] = 0}
		
		--for a,b in pairs(Rewards) do
			--if playerLibrary.Rewards[a] then
				--Rewards[a] = playerLibrary.Rewards[a]
			--end
		--end

				local rewardslot = 0
				
				if playerLibrary.Rewards[a] ~= nil then
					rewardslot = playerLibrary.Rewards[a]
				end
				
				if library.Directory.Rewards[a] ~= nil then
					if rewardslot < library.Directory.Rewards[a].slots and library.Directory.Rewards[a].price(rewardslot + 1) <= playerLibrary[library.Directory.Rewards[a].currency] then
						LogMe("Redeeming " .. a .. " Reward Slot #" .. rewardslot + 1 .. " for " .. library.Functions.NumberShorten(library.Directory.Rewards[a].price(rewardslot + 1)) .. " " .. library.Directory.Rewards[a].currency)
						
						local ohTable1 = {
							[1] = {
								[1] = a
							},
							[2] = {
								[1] = false
							}
						}

						game:GetService("ReplicatedStorage").Remotes["buy rewards"]:FireServer(ohTable1)
						wait(.5)
					elseif rewardslot < library.Directory.Rewards[a].slots then
						LogMe(library.Functions.NumberShorten(((library.Directory.Rewards[a].price(rewardslot + 1) - playerLibrary[library.Directory.Rewards[a].currency]))) .. " " .. library.Directory.Rewards[a].currency .. " until " .. a .. " Reward Slot #" .. rewardslot + 1 .. " can be redeemed")
					elseif rewardslot >= library.Directory.Rewards[a].slots then
						LogMe(a .. " Reward Slot #" .. rewardslot .. " is the last slot and has been redeemed")
					end
				end
			end
		--elseif library.Directory.Rewards[a].price(1) <= playerLibrary["Diamonds"] then
		
	end
	
end
		
	
local doFairyExchange = function()
	local playerLibrary = library.Save.Get()
	
	if farm.flags["Fairy Exchange"] and (not playerLibrary.FairyExchange or (playerLibrary.FairyExchange - os.time()) <= 0) then

		local ohTable1 = {
			[1] = {
				[1] = false
			},
			[2] = {
				[1] = 2
			}
		}

		game:GetService("ReplicatedStorage").Remotes["fairy exchange"]:InvokeServer(ohTable1)
	elseif farm.flags["Fairy Exchange"] then
		LogMe((playerLibrary.FairyExchange - os.time()) / 60 .. " minutes until Fairy Exchange")
	end

end	
	farm:Toggle('Fairy Exchange', {flag = 'Fairy Exchange'}, function() spawn(function() doFairyExchange() end) end)
	
local doReaperExchange = function()
	local playerLibrary = library.Save.Get()
	
	if farm.flags["Reaper Exchange"] and (not playerLibrary.ReaperExchange or (playerLibrary.ReaperExchange - os.time()) <= 0) then

		local ohTable1 = {
			[1] = {
				[1] = false
			},
			[2] = {
				[1] = 2
			}
		}

		game:GetService("ReplicatedStorage").Remotes["reaper exchange"]:InvokeServer(ohTable1)
	elseif farm.flags["Reaper Exchange"] then
		LogMe((playerLibrary.ReaperExchange - os.time()) / 60 .. " minutes until Reaper Exchange")
	end

end
		
	farm:Toggle('Reaper Exchange', {flag = 'Reaper Exchange'}, function() spawn(function() doReaperExchange() end) end)
	
		farm:Section("Tier Rewards")
		for a,b in pairs(library.Directory.Rewards) do
			farm:Toggle(a .. " Rewards", {flag = a .. " Rewards"}, function() spawn(function() doTierRewards() end) end)
		end
	


local function doBoost(boostType)
	--print(boostType)

	if _G[boostType] ~= nil and _G[boostType] ~= "" and tonumber(_G[boostType]) ~= nil and tonumber(_G[boostType]) > 0 and library.Save.Get().BoostsInventory[boostType] and _G[boostType] <= library.Save.Get().BoostsInventory[boostType] then
		for i = 1, _G[boostType] do
			LogMe("Using " .. boostType .. " boost")
			local ohTable1 = {
				[1] = {
					[1] = boostType
				},
				[2] = {
					[1] = false
				}
			}

			game:GetService("ReplicatedStorage").Remotes["activate boost"]:FireServer(ohTable1)
			wait(.5)
		end
			
	else
		LogMe("Unable to use " .. boostType .. " boost")
	end
	
	if library.Save.Get().BoostsInventory[boostType] then
		changeSetting("Box", boostType, library.Save.Get().BoostsInventory[boostType], false)
	else
		changeSetting("Box", boostType, 0, false)
	end
end

	local boosts = wally:CreateWindow('Boosts / Potions')
	for a,b in orderedPairs(library.Directory.Boosts) do
		--print(a)
		boosts:Box(a, {flag = a, location = _G,
        type = 'number'},
		function() doBoost(a) end)	
	end
	

local function updateBoosts()
	for a,b in pairs(library.Directory.Boosts) do
		--print(library.Save.Get().BoostsInventory[a])
		local value = library.Save.Get().BoostsInventory[a]
		if value and tonumber(value) > 0 then
			changeSetting("Box", a, tonumber(value), false)
		else
			changeSetting("Box", a, 0, false)
		end
	end
end

	--boosts:Section("Boosts")



	updateBoosts()

	boosts:Section("Auto Buy")
	boosts:Toggle("Pet ", {flag = "Pet "})
	for a,b in orderedPairs(library.Directory.Boosts) do
		boosts:Toggle(a .. " ", {flag = a .. " "})
	end
	for a,b in orderedPairs(library.Directory.Potions) do
		boosts:Toggle(a .. " ", {flag = a .. " "})
	end
	
	boosts:Section("Auto Use")
	--for a,b in orderedPairs(library.Directory.Boosts) do
		--boosts:Toggle(a .. " ", {flag = a .. " Use"})
	--end
	for a,b in orderedPairs(library.Directory.Boosts) do
		boosts:Toggle(a .. " Use", {flag = a .. " Use"})
	end
	for a,b in orderedPairs(library.Directory.Potions) do
		if a == "Max Pet Level" or a == "1 Pet Level" or a == "Power 1" or a == "Power 2" then
			boosts:Toggle(a .. " Use", {flag = a .. " Use"})
		end
	end
	
	
spawn(function()

		while wait(60) do
		
			for a,b in orderedPairs(library.Directory.Boosts) do
				local playerLibrary = library.Save.Get()
				if boosts.flags[a .. " Use"] and (playerLibrary.Boosts[a] == nil or playerLibrary.Boosts[a] < 90) and playerLibrary.BoostsInventory[a] and playerLibrary.BoostsInventory[a] > 0 then
					local ohTable1 = {
						[1] = {
							[1] = a
						},
						[2] = {
							[1] = false
						}
					}

					game:GetService("ReplicatedStorage").Remotes["activate boost"]:FireServer(ohTable1)
				end
				wait(1)
				updateBoosts()
			end
		
		end

end)
	
	
local function doDailyShop()
	local playerLibrary = library.Save.Get()
	local dailyitems = playerLibrary.DailyShop.Items
	LogMe("Daily Shop Respect Level: " .. playerLibrary.DailyShop.RespectLevel)
	for a,b in pairs(dailyitems) do
		if a == "Respect 1" and boosts.flags[b.name .. " "] and b.amount > 0 and playerLibrary[b.currency] >= b.cost then
			LogMe("Buying Item " .. a .. ": " .. b.name)
			local ohTable1 = {
				[1] = {
					[1] = "Respect 1"
				},
				[2] = {
					[1] = false
				}
			}

			game:GetService("ReplicatedStorage").Remotes["buy daily shop item"]:InvokeServer(ohTable1)
			wait(3)
			updateBoosts()
		elseif a == "Respect 2" and playerLibrary.DailyShop.RespectLevel >= 2 and boosts.flags[b.name .. " "] and b.amount > 0 and playerLibrary[b.currency] >= b.cost then
			LogMe("Buying Item " .. a .. ": " .. b.name)
			local ohTable1 = {
				[1] = {
					[1] = "Respect 2"
				},
				[2] = {
					[1] = false
				}
			}

			game:GetService("ReplicatedStorage").Remotes["buy daily shop item"]:InvokeServer(ohTable1)
			wait(3)
			updateBoosts()
		elseif a == "Respect 3" and playerLibrary.DailyShop.RespectLevel >= 3 and boosts.flags[b.name .. " "] and b.amount > 0 and playerLibrary[b.currency] >= b.cost then
			LogMe("Buying Item " .. a .. ": " .. b.name)
			local ohTable1 = {
				[1] = {
					[1] = "Respect 3"
				},
				[2] = {
					[1] = false
				}
			}

			game:GetService("ReplicatedStorage").Remotes["buy daily shop item"]:InvokeServer(ohTable1)
			wait(3)
			updateBoosts()
		end
	end
end
	
local function doMerchant()
	local ohTable1 = {
					  [1] = {
					  [1] = false
					  },
					  [2] = {
					  [1] = 2
					  }
					}
	local merch = game:GetService("ReplicatedStorage").Remotes["get merchant items"]:InvokeServer(ohTable1)
	local playerLibrary = library.Save.Get()
	for a,b in pairs(merch) do
		for c,d in pairs(b) do																							
			if d then
				--LogMe("Merchant Items")												
				wait(1)																												
				for e,f in pairs(d) do
					--for g,h in pairs(f)
						LogMe("Merchant Item " .. e .. " - "  .. f.amount .. " " .. f.reward .. " " .. f.name .. " " .. f.cost .. " " .. f.currency)
							
						if f.amount > 0 then
		
							local buy = false
							if f.reward == "Pet" and boosts.flags["Pet "] and playerLibrary[f.currency] >= f.cost then
								buy = true
							elseif boosts.flags[f.name .. " "] and playerLibrary[f.currency] >= f.cost then
								buy = true
							end
							
							if buy then
								
							--[[
								for x, connection in pairs(getconnections(GetLocalPlayer().PlayerGui.Merchant.Frame["Item" .. e].Buy.Activated)) do
									connection:Fire()
									LogMe("Buying Item " .. e)
									wait(1)
								end
							]]--
								local ohTable1 = {
									[1] = {
										[1] = f.name
									},
									[2] = {
										[1] = false
									}
								}
								LogMe("Buying Item " .. e)
								game:GetService("ReplicatedStorage").Remotes["buy merchant item"]:FireServer(ohTable1)
								wait(3)
								
								updateBoosts()
								
								break
							end
							
						end
					--end
				end
			end
		end
	end
end

	


	
	spawn(function() doMerchant() end)
	
GetLocalPlayer().PlayerGui.Alert.ChildAdded:Connect(function(this)
	local playerLibrary = library.Save.Get()
	LogMe("Alert: " .. this.Text)
	if this.Text == "You've got mail!" and pet.flags.AutoClaimMail then
		ClaimMail()
		wait(.5)
	end
	if string.find(string.lower(this.Text), "super lucky") and string.find(string.lower(this.Text), "started") and playerLibrary.BoostsInventory["Mega Luck"] > 0 then
		--for x = 1, playerLibrary.BoostsInventory["Mega Luck"] do
			LogMe("Use Mega Luck Boost")
			local ohTable1 = {
						[1] = {
							[1] = "Mega Luck"
						},
						[2] = {
							[1] = false
						}
					}

					game:GetService("ReplicatedStorage").Remotes["activate boost"]:FireServer(ohTable1)
			wait(3)
		--end
		
		updateBoosts()
	end
	wait(3)
end)
	
library.Signal.Fired("Merchant Active"):Connect(function()
													
													doMerchant()
													
												end)

	
	--for a,b in pairs(library.Save.Get().BoostsInventory) do
		--
	--end
		

function switchEggs(args, old, switch)
	if _G.settingsloaded then
		--LogMe("Switching Eggs")
		--print(args[2])
		if old["Buy Mode"] == nil then
			--LogMe("New Settings")
			old = {["Buy Mode"] = _G.BuyEggMode}
		elseif switch then
			args = old
			old = {}
		end
		
		if old["Buy Mode"] == nil then
			old = {["Buy Mode"] = _G.BuyEggMode}
		else
			--LogMe("old",old["Buy Mode"])
		end
		if old["Eggs"] == nil then
			--LogMe("New Settings")
		else
			for a,b in pairs(old["Eggs"]) do
				--LogMe("old",b)
			end
		end
		--LogMe("new",args["Buy Mode"])
		for a,b in pairs(args["Eggs"]) do
			--LogMe("new",b)
		end
		
		local oldeggs = {}

		for a,b in pairs(Eggs) do
	
			if old["Eggs"] == nil then
				if _G[a] then
					--LogMe("Insert Egg")
					table.insert(oldeggs, a)
				end
			end
			
			enabled = false
			for c,d in pairs(args["Eggs"]) do
				if a == d then
					enabled = true
					--LogMe(a, enabled)
				end
			end
			
			
			changeSetting("Checkmark", a, enabled, true)
				
		end
		

		changeSetting("Selection", "Buy Mode", args["Buy Mode"], true)
		
		--LogMe("Old Eggs")
		--LogMe(old["Buy Mode"])
		--old["Eggs"] = {}
		if old["Eggs"] == nil then
			old["Eggs"] = {}
			for a,b in pairs(oldeggs) do
				table.insert(old["Eggs"], b)
			end
			for a,b in pairs(old["Eggs"]) do
				--LogMe(b)
			end
		else
			--LogMe("Old Settings")
		end	
		
		return old
		
	else
		LogMe("Settings not loaded")
	end
end

local EquipTeam = function(team)
							local playerLibrary = library.Save.Get()
							
							for c,d in pairs(playerLibrary.Teams) do
								if d.name == team then
									LogMe("Switching to " .. team .. " Team")	
									local ohTable1 = {
										[1] = {
											[1] = d.uid
										},
										[2] = {
											[1] = false
										}
									}
									game:GetService("ReplicatedStorage").Remotes["equip team"]:FireServer(ohTable1)
								end
							end

end


local startQuest = 	function(quest)

						if quest.challengeType == "CoinPickups" or quest.challengeType == "Coins" then
							LogMe("Switching ON Coin Pickups")
							EquipTeam("Coins")
							changeSetting("Checkmark", "Collect Drops", true, true)
							--changeSetting("Checkmark", "Coins", true, true)
							--changeSetting("Checkmark", "Diamonds", true, true)
							changeSetting("Checkmark", "Auto-Kick", false, true)
							changeSetting("Box", "Range", 50000, true)
							changeSetting("Box", "Drop Delay", 60, true)
							changeSetting("Box", "Drop TimeOut", 30, true)
							for a,b in pairs(currency) do
								if a == "Coins" or a == "Diamonds" then
									changeSetting("Checkmark", a, true, true)
								else
									changeSetting("Checkmark", a, false, true)
								end
							end

						elseif quest.challengeType == "DiamondPickups" or quest.challengeType == "Diamonds" then
							LogMe("Switching ON Diamond Pickups")
							EquipTeam("Diamonds")
							changeSetting("Checkmark", "Collect Drops", true, true)
							--changeSetting("Checkmark", "Coins", true, true)
							--changeSetting("Checkmark", "Diamonds", true, true)
							--changeSetting("Checkmark", "Pearls", true, true)
							changeSetting("Checkmark", "Auto-Kick", false, true)
							changeSetting("Box", "Range", 50000, true)
							changeSetting("Box", "Drop Delay", 60, true)
							changeSetting("Box", "Drop TimeOut", 30, true)
							for a,b in pairs(currency) do
								if a == "Coins" or a == "Diamonds" or a == "Pearls" then
									changeSetting("Checkmark", a, true, true)
								else
									changeSetting("Checkmark", a, false, true)
								end
							end
						elseif quest.challengeType == "PearlPickups" or quest.challengeType == "Pearls" then
							LogMe("Switching ON Pearl Pickups")
							EquipTeam("Pearls")
							changeSetting("Checkmark", "Collect Drops", true, true)
							changeSetting("Checkmark", "Auto-Kick", false, true)
							changeSetting("Box", "Range", 50000, true)
							changeSetting("Box", "Drop Delay", 60, true)
							changeSetting("Box", "Drop TimeOut", 30, true)
							for a,b in pairs(currency) do
								if a == "Diamonds" or a == "Pearls" then
									changeSetting("Checkmark", a, true, true)
								else
									changeSetting("Checkmark", a, false, true)
								end
							end
						elseif quest.challengeType == "RainbowPickups" or quest.challengeType == "Rainbows" then
							LogMe("Switching ON Rainbow Pickups")
							EquipTeam("Rainbows")
							changeSetting("Checkmark", "Collect Drops", true, true)
							changeSetting("Checkmark", "Auto-Kick", false, true)
							changeSetting("Box", "Range", 50000, true)
							changeSetting("Box", "Drop Delay", 60, true)
							changeSetting("Box", "Drop TimeOut", 30, true)
							for a,b in pairs(currency) do
								if a == "Coins" or a == "Diamonds" or a == "Rainbows" then
									changeSetting("Checkmark", a, true, true)
								else
									changeSetting("Checkmark", a, false, true)
								end
							end
						elseif string.find(quest.challengeType, "Egg") then
							changeWorld("Spawn World", "Easter Island")
							LogMe("Switch to " .. quest.challengeType .. " Challenege")
							--GetEasterEgg(quest.amount, quest.challengeType)
							
							--[[
							if _G.oldeggs["Buy Mode"] == nil then
								local oldeggs = switchEggs({["Buy Mode"] = "Best", ["Eggs"] = {"Snail Egg", "Goldfish Egg", "Common Egg"}}, {}, true)
								LogMe("return old eggs", oldeggs["Buy Mode"], oldeggs["Eggs"][1])
								_G.oldeggs = oldeggs
							else
								LogMe("Chal" .. _G.oldeggs["Buy Mode"])
								for a,b in pairs(_G.oldeggs["Eggs"]) do
									LogMe(b)
								end
								local oldeggs = switchEggs({["Buy Mode"] = "Best", ["Eggs"] = {"Snail Egg", "Goldfish Egg", "Common Egg"}}, _G.oldeggs, false)
								--_G.oldeggs = oldeggs
							end
							]]--
							--switchEggs({["Buy Mode"] = "Best", ["Eggs"] = {"Magma Egg", "Common Egg"}})
						elseif quest.challengeType == "EpicPets" then
							LogMe("Switch to Epic Challenege")
							if _G.oldeggs["Buy Mode"] == nil then
								local oldeggs = switchEggs({["Buy Mode"] = "Best", ["Eggs"] = {"Pineapple Egg", "Safe Egg", "Common Egg"}}, {}, true)
								LogMe("return old eggs", oldeggs["Buy Mode"], oldeggs["Eggs"][1])
								_G.oldeggs = oldeggs
							else
								LogMe("Chal" .. _G.oldeggs["Buy Mode"])
								for a,b in pairs(_G.oldeggs["Eggs"]) do
									LogMe(b)
								end
								local oldeggs = switchEggs({["Buy Mode"] = "Best", ["Eggs"] = {"Pineapple Egg", "Safe Egg", "Common Egg"}}, _G.oldeggs, false)
								--_G.oldeggs = oldeggs
							end
							--switchEggs({["Buy Mode"] = "Best", ["Eggs"] = {"Magma Egg", "Common Egg"}})
						elseif quest.challengeType == "LegendaryPets" then
							LogMe("Switch to Legendary Challenege")
							if _G.oldeggs["Buy Mode"] == nil then
								local oldeggs = switchEggs({["Buy Mode"] = "Best", ["Eggs"] = {"Goldfish Egg", "Lantern Egg", "Magma Egg", "Common Egg"}}, {}, true)
								LogMe("return old eggs", oldeggs["Buy Mode"], oldeggs["Eggs"][1])
								_G.oldeggs = oldeggs
							else
								LogMe("Chal" .. _G.oldeggs["Buy Mode"])
								for a,b in pairs(_G.oldeggs["Eggs"]) do
									LogMe(b)
								end
								local oldeggs = switchEggs({["Buy Mode"] = "Best", ["Eggs"] = {"Goldfish Egg", "Lantern Egg", "Magma Egg", "Common Egg"}}, _G.oldeggs, false)
								--_G.oldeggs = oldeggs
							end
							--switchEggs({["Buy Mode"] = "Best", ["Eggs"] = {"Magma Egg", "Common Egg"}})
						elseif quest.challengeType == "GodlyPets" then
							LogMe("Switch to Godly Challenege")
							if _G.oldeggs["Buy Mode"] == nil then
								local oldeggs = switchEggs({["Buy Mode"] = "Best", ["Eggs"] = {"Void Egg", "Galaxy Egg", "Common Egg"}}, {}, true)
								LogMe("return old eggs", oldeggs["Buy Mode"], oldeggs["Eggs"][1])
								_G.oldeggs = oldeggs
							else
								LogMe("Chal" .. _G.oldeggs["Buy Mode"])
								for a,b in pairs(_G.oldeggs["Eggs"]) do
									LogMe(b)
								end
								local oldeggs = switchEggs({["Buy Mode"] = "Best", ["Eggs"] = {"Void Egg", "Galaxy Egg", "Common Egg"}}, _G.oldeggs, false)
								--_G.oldeggs = oldeggs
							end
							--switchEggs({["Buy Mode"] = "Best", ["Eggs"] = {"Safe Egg", "Galaxy Egg", "Common Egg"}}, )					
						elseif quest.challengeType == "SecretPets" then
							LogMe("Switch to Secret Challenege")
							if _G.oldeggs["Buy Mode"] == nil then
								local oldeggs = switchEggs({["Buy Mode"] = "Best", ["Eggs"] = {"Goldfish Egg", "Safe Egg", "Spotted Egg", "Common Egg"}}, {}, true)
								LogMe("return old eggs", oldeggs["Buy Mode"], oldeggs["Eggs"][1])
								_G.oldeggs = oldeggs
							else
								LogMe("Chal" .. _G.oldeggs["Buy Mode"])
								for a,b in pairs(_G.oldeggs["Eggs"]) do
									LogMe(b)
								end
								local oldeggs = switchEggs({["Buy Mode"] = "Best", ["Eggs"] = {"Goldfish Egg", "Safe Egg", "Spotted Egg", "Common Egg"}}, _G.oldeggs, false)
								--_G.oldeggs = oldeggs
							end
							--switchEggs({["Buy Mode"] = "Best", ["Eggs"] = {"Safe Egg", "Galaxy Egg", "Common Egg"}}, )					
						end

					end

local endQuest = 	function(quest)

						if quest.challengeType == "CoinPickups" or quest.challengeType == "Coins" then
							LogMe("Switching OFF Coin Pickups")
							EquipTeam("Bubbles")
							changeSetting("Checkmark", "Collect Drops", false, true)
							--changeSetting("Box", "Range", 0, true)
						elseif quest.challengeType == "DiamondPickups" or quest.challengeType == "Diamonds" then
							LogMe("Switching OFF Diamond Pickups")
							EquipTeam("Bubbles")
							changeSetting("Checkmark", "Collect Drops", false, true)
							--changeSetting("Box", "Range", 0, true)
						elseif quest.challengeType == "PearlPickups" or quest.challengeType == "Pearls" then
							LogMe("Switching OFF Pearl Pickups")
							EquipTeam("Bubbles")
							changeSetting("Checkmark", "Collect Drops", false, true)
							--changeSetting("Box", "Range", 0, true)
						elseif quest.challengeType == "RainbowPickups" or quest.challengeType == "Rainbows" then
							LogMe("Switching OFF Rainbow Pickups")
							EquipTeam("Bubbles")
							changeSetting("Checkmark", "Collect Drops", false, true)
							--changeSetting("Box", "Range", 0, true)
						elseif quest.challengeType == "Eggs" or quest.challengeType == "EpicPets" or quest.challengeType == "LegendaryPets" or quest.challengeType == "GodlyPets" or quest.challengeType == "SecretPets" then
							LogMe("Switch Back Eggs")
							switchEggs({["Buy Mode"] = {}, ["Eggs"] = {}}, _G.oldeggs, true)
							_G.oldeggs = {}
						else
							wait(5)
						end
					

					end



local questInProgress = false

local doQuest = function()

					local playerLibrary = library.Save.Get()
					--local lastPrize = 0
					for a,b in pairs(library.Directory.Quests) do
						if _G["Atlantis Quest"] and a == "Atlantis" and playerLibrary.Quests["Atlantis"] and not questInProgress then   -- _G.[World .. "Quest"]  ~= nil and then
							LogMe("Atlantis Quest Stage " .. playerLibrary.Quests["Atlantis"].stage .. " of " .. #library.Directory.Quests["Atlantis"])
							questInProgress = true
							while wait(.1) and _G["Atlantis Quest"] and playerLibrary.Quests["Atlantis"].stage <= #library.Directory.Quests["Atlantis"] do
					
								local currentstage = playerLibrary.Quests["Atlantis"].stage
								startQuest(b[currentstage])
							
								--local startTime = os.time()
								local counter = 0
								while _G["Atlantis Quest"] and wait(.1) and playerLibrary.Quests["Atlantis"].progress >= 0 and playerLibrary.Quests["Atlantis"].progress < b[playerLibrary.Quests["Atlantis"].stage].amount and currentstage == playerLibrary.Quests["Atlantis"].stage do
									counter++
									if counter > 300 then
										startQuest(b[currentstage])
										LogMe((playerLibrary.Quests["Atlantis"].progress / b[playerLibrary.Quests["Atlantis"].stage].amount) * 100 .. "%" .. " of " .. b[playerLibrary.Quests["Atlantis"].stage].challengeType)
										counter = 0
									end
								end
								endQuest(b[currentstage])
								if currentstage == playerLibrary.Quests["Atlantis"].stage then
									LogMe("Stage " .. currentstage .. " aborted.")
								elseif currentstage < playerLibrary.Quests["Atlantis"].stage then
									LogMe("Stage " .. currentstage .. " finished.  Next Stage: " .. playerLibrary.Quests["Atlantis"].stage)
								end
								
							end
							questInProgress = false
						elseif questInProgress then
							LogMe("Quest is already in progress")
						end
					end

				end



		
local doChallenge = function()

		local playerLibrary = library.Save.Get()

		if _G.ChallengeName ~= nil and farm.flags[_G.ChallengeName] and playerLibrary[_G.ChallengeName] ~= nil and playerLibrary[_G.ChallengeName].Claimed ~= nil then
			--print("Claimed " .. playerLibrary.Valentines.Claimed)

			local lastPrize = 0

			for a,b in pairs(library.Directory[_G.ChallengeName .. "Quests"]) do
				if a > lastPrize then
					lastPrize = a
				end
				
				if a == (playerLibrary[_G.ChallengeName].Claimed + 1) and playerLibrary[_G.ChallengeName].Progress[b.challengeType] >= b.amount  then
					--print(playerLibrary.Valentines.Progress[b.challengeType] .. " " .. b.challengeType)
					--print(b.amount)
					LogMe("Attempting to claim " .. a .. " " .. _G.ChallengeName)
					local ohTable1 = {
						[1] = {
							[1] = false
						},
						[2] = {
							[1] = 2
						}
					}

					game:GetService("ReplicatedStorage").Remotes[_G.ChallengeRemote]:FireServer(ohTable1)
					
					endQuest(b)
					
				elseif a == (playerLibrary[_G.ChallengeName].Claimed + 1) then
				
					print ((b.amount - playerLibrary[_G.ChallengeName].Progress[b.challengeType]) .. " " .. b.challengeType .. " remaining to claim " .. _G.ChallengeName .. " " .. a)
				
					startQuest(b)
					
				end
			end
			
			if playerLibrary[_G.ChallengeName].Claimed == lastPrize then
				LogMe("All " .. _G.ChallengeName .. " Prizes Claimed")
			end
		end

end

_G.eggQuests = {["Atlantis"] = {[1] = false, [2] = false, [3] = false},
				["Spawn World"] = {[1] = false, [2] = false, [3] = false}}

local doEggQuests = function()

						if _G["Spawn World Egg Quests"] then
							changeSetting("Box", "Auto Shiny Amount", 0, true)
							changeSetting("Selection", "Delete Mode", "Custom Delete", true)
							changeSetting("Box", "Delete at Pet #", 100, true)
							changeSetting("Selection", "Delete Pet Type", "Shiny", true)
							
							changeSetting("Checkmark", "Sky Chest", false, true)
							changeSetting("Checkmark", "Heavenly Chest", false, true)
							changeSetting("Checkmark", "Void Chest", false, true)
							changeSetting("Checkmark", "XP Chest", false, true)
							changeSetting("Checkmark", "Group Rewards", false, true)
																			
						
							local playerLibrary = library.Save.Get()
							
							for a,b in pairs(playerLibrary.EggQuests["Spawn World"]) do
								LogMe("Egg Quest #" .. a .. " " .. b.name .. " " .. b.progress / b.goal * 100 .. "%")
								if not _G.eggQuests["Spawn World"][a] then
									if b.progress >= b.goal and string.find(b.name, "Egg") then
										LogMe("Switch Back Eggs")
										switchEggs({["Buy Mode"] = "Best", ["Eggs"] = {"Void Egg"}}, {}, true)
										changeSetting("Checkmark", "Godly Luck Use", false, true)
										changeSetting("Checkmark", "Mega Luck Use", false, true)
										changeSetting("Checkmark", "Super Lucky Use", false, true)
										changeSetting("Checkmark", "Fast Hatch Use", false, true)
										_G.eggQuests["Spawn World"][a] = true									
									elseif b.progress >= b.goal and (b.name == "EpicPets" or b.name == "LegendaryPets" or b.name == "GodlyPets") then
										LogMe("Switch Back Eggs")
										changeSetting("Checkmark", "Godly Luck Use", false, true)
										changeSetting("Checkmark", "Mega Luck Use", false, true)
										changeSetting("Checkmark", "Super Lucky Use", false, true)
										changeSetting("Checkmark", "Fast Hatch Use", false, true)
										switchEggs({["Buy Mode"] = "Best", ["Eggs"] = {"Void Egg"}}, {}, true)
										_G.eggQuests["Spawn World"][a] = true
									elseif b.progress >= b.goal and (b.name == "Coins") then
										endQuest({["challengeType"] = "Coins"})
										_G.eggQuests["Spawn World"][a] = true
									elseif b.progress >= b.goal and (b.name == "Diamonds") then
										endQuest({["challengeType"] = "Diamonds"})
										_G.eggQuests["Spawn World"][a] = true
									elseif b.progress >= b.goal and (b.name == "Chests") then
										changeSetting("Checkmark", "Sky Chest", false, true)
										changeSetting("Checkmark", "Heavenly Chest", false, true)
										changeSetting("Checkmark", "Void Chest", false, true)
										changeSetting("Checkmark", "XP Chest", false, true)
										changeSetting("Checkmark", "Group Rewards", false, true)
										_G.eggQuests["Spawn World"][a] = true	
									elseif b.progress >= b.goal and b.name == "ShinyLegendaryPets" then
										changeSetting("Box", "Auto Shiny Amount", 0, true)
										changeSetting("Selection", "Delete Pet Type", "Shiny", true)
										changeSetting("Selection", "Delete Mode", "List of Names", true)
										changeSetting("Box", "Pet Names", "Void Hydra,Reaper,Scorpion,Void Overlord", true)
										DeletePets()
										wait(10)
										changeSetting("Selection", "Delete Mode", "Custom Delete", true)
										changeSetting("Box", "Delete at Pet #", 100, true)
										changeSetting("Checkmark", "Godly Luck Use", false, true)
										changeSetting("Checkmark", "Mega Luck Use", false, true)
										changeSetting("Checkmark", "Super Lucky Use", false, true)
										changeSetting("Checkmark", "Fast Hatch Use", false, true)
										_G.eggQuests["Spawn World"][a] = true
									elseif b.progress < b.goal and string.find(b.name, "Egg") then
										LogMe("Switch to " .. b.name .. " Challenge")
										changeSetting("Checkmark", "Fast Hatch Use", true, true)
										if _G.oldeggs["Buy Mode"] == nil then
											local oldeggs = switchEggs({["Buy Mode"] = "Best", ["Eggs"] = {b.name}}, {}, true)
											LogMe("return old eggs", oldeggs["Buy Mode"], oldeggs["Eggs"][1])
											_G.oldeggs = oldeggs
										else
											LogMe("Chal" .. _G.oldeggs["Buy Mode"])
											for a,b in pairs(_G.oldeggs["Eggs"]) do
												LogMe(b)
											end
											local oldeggs = switchEggs({["Buy Mode"] = "Best", ["Eggs"] = {b.name}}, _G.oldeggs, false)
											--_G.oldeggs = oldeggs
										end
									elseif b.progress < b.goal and (b.name == "EpicPets" or b.name == "LegendaryPets" or b.name == "GodlyPets") then
										LogMe("Switch to " .. b.name .. " Challenge")
										if b.name ~= "EpicPets" then
											if _G.oldeggs["Buy Mode"] == nil then
												local oldeggs = switchEggs({["Buy Mode"] = "Best", ["Eggs"] = {"Void Egg"}}, {}, true)
												LogMe("return old eggs", oldeggs["Buy Mode"], oldeggs["Eggs"][1])
												_G.oldeggs = oldeggs
											else
												LogMe("Chal" .. _G.oldeggs["Buy Mode"])
												for a,b in pairs(_G.oldeggs["Eggs"]) do
													LogMe(b)
												end
												local oldeggs = switchEggs({["Buy Mode"] = "Best", ["Eggs"] = {"Void Egg"}}, _G.oldeggs, false)
												--_G.oldeggs = oldeggs
											end
										else
											if _G.oldeggs["Buy Mode"] == nil then
												local oldeggs = switchEggs({["Buy Mode"] = "Best", ["Eggs"] = {"Spotted Egg"}}, {}, true)
												LogMe("return old eggs", oldeggs["Buy Mode"], oldeggs["Eggs"][1])
												_G.oldeggs = oldeggs
											else
												LogMe("Chal" .. _G.oldeggs["Buy Mode"])
												for a,b in pairs(_G.oldeggs["Eggs"]) do
													LogMe(b)
												end
												local oldeggs = switchEggs({["Buy Mode"] = "Best", ["Eggs"] = {"Spotted Egg"}}, _G.oldeggs, false)
												--_G.oldeggs = oldeggs
											end
										end
										if b.name == "GodlyPets" then
											changeSetting("Checkmark", "Godly Luck Use", true, true)
											changeSetting("Checkmark", "Mega Luck Use", true, true)
										elseif b.name == "EpicPets" or b.name == "LegendaryPets" then
											changeSetting("Checkmark", "Super Lucky Use", true, true)
										end
										changeSetting("Checkmark", "Fast Hatch Use", true, true)
									elseif b.progress < b.goal and b.name == "ShinyLegendaryPets" then
										LogMe("Switch to " .. b.name .. " Challenge")
										--[[
										if _G.oldeggs["Buy Mode"] == nil then
											local oldeggs = switchEggs({["Buy Mode"] = "Best", ["Eggs"] = {"Void Egg"}}, {}, true)
											LogMe("return old eggs", oldeggs["Buy Mode"], oldeggs["Eggs"][1])
											_G.oldeggs = oldeggs
										else
											LogMe("Chal" .. _G.oldeggs["Buy Mode"])
											for a,b in pairs(_G.oldeggs["Eggs"]) do
												LogMe(b)
											end
											local oldeggs = switchEggs({["Buy Mode"] = "Best", ["Eggs"] = {"Void Egg"}}, _G.oldeggs, false)
											--_G.oldeggs = oldeggs
										end
										]]--
										changeSetting("Box", "Auto Shiny Amount", 6, true)
										changeSetting("Selection", "Delete Pet Type", "Shiny", true)
										changeSetting("Selection", "Delete Mode", "List of Names", true)
										changeSetting("Box", "Pet Names", "Space Serpent,Lucky Cat,Void Hydra,Reaper,Scorpion,Void Overlord", true)
										changeSetting("Checkmark", "Super Lucky Use", true, true)
										changeSetting("Checkmark", "Fast Hatch Use", true, true)
										--startQuest({["challengeType"] = "Pearls"})
										break
									elseif b.progress < b.goal and (b.name == "Coins") then
										LogMe("Switch to " .. b.name .. " Challenge")
										startQuest({["challengeType"] = "Coins"})
									elseif b.progress < b.goal and (b.name == "Diamonds") then
										LogMe("Switch to " .. b.name .. " Challenge")
										startQuest({["challengeType"] = "Diamonds"})
									elseif b.progress < b.goal and (b.name == "Chests") then
										LogMe("Switch to " .. b.name .. " Challenge")
										changeSetting("Checkmark", "Sky Chest", true, true)
										changeSetting("Checkmark", "Heavenly Chest", true, true)
										changeSetting("Checkmark", "Void Chest", true, true)
										changeSetting("Checkmark", "XP Chest", true, true)
										changeSetting("Checkmark", "Group Rewards", true, true)
									elseif b.progress >= b.goal then
										_G.eggQuests["Spawn World"][a] = true
									end
								end
							end
							
							local claimquest = true
							
							for a,b in pairs(_G.eggQuests["Spawn World"]) do
								if b == false then
									claimquest = false
								end
							end
							
							if claimquest then
								LogMe("Claiming Egg Quest")
							
								local ohTable1 = {
									[1] = {
										[1] = false
									},
									[2] = {
										[1] = 2
									}
								}

								game:GetService("ReplicatedStorage").Remotes["claim egg quest prize"]:InvokeServer(ohTable1)
								wait(3)
								_G.eggQuests = {["Spawn World"] = {[1] = false, [2] = false, [3] = false}}

							end
						elseif _G["Atlantis Egg Quests"] then
							changeSetting("Box", "Auto Shiny Amount", 0, true)
							changeSetting("Selection", "Delete Mode", "Custom Delete", true)
							changeSetting("Box", "Delete at Pet #", 200, true)
							local playerLibrary = library.Save.Get()
							
							for a,b in pairs(playerLibrary.EggQuests.Atlantis) do
								if not _G.eggQuests["Atlantis"][a] then
									LogMe("Egg Quest #" .. a .. " " .. b.name .. " " .. b.progress / b.goal * 100 .. "%")
									if b.progress >= b.goal and string.find(b.name, "Egg") then
										LogMe("Switch Back Eggs")
										switchEggs({["Buy Mode"] = "Best", ["Eggs"] = {"Coral Egg"}}, {}, true)
										_G.eggQuests["Atlantis"][a] = true									
									elseif b.progress >= b.goal and (b.name == "EpicPets" or b.name == "LegendaryPets" or b.name == "GodlyPets") then
										LogMe("Switch Back Eggs")
										switchEggs({["Buy Mode"] = "Best", ["Eggs"] = {"Coral Egg"}}, {}, true)
										_G.eggQuests["Atlantis"][a] = true
									elseif b.progress >= b.goal and (b.name == "Diamonds" or b.name == "Pearls") then
										endQuest({["challengeType"] = "Pearls"})
										_G.eggQuests["Atlantis"][a] = true
									elseif b.progress >= b.goal and b.name == "ShinyLegendaryPets" then
										changeSetting("Box", "Auto Shiny Amount", 0, true)
										changeSetting("Selection", "Delete Mode", "Custom Delete", true)
										changeSetting("Box", "Delete at Pet #", 50, true)
										DeletePets()
										wait(10)
										changeSetting("Box", "Delete at Pet #", 200, true)
										_G.eggQuests["Atlantis"][a] = true
									elseif b.progress < b.goal and string.find(b.name, "Egg") then
										LogMe("Switch to " .. b.name .. " Challenge")
										if _G.oldeggs["Buy Mode"] == nil then
											local oldeggs = switchEggs({["Buy Mode"] = "Best", ["Eggs"] = {b.name}}, {}, true)
											LogMe("return old eggs", oldeggs["Buy Mode"], oldeggs["Eggs"][1])
											_G.oldeggs = oldeggs
										else
											LogMe("Chal" .. _G.oldeggs["Buy Mode"])
											for a,b in pairs(_G.oldeggs["Eggs"]) do
												LogMe(b)
											end
											local oldeggs = switchEggs({["Buy Mode"] = "Best", ["Eggs"] = {b.name}}, _G.oldeggs, false)
											--_G.oldeggs = oldeggs
										end
										break
									elseif b.progress < b.goal and (b.name == "EpicPets" or b.name == "LegendaryPets" or b.name == "GodlyPets") then
										LogMe("Switch to " .. b.name .. " Challenge")
										if _G.oldeggs["Buy Mode"] == nil then
											local oldeggs = switchEggs({["Buy Mode"] = "Best", ["Eggs"] = {"Snail Egg"}}, {}, true)
											LogMe("return old eggs", oldeggs["Buy Mode"], oldeggs["Eggs"][1])
											_G.oldeggs = oldeggs
										else
											LogMe("Chal" .. _G.oldeggs["Buy Mode"])
											for a,b in pairs(_G.oldeggs["Eggs"]) do
												LogMe(b)
											end
											local oldeggs = switchEggs({["Buy Mode"] = "Best", ["Eggs"] = {"Snail Egg"}}, _G.oldeggs, false)
											--_G.oldeggs = oldeggs
										end
										break
									elseif b.progress < b.goal and (b.name == "Diamonds" or b.name == "Pearls") then
										startQuest({["challengeType"] = "Pearls"})
										break
									elseif b.progress < b.goal and b.name == "ShinyLegendaryPets" then
										changeSetting("Box", "Auto Shiny Amount", 6, true)
										--startQuest({["challengeType"] = "Pearls"})
										break
									elseif b.progress >= b.goal then
										_G.eggQuests["Atlantis"][a] = true
									end
								end
							end
							
							local claimquest = true
							
							for a,b in pairs(_G.eggQuests["Atlantis"]) do
								if b == false then
									claimquest = false
								end
							end
							
							if claimquest then
								LogMe("Claiming Egg Quest")
							
								local ohTable1 = {
									[1] = {
										[1] = false
									},
									[2] = {
										[1] = 2
									}
								}

								game:GetService("ReplicatedStorage").Remotes["claim egg quest prize"]:InvokeServer(ohTable1)
								wait(3)
								_G.eggQuests = {["Atlantis"] = {[1] = false, [2] = false, [3] = false}}

							end
						end

end




		farm:Section("Quests")
		farm:Toggle("Atlantis Quest", {location = _G, flag = "Atlantis Quest"}, function() spawn(function() while not _G.settingsloaded do LogMe("Settings not loaded") wait(1) end _G.oldeggs = {} doQuest() end) end)
		if _G.ChallengeName ~= nil then
			farm:Toggle(_G.ChallengeName .. " Challenge", {flag = _G.ChallengeName}, function() spawn(function() while not _G.settingsloaded do LogMe("Settings not loaded") wait(1) end _G.oldeggs = {} doChallenge() end) end)
		end
		farm:Toggle("Spawn World Egg Quests", {location = _G, flag = "Spawn World Egg Quests"}, function() spawn(function() while not _G.settingsloaded do LogMe("Settings not loaded") wait(1) end _G.oldeggs = {} doEggQuests() end) end)
		farm:Toggle("Atlantis Egg Quests", {location = _G, flag = "Atlantis Egg Quests"}, function() spawn(function() while not _G.settingsloaded do LogMe("Settings not loaded") wait(1) end _G.oldeggs = {} doEggQuests() end) end)
		farm:Toggle("Easter Quests", {location = _G, flag = "EasterQuests"})
		farm:Toggle("Default Collect Common", {location = _G, flag = "CollectCommon"})


spawn(function()
				while wait(30) do
					DeletePets()
					ShinyPets()
					doEggQuests()
				end

			end)
		
		
		
_G.eggopened = false
--_G.starthatch = os.time()
_G.statchanged = {}
				
library.Signal.Fired("Stat Changed"):Connect(function(p1)
	
	_G.statchanged[p1] = true
	
	--local coins = library.Save.Get()["Coins"]
	if p1 == "EggsOpened" then
		if _G.BuyEggMode == "None" then
			library.Variables.AutoHatchEggId = nil
		elseif library.Variables.AutoHatchEggId then
			--LogMe(library.Variables.AutoHatchEggId .. " Opened")
			_G.eggopened = true
			_G.LastEgg = os.time()

		end
	--elseif p1 == "Coins" and coins > _G.playerCoins then
		--LogMe(coins - _G.playerCoins .. " added!")
		--_G.playerCoins = coins
	end;
end);

local changeWorld = function(old, new)

			local playerLibrary = library.Save.Get()
			
			local newworldfound = false
			local oldworldfound = false
			
			
			for a,b in pairs(playerLibrary.Worlds) do
				if b == new then
					newworldfound = true
				elseif b == old then
					oldworldfound = true
				end
			end
			
			if new == "Easter Island" then
				newworldfound = true
			end
			if old == "Easter Island" then
				oldworldfound = true
			end

			if old == "Spawn World" and new == "Atlantis" and newworldfound then
				game:GetService("Workspace").MAP["Eggs/Portals"].Portal.Interact.Activated:Fire()
				wait(10)
				while library.Variables.LoadingWorld do
					LogMe("TPing to Atlantis")
					wait(1)
				end
			elseif old == "Spawn World" and new == "Easter Island" and newworldfound then
				if game:GetService("Workspace").MAP:FindFirstChild("Cave") ~= nil then
					game:GetService("Workspace").MAP.Cave.Host.Activated:Fire()
					wait(10)
					while library.Variables.LoadingWorld do
						LogMe("TPing to Easter Island")
						wait(1)
					end
				end
			elseif game:GetService("Workspace").MAP:FindFirstChild("Portal") ~= nil and game:GetService("Workspace").MAP.Portal:FindFirstChild("Portal") ~= nil and game:GetService("Workspace").MAP.Portal.Portal:FindFirstChild("Interact") ~= nil and new == "Spawn World" and oldworldfound then
				game:GetService("Workspace").MAP.Portal.Portal.Interact.Activated:Fire()
				wait(10)
				while library.Variables.LoadingWorld do
					LogMe("TPing to Spawn World")
					wait(1)
				end
			elseif game:GetService("Workspace").MAP:FindFirstChild("Portal") ~= nil and game:GetService("Workspace").MAP.Portal:FindFirstChild("Portal") ~= nil and game:GetService("Workspace").MAP.Portal.Portal:FindFirstChild("Interact") ~= nil and new == "Atlantis" and newworldfound then
				game:GetService("Workspace").MAP.Portal.Portal.Interact.Activated:Fire()
				wait(10)
				while library.Variables.LoadingWorld do
					LogMe("TPing to Spawn World")
					wait(1)
				end
				wait(1)
				game:GetService("Workspace").MAP["Eggs/Portals"].Portal.Interact.Activated:Fire()
				wait(10)
				while library.Variables.LoadingWorld do
					LogMe("TPing to Atlantis")
					wait(1)
				end
			elseif old == "Atlantis" and new == "Spawn World" and oldworldfound then
				game:GetService("Workspace").MAP.Portal.Interact.Activated:Fire()
				wait(10)
				while library.Variables.LoadingWorld do
					LogMe("TPing to Spawn World")
					wait(1)
				end
			elseif old == "Atlantis" and new == "Easter Island" and oldworldfound then
				game:GetService("Workspace").MAP.Portal.Interact.Activated:Fire()
				wait(10)
				while library.Variables.LoadingWorld do
					LogMe("TPing to Spawn World")
					wait(1)
				end
				wait(1)
				if game:GetService("Workspace").MAP:FindFirstChild("Cave") ~= nil then
					game:GetService("Workspace").MAP.Cave.Host.Activated:Fire()
					wait(10)
					while library.Variables.LoadingWorld do
						LogMe("TPing to Easter Island")
						wait(1)
					end
				end
			elseif new == "Atlantis" and not newworldfound and playerLibrary[library.Directory.Worlds[new].cost.currency] >= library.Directory.Worlds[new].cost.amount then
				LogMe("Purchasing " .. new .. " for " .. library.Functions.NumberShorten(library.Directory.Worlds[new].cost.amount) .. " " .. library.Directory.Worlds[new].cost.currency)
				local ohTable1 = {
									[1] = {
										[1] = new
									},
									[2] = {
										[1] = false
									}
								}

				game:GetService("ReplicatedStorage").Remotes["buy world"]:FireServer(ohTable1)
				wait(1)
				game:GetService("Workspace").MAP["Eggs/Portals"].Portal.Interact.Activated:Fire()
				wait(10)
				while library.Variables.LoadingWorld do
					LogMe("TPing to Atlantis")
					wait(1)
				end
			elseif new == old then
				wait(1)
			elseif not newworldfound and new ~= "Spawn World" then
				LogMe(library.Functions.NumberShorten(library.Directory.Worlds[new].cost.amount - playerLibrary[library.Directory.Worlds[new].cost.currency]) .. " more " .. library.Directory.Worlds[new].cost.currency .. " needed to buy " .. new)
			end

end


function openEgg(egg)
	local playerLibrary = library.Save.Get()
	--local tripleEgg = false

	--if multiplier == 3 then 
		--tripleEgg = true
	--end
	if Eggs[egg]["World"] ~= playerLibrary.World and not library.Variables.LoadingWorld then
	
		--local newworldfound = false
			
			
		--for a,b in pairs(playerLibrary.Worlds) do
			--if b == Eggs[egg]["World"] then
				--newworldfound = true
			--end
		--end
	
		--if newworldfound then
			changeWorld(playerLibrary.World, Eggs[egg]["World"])
		--end
	
			

	end
	
	-- This script was generated by Hydroxide's RemoteSpy: https://github.com/Upbolt/Hydroxide


	local ohTable2 = {
		[1] = {
			[1] = egg,
			[2] = 3
		},
		[2] = {
			[1] = false,
			[2] = false
		}
	}
	
	--local playerLibrary = library.Save.Get()

	--if playerLibrary[Eggs[egg].Currency] > (Eggs[egg].Cost * multiplier) then
	local eggmap = GetMap().Eggs:FindFirstChild(egg)
	
	if eggmap ~= nil then
		if not library.Variables.AutoHatchEnabled or not library.Variables.AutoHatchEggId or library.Variables.AutoHatchEggId ~= egg or (GetPlayerRoot().Position-eggmap.PrimaryPart.Position).magnitude > 10 then
			if GetPlayerChar() and GetPlayerRoot() ~= nil then
				GetPlayerChar():SetPrimaryPartCFrame(CFrame.new(eggmap.PrimaryPart.Position + Vector3.new(3,-5,-3)))
				wait(.1)
				library.Variables.AutoHatchEnabled = true
				library.Variables.AutoHatchEggId = egg
				wait(1)
			end
			
		end
		--game:GetService("ReplicatedStorage").Remotes["buy egg"]:InvokeServer(ohTable2)
		
		_G.eggopened = false
		_G.nomoney = false
		start = os.time()
		while (os.time() < start + _G.EggTimeout) and not _G.nomoney and not _G.eggopened do 
		wait()

		end
			if _G.eggopened and _G["Drop Delay"] ~= _G["Old Drop Delay"] then
				changeSetting("Box", "Drop Delay", _G["Old Drop Delay"], true)
			elseif _G.nomoney and not _G.eggopened then
				--print("Did not recieve egg open flag")
				_G.LastEgg = 0
				if _G.drops and _G.forcedrops then
					if _G["Drop Delay"] ~= 0 then
						_G["Old Drop Delay"] = _G["Drop Delay"]
						changeSetting("Box", "Drop Delay", 0, true)
					end
				end
			elseif not _G.eggopened then
				print("Did not recieve egg open flag")
				_G.LastEgg = 0
			end

	end
			
		--library.Variables.OpeningEgg = false
		--game:GetService("ReplicatedStorage").Remotes["buy egg"]:InvokeServer(ohTable2)
		--_G.LastEgg = os.time()
	--end
end

local sharedModules = game:GetService("ReplicatedStorage").Nevermore["Shared Modules"]
local remotes = nil

local counter = 0
for a,b in pairs(sharedModules:GetChildren()) do

	--print(a)
	for c,d in pairs(b:GetChildren()) do
		--print(d)
		counter++
	end
	if counter > 100 then
		remotes = b
		counter = 0
	end
end

local openegg = nil
local connection = nil
for i,v in pairs(getconnections(remotes["open egg"].Event)) do
	connection = v
	openegg = v.Function
end

local egg = wally:CreateWindow('Eggs')
	egg:Toggle('Hide Animation', {flag = "HideAnimation"}, function() spawn(function() if egg.flags.HideAnimation then connection:Disable() else connection:Enable() end end) end)
	egg:Toggle('Kick on Zero Eggs', {flag = "KickZeroEggs"})
	egg:Toggle('Open Exclusive Eggs', {flag = "OpenExEggs"})
	egg:Section('Select Eggs')
	egg:Dropdown("Buy Mode", {location = _G, flag = "BuyEggMode", list = {"None", "Best", "Any"} })
	
 
	for a,b in orderedPairs(Eggs) do
		egg:Toggle(a, {location = _G, flag = a}, function() _G.lastBest = {["Diamonds"] = {["Name"] = nil, ["Cost"] = 0},
																			 ["Coins"] = {["Name"] = nil, ["Cost"] = 0},
																			 ["Pearls"] = {["Name"] = nil, ["Cost"] = 0}} end)
		_G[a] = false
	end

--local pickups = {"Coins Present", "Coins Bag", "Large Coin", "Medium Coin", "Small Coin", "Large Diamonds", "Small Diamond", "Orb"}
local library = require(game:GetService("ReplicatedStorage").Nevermore.Library)
local pickupsLib = library.Network.Invoke("Get Pickups")

spawn(function()

		while wait(60) do
		
			if egg.flags.OpenExEggs then
			
				local playerLibrary = library.Save.Get()
				local exeggs = playerLibrary.ExclusiveEggs

				if exeggs ~= nil and #exeggs > 0 then
					repeat
						for a,b in pairs(exeggs) do
							local ohTable1 = {
							[1] = {
								[1] = b.uid
							},
							[2] = {
								[1] = false
							}}

							game:GetService("ReplicatedStorage").Remotes["open exclusive egg"]:InvokeServer(ohTable1)
							wait(3)
							exeggs = playerLibrary.ExclusiveEggs

							break

						end
					until exeggs == nil or #exeggs < 1
				end
			
			end
		
		end

end)


for i,world in pairs(library.Game.Pickups:GetChildren()) do

	local worldfound = false
	for m,n in pairs(areas) do
		if n == world.name then
			worldfound = true
		end
	end
	if not worldfound then
		areas[world.name] = {}
	end

	--print(world)
	for c,area in pairs(world:GetChildren()) do
	
	local areafound = false
	for m,n in pairs(areas[world.name]) do
		if n == area.name then
			areafound = true
		end
	end
	if not areafound then
		table.insert(areas[world.name], area.name)
	end
	
	--print(world,area)
		for e,drop in pairs(area:GetChildren()) do
			for g,h in pairs(drop:GetChildren()) do
			
				local this = require(h)
				local found = false
				for x,y in pairs(currency[this.currencyType]) do
					--print(x,y)
					--for j,k in pairs(y) do
						if x == drop.Name then
							found = true
						end
					--end
				end
					
					
				if not found then
					currency[this.currencyType][drop.Name] = this.model.Name
				end
			
			end
		end
	end
end

local drop = wally:CreateWindow('Drops')
	drop:Toggle('Collect Drops', {location = _G, flag = 'drops'})
	drop:Toggle('Auto-Kick', {location = _G, flag = 'GrindKick'})
	
	drop:Box('Range', {location = _G,
        flag = "droprange",
        type = 'number'
    })
	drop:Box('Drop Delay', {location = _G,
    flag = "Drop Delay",
    type = 'number'
	}, function() if _G["Drop Delay"] ~= 0 then _G["Old Drop Delay"] = _G["Drop Delay"] end end )
	--changeSetting("Box", "Drop Delay", 60, true)
    _G["Old Drop Delay"] = _G["Drop Delay"]
		

	
	drop:Box('Drop TimeOut', {location = _G,
        flag = "Drop TimeOut",
        type = 'number'
    })
	--changeSetting("Box", "Drop TimeOut", 10, true)

	

    for a,b in orderedPairs(currency) do
		drop:Toggle(a, {location = _G, flag = a})
		_G[a] = false
	end
	
	for a,b in pairs(areas) do
		drop:Section(a)
		for c,d in pairs(b) do
			if d == "VIP" and VIP then
				drop:Toggle(d, {location = _G, flag = d})
			elseif d ~= "VIP" and d == "Main" then
				drop:Toggle(a .. " " .. d, {location = _G, flag = a .. " " .. d})
			elseif d ~= "VIP" and d ~= "Main" then
				drop:Toggle(d, {location = _G, flag = d})
			end			
		end
	end

function toTarget(pos, targetPos, targetCFrame)
    local tween_s = game:service"TweenService"
    local info = TweenInfo.new((targetPos - pos).Magnitude/150, Enum.EasingStyle.Quad)
    -- local tic_k = tick()
    local tween, err = pcall(function()
        local tween = tween_s:Create(GetPlayerRoot(), info, {CFrame = targetCFrame})
        tween:Play()
    end)
    
	if not tween then return err end
end

local saveSettings = function(preset)

	local playername = plr.Name
	local update = {}
	local counter = 1

	if preset and preset == 1 then
		playername = "Preset1"
	end

	
	if isfile("bgcsettings.txt") then
		update = game:GetService("HttpService"):JSONDecode(readfile("bgcsettings.txt"))
	end
	
	if update[playername] == nil then
		update[playername] = {}
	end
	
	
	
	for a,b in pairs(game:GetService("CoreGui").ScreenGui:GetDescendants()) do
	
			if b.Name == "Checkmark" and b.Text == utf8.char(10003) then
			
				update[playername][b.Parent.name] = true
				
			elseif b.Name == "Checkmark" and b.Text ~= utf8.char(10003) then
			
				update[playername][b.Parent.name] = false

			elseif b.Name == "Box" and b.Text ~= nil and b.Text ~= "" and b.Text ~= 0 and not library.Directory.Boosts[b.Parent.Name] then
			
				update[playername][b.Parent.name] = b.Text
				
			elseif b.Name == "Box" and (b.Text == nil or b.Text == "" or b.Text == 0) and not library.Directory.Boosts[b.Parent.Name] then
				
				update[playername][b.Parent.name] = 0
				--print(b.Parent.Name)

			elseif b.Name == "Selection" then
			
				local currentsetting = b.Text
			
				for i,v in pairs(getconnections(b.Parent.drop.MouseButton1Click)) do
					v:Fire()
				end
				wait(.5)
				update[playername][b.Text] = currentsetting
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

local loadSettings = function(preset)

		if isfile("bgcsettings.txt") then

			local json = game:GetService("HttpService"):JSONDecode(readfile("bgcsettings.txt"))
			
			local playername = plr.Name
			
			if preset and preset == 1 then
				playername = "Preset1"
			end
			
			--if json[playername] == nil then
				--playername = "newuser"
			--end
			
			if json[playername] ~= nil then
				for a,b in pairs(game:GetService("CoreGui").ScreenGui:GetDescendants()) do

						if b.Name == "Checkmark" and json[playername][b.Parent.name] and b.Text ~= utf8.char(10003) then
					
							for a,b in pairs(getconnections(b.MouseButton1Click)) do
								b:Fire()
							end
					
						elseif b.Name == "Checkmark" and not json[playername][b.Parent.name] and b.Text == utf8.char(10003) then
						
							for a,b in pairs(getconnections(b.MouseButton1Click)) do
								b:Fire()
							end
							
						elseif b.Name == "Box" and json[playername][b.Parent.name] ~= nil and json[playername][b.Parent.name]~= "" and json[playername][b.Parent.name] ~= 0 then
						
							b.Text = json[playername][b.Parent.name]
							for i,v in pairs(getconnections(b.FocusLost)) do
								v:Fire()
							end
						
						elseif b.Name == "Selection" then
						
							local currentValue = b.Text
						
							for i,v in pairs(getconnections(b.Parent.drop.MouseButton1Click)) do
								v:Fire()
							end
							wait(.5)
							local selectionname = b.Text
						
							if json[playername][selectionname] ~= nil and json[playername][selectionname] ~= "" and json[playername][selectionname] ~= 0 then
								for i,v in pairs(b.Parent.DropContainer:GetChildren()) do
									if v.Name == "TextButton" and v.Text == json[playername][selectionname] then
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
		
		_G.settingsloaded = true
end

_G.chesttimers = {}
_G.chestwait = 10
library.Network.Fired("Update Chests"):Connect(function(p1) _G.chesttimers = p1 end)

local CollectChests = function()
		local playerLibrary = library.Save.Get()
		
		while library.Variables.LoadingWorld and wait(1) do
			LogMe("Waiting on world to load")
		end
		
		for a,b in pairs(library.Directory.Chests) do
			if _G[a] and b.world == playerLibrary.World and _G.chesttimers[a] and _G.chesttimers[a] < _G.chestwait then
				while _G.chesttimers[a] do
					LogMe("Waiting " .. _G.chesttimers[a] .. " seconds for " .. a)
					wait(1)
				end
			end
		end


		for a,b in pairs(GetMap().Chests:GetChildren()) do
			if _G[b.name] and GetMap().Activations:FindFirstChild(b.name) ~= nil then
				local chest = GetMap().Activations[b.name]
				
				for c,d in pairs(playerLibrary.Teams) do
					if d.name == library.Directory.Chests[b.name].currencyType then
					
						LogMe("Switching to " .. library.Directory.Chests[b.name].currencyType .. " Team")
						
						local ohTable1 = {
							[1] = {
								[1] = d.uid
							},
							[2] = {
								[1] = false
							}
						}

						game:GetService("ReplicatedStorage").Remotes["equip team"]:FireServer(ohTable1)
					end
				end
				wait(1)
				
				local startTime = os.time()
				repeat
					LogMe("TP to " .. b.name)
					local playerroot = GetPlayerRoot()
					GetPlayerChar():SetPrimaryPartCFrame(CFrame.new(chest.Position.X + math.random(8,20), chest.Position.Y + 10, chest.Position.Z + math.random(8,20)))
					wait(_G.TeleportDelay)
					toTarget(GetPlayerRoot().Position,chest.Position + Vector3.new(math.random(1,3), 0, math.random(1,3)),chest.CFrame)
					wait(_G.TeleportDelay)
				until game:GetService("Workspace").MAP.Chests:FindFirstChild(b.name) == nil or (os.time() > startTime + 60)
				LogMe("Grabbed " .. b.name .. "!!!")
				--wait(_G.TeleportDelay)
				
				for c,d in pairs(playerLibrary.Teams) do
					if d.name == "Bubbles" then
						LogMe("Switching to Bubbles Team")	
						local ohTable1 = {
							[1] = {
								[1] = d.uid
							},
							[2] = {
								[1] = false
							}
						}
						game:GetService("ReplicatedStorage").Remotes["equip team"]:FireServer(ohTable1)
					end
				end
			end
		end	
		


end

local settingsGUI = wally:CreateWindow('Settings')
settingsGUI:Button('Load Settings', function() loadSettings() end)
settingsGUI:Button('Save Settings', function() saveSettings() end)
settingsGUI:Section("Presets")
settingsGUI:Button('Load Preset 1', function() loadSettings(1) end)
settingsGUI:Button('Save Preset 1', function() saveSettings(1) end)

local playernamewindow = wally:CreateWindow(GetLocalPlayer().name)
game:GetService("CoreGui").ScreenGui.Container[GetLocalPlayer().name].window_toggle:Destroy()
game:GetService("CoreGui").ScreenGui.Container[GetLocalPlayer().name].Position = UDim2.new(0, 90, 0, -55)
game:GetService("CoreGui").ScreenGui.Container[GetLocalPlayer().name].Size = UDim2.new(0, 400, 0, 55)
game:GetService("CoreGui").ScreenGui.Container[GetLocalPlayer().name].TextLabel.TextScaled = true
game:GetService("CoreGui").ScreenGui.Container[GetLocalPlayer().name].TextLabel.Position = UDim2.new(0, 0, 0, 0)
game:GetService("CoreGui").ScreenGui.Container[GetLocalPlayer().name].TextLabel.Size = UDim2.new(1, 1, 1, -10)

_G.lastBest = {["Diamonds"] = {["Name"] = nil, ["Cost"] = 0},
						 ["Coins"] = {["Name"] = nil, ["Cost"] = 0},
						 ["Pearls"] = {["Name"] = nil, ["Cost"] = 0}
						}
_G.thisBest = {["Diamonds"] = {["Name"] = nil, ["Cost"] = 0},
						 ["Coins"] = {["Name"] = nil, ["Cost"] = 0},
						 ["Pearls"] = {["Name"] = nil, ["Cost"] = 0}
						} 
_G.lastBestCurrency = "Pearls"

_G["Old Drop Delay"] = 0		


spawn(function()
			
	while wait(.1) do
			--if not _G.collectingchests and not _G.sell and farm.flags.Drops == true and (_G.canafford ~= true or _G.eggSkip == true) then
	if _G.settingsloaded then
	
		while library.Variables.LoadingWorld and wait(1) do
			LogMe("Waiting on world to load")
		end
	
		CollectChests()
		
		doGroupRewards()

	
		local bestEgg = {["Diamonds"] = {["Name"] = nil, ["Cost"] = 0},
						 ["Coins"] = {["Name"] = nil, ["Cost"] = 0},
						 ["Pearls"] = {["Name"] = nil, ["Cost"] = 0},
						 ["Rainbows"] = {["Name"] = nil, ["Cost"] = 0}
						}
		
		local playerLibrary = library.Save.Get()
		--if playerLibrary.Boosts["Fast Hatch"] then 
			--_G.NextEgg = _G.LastEgg + 3
		--else 
			--_G.NextEgg = _G.LastEgg +  5
		--end
		--if os.time() > _G.NextEgg and _G.eggopened then
			--if _G.BuyEggMode ~= "None" then
				--LogMe("Hatching Eggs", _G.NextEgg)
			--end
			
					
	
			
				for i,v in pairs(Eggs) do
				
				
					local newworldfound = false
					
					if v.World == "Spawn World" or v.World == "Easter Island" then
						newworldfound = true
					end
			
			
					for a,b in pairs(playerLibrary.Worlds) do
						if b == v.World then
							newworldfound = true
						end
					end
				
				
				
					if playerLibrary[v.Currency] ~= nil and playerLibrary[v.Currency] > (v.Cost * multiplier) and v.Cost > bestEgg[v.Currency].Cost and _G[i] and newworldfound then
						bestEgg[v.Currency].Name = i
						bestEgg[v.Currency].Cost = v.Cost
					end
				end
				
				local newBest = ""
				
				if bestEgg["Diamonds"].Name and bestEgg["Coins"].Name and bestEgg["Pearls"].Name and bestEgg["Rainbows"].Name then
					--print("Opening " .. bestEgg.Name)
					newBest = bestEgg["Rainbows"].Name
				elseif bestEgg["Pearls"].Name and bestEgg["Diamonds"].Name and bestEgg["Coins"].Name then
					newBest = bestEgg["Pearls"].Name			
				elseif bestEgg["Diamonds"].Name and bestEgg["Coins"].Name then
					if bestEgg["Diamonds"].Name == "Safe Egg" and bestEgg["Coins"].Cost <= 35000 then
						newBest = bestEgg["Diamonds"].Name
							--openEgg(bestEgg["Diamonds"].Name)
					elseif bestEgg["Diamonds"].Name == "Lantern Egg" and bestEgg["Coins"].Cost <= 250000 then
						newBest = bestEgg["Diamonds"].Name
					elseif bestEgg["Diamonds"].Name == "Banana Bandana on Nana Egg" and bestEgg["Coins"].Cost <= 500000 then
						newBest = bestEgg["Diamonds"].Name
							--openEgg(bestEgg["Diamonds"].Name)
					elseif bestEgg["Coins"].Cost > bestEgg["Diamonds"].Cost then
						newBest = bestEgg["Coins"].Name
							--openEgg(bestEgg["Coins"].Name)
					else
						newBest = bestEgg["Diamonds"].Name
							--openEgg(bestEgg["Diamonds"].Name)
					end				
				elseif bestEgg["Pearls"].Name then
					newBest = bestEgg["Pearls"].Name
				elseif bestEgg["Rainbows"].Name then
					newBest = bestEgg["Rainbows"].Name
				elseif bestEgg["Diamonds"].Name then
					newBest = bestEgg["Diamonds"].Name
					--openEgg(bestEgg["Diamonds"].Name)
				elseif bestEgg["Coins"].Name then
					newBest = bestEgg["Coins"].Name
				end

			--LogMe("Auto Hatch Enabled" .. tostring(library.Variables.AutoHatchEnabled))
			--LogMe("Auto Hatch Egg" .. tostring(library.Variables.AutoHatchEggId))
			
			if _G.BuyEggMode == "Best" and newBest ~= "" and (newBest ~= _G.lastBest or not _G.eggopened or (os.time() > (_G.LastEgg + _G.EggTimeout))) then
					--LogMe("Buy Mode " .. _G.BuyEggMode)
					--LogMe("Last Egg " .. os.time() - _G.LastEgg)
					--LogMe("Egg Opened " .. tostring(_G.eggopened))
					LogMe("Opening " .. tostring(newBest))
					--LogMe("AutoHatchEgg" .. library.Variables.AutoHatchEggId)
					--LogMe("AutoHatchEnabled" .. library.Variables.AutoHatchEnabled)
				_G.eggopened = false
				openEgg(newBest)
				_G.lastBest = newBest
				
			elseif _G.BuyEggMode == "Best" and newBest == "" then
				library.Variables.AutoHatchEggId = nil
				_G.lastBest = ""
				--print(_G.eggopened, os.time() - _G.LastEgg)


				
			elseif _G.BuyEggMode == "Any" then --and (not _G.eggopened or (os.time() > _G.LastEgg + _G.EggTimeout)) then
				--_G.eggopened = true
				for i,v in orderedPairs(Eggs) do
					LogMe("Buy Mode " .. _G.BuyEggMode)
					LogMe("Last Egg " .. os.time() - _G.LastEgg)
					LogMe("Egg Opened " .. tostring(_G.eggopened))
				
					
					
					--_G.eggopened = false
				
					while _G[i] and library.Variables.AutoHatchEggId ~= nil and i == library.Variables.AutoHatchEggId do
						--print("Opening " .. i)
						_G.eggopened = false
						openEgg(i)
					end
					
					while not _G.eggopened do
						wait()
					end
					
					if _G.BuyEggMode ~= "Any" then
						break
					end
				end
			elseif _G.BuyEggMode == "None" then
				library.Variables.AutoHatchEggId = nil
				--library.Variables.AutoHatchEnabled = false
			end
			--wait(_G.TeleportDelay)
		--end
		
		
		
				
				


		
		--if playerLibrary.Boosts["Fast Hatch"] then 
			--_G.NextEgg = _G.LastEgg + 3
		--else 
			--_G.NextEgg = _G.LastEgg +  5
		--end
		--if os.time() > _G.NextEgg and _G.eggopened then
			--if _G.BuyEggMode ~= "None" then
				--LogMe("Hatching Eggs", _G.NextEgg)
			--end
			
				--[[	
	
			
				for i,v in pairs(Eggs) do
				
				
					local newworldfound = false
					
					if v.World == "Spawn World" then
						newworldfound = true
					end
			
			
					for a,b in pairs(playerLibrary.Worlds) do
						if b == v.World then
							newworldfound = true
						end
					end
				
					if playerLibrary[v.Currency] ~= nil and ((playerLibrary[v.Currency] > v.Cost and v.Cost > bestEgg[v.Currency].Cost and -- enough for this egg and costs more than last egg or no last egg and
						((playerLibrary[_G.lastBestCurrency] < _G.lastBest[_G.lastBestCurrency].Cost) or _G.lastBest[_G.lastBestCurrency].Cost == 0))  or --no last egg or still enough for last egg
						(_G.forcedrops and _G.drops and -- force drops and not same currency as last egg and more expensive or same currency as last egg and currency less than 60 eggs and currency more than 1200 last egg
							((v.Currency ~= _G.lastBestCurrency and (v.Cost > _G.lastBest[_G.lastBestCurrency].Cost) and (v.Cost > bestEgg[v.Currency].Cost)) or --and (playerLibrary[v.Currency] > v.Cost) 
								((v.Currency == _G.lastBestCurrency) and 
									((v.Cost > _G.lastBest[_G.lastBestCurrency].Cost) and (playerLibrary[v.Currency] > 13 * _G.lastBest[_G.lastBestCurrency].Cost * _G["Drop TimeOut"]) or
										(v.Cost < _G.lastBest[_G.lastBestCurrency].Cost and (playerLibrary[v.Currency] < .5 * v.Cost * _G["Drop TimeOut"]))))))) and
								 --(playerLibrary[v.Currency] > v.Cost * _G["Drop TimeOut"] * 12))) and  -- and playerLibrary[v.Currency] > v.Cost * 33
															  --((playerLibrary[v.Currency] < _G.highhigh * v.Cost) and (playerLibrary[v.Currency] > _G.lowhigh * v.Cost)))) and 
															-- (playerLibrary[v.Currency] < _G.highlow * v.Cost and playerLibrary[v.Currency] >= _G.lowlow )))) and 
						_G[i] and newworldfound then
						bestEgg[v.Currency].Name = i
						bestEgg[v.Currency].Cost = v.Cost
						_G.bestCurr = v.Currency
						
					end
				end
				
				newBest = _G.lastBest[_G.lastBestCurrency].Name
				
				if bestEgg["Diamonds"].Name and bestEgg["Coins"].Name and bestEgg["Pearls"].Name then
					--print("Opening " .. bestEgg.Name)
					newBest = bestEgg["Pearls"].Name
				elseif bestEgg["Diamonds"].Name and bestEgg["Coins"].Name then
					if bestEgg["Diamonds"].Name == "Safe Egg" and bestEgg["Coins"].Cost <= 35000 then
						newBest = bestEgg["Diamonds"].Name
							--openEgg(bestEgg["Diamonds"].Name)
					elseif bestEgg["Diamonds"].Name == "Lantern Egg" and bestEgg["Coins"].Cost <= 250000 then
						newBest = bestEgg["Diamonds"].Name
					elseif bestEgg["Diamonds"].Name == "Banana Bandana on Nana Egg" and bestEgg["Coins"].Cost <= 500000 then
						newBest = bestEgg["Diamonds"].Name
							--openEgg(bestEgg["Diamonds"].Name)
					elseif bestEgg["Coins"].Cost > bestEgg["Diamonds"].Cost then
						newBest = bestEgg["Coins"].Name
							--openEgg(bestEgg["Coins"].Name)
					else
						newBest = bestEgg["Diamonds"].Name
							--openEgg(bestEgg["Diamonds"].Name)
					end				
				elseif bestEgg["Pearls"].Name then
					newBest = bestEgg["Pearls"].Name
				elseif bestEgg["Diamonds"].Name then
					newBest = bestEgg["Diamonds"].Name
					--openEgg(bestEgg["Diamonds"].Name)
				elseif bestEgg["Coins"].Name then
					newBest = bestEgg["Coins"].Name
				end
				
				for a,b in pairs(bestEgg) do
					if b.Name == newBest then
						_G.thisBest[a].Name = b.Name
						_G.thisBest[a].Cost = b.Cost
					end
				end

			--print(os.time() - _G.LastEgg)
		
				--_G.lastBest[v.Currency].Cost = newBest[v.Currency].Cost
			--LogMe("Auto Hatch Enabled" .. tostring(library.Variables.AutoHatchEnabled))
			--LogMe("Auto Hatch Egg" .. tostring(library.Variables.AutoHatchEggId))
			
			if _G.BuyEggMode == "Best" and newBest ~= "" and newBest ~= nil and (_G.thisBest[_G.bestCurr].Name ~= _G.lastBest[_G.bestCurr].Name or (os.time() > (_G.LastEgg + _G.EggTimeout))) then
				--print(os.time() - _G.LastEgg)
				--print(_G.thisBest[_G.bestCurr].Name)
				--print(_G.lastBest[_G.bestCurr].Name)
				--print("newbest", newBest)
				for a,b in pairs(Eggs) do
					if b.Name == newBest then
						_G.lastBestCurrency = b.Currency
						--print(b.Currency)
					end
				end
					--LogMe("Buy Mode " .. _G.BuyEggMode)
					--LogMe("Last Egg " .. os.time() - _G.LastEgg)
					--LogMe("Egg Opened " .. tostring(_G.eggopened))
					LogMe("Opening " .. tostring(newBest))
					--LogMe("AutoHatchEgg" .. library.Variables.AutoHatchEggId)
					--LogMe("AutoHatchEnabled" .. library.Variables.AutoHatchEnabled)
					
			--	if _G.drops and _G.forcedrops then
					--_G["Old Drop Delay"] = _G["Drop Delay"]
					--changeSetting("Box", "Drop Delay", 0, true)
				--else
					--changeSetting("Box", "Drop Delay", 1, true)
					 --= _G["Old Drop Delay"]
					openEgg(newBest)
					_G.lastBest = _G.thisBest
				

				
					
			--	end
				
			elseif _G.BuyEggMode == "Best" and (not _G.bestCurr or not _G.thisBest or not _G[_G.thisBest[_G.bestCurr].Name]) then
				print("No Egg to Hatch")
				library.Variables.AutoHatchEggId = nil
				wait(5)
				--_G.lastBest = {["Diamonds"] = {["Name"] = nil, ["Cost"] = 0},
						-- ["Coins"] = {["Name"] = nil, ["Cost"] = 0},
						 -- ["Pearls"] = {["Name"] = nil, ["Cost"] = 0}}
				--_G["Old Drop Delay"] = _G["Drop Delay"]
				--_G["Drop Delay"] = 0
				--print(_G.eggopened, os.time() - _G.LastEgg)


				
			elseif _G.BuyEggMode == "Any" then --and (not _G.eggopened or (os.time() > _G.LastEgg + _G.EggTimeout)) then
				--_G.eggopened = true
				for i,v in orderedPairs(Eggs) do
					LogMe("Buy Mode " .. _G.BuyEggMode)
					LogMe("Last Egg " .. os.time() - _G.LastEgg)
					LogMe("Egg Opened " .. tostring(_G.eggopened))
				
					
					
					--_G.eggopened = false
				
					while _G[i] and library.Variables.AutoHatchEggId ~= nil and i == library.Variables.AutoHatchEggId do
						--print("Opening " .. i)
						_G.eggopened = false
						openEgg(i)
					end
					
					while not _G.eggopened do
						wait()
					end
					
					if _G.BuyEggMode ~= "Any" then
						break
					end
				end
			elseif _G.BuyEggMode == "None" then
				library.Variables.AutoHatchEggId = nil
				--library.Variables.AutoHatchEnabled = false
			end
			--wait(_G.TeleportDelay)
		--end
		
		]]--
		
		if farm.flags.FreeLoot then
			--print("Do Free Loot")
			doFreeLoot()
			--print("End Free Loot")
		end
		

		--if tonumber(_G["Drop Delay"]) ~= nil then
			--if tonumber(_G["Drop Delay"]) < 1 then
				--changeSetting("Box", "Drop Delay", 1, true)
			--end
		--else
			--changeSetting("Box", "Drop Delay", 1, true)
		--end
		
		--if tonumber(_G["Drop TimeOut"]) ~= nil then
			--if tonumber(_G["Drop TimeOut"]) < 5 then
				--changeSetting("Box", "Drop TimeOut", 5, true)
			--end
		--else
			--changeSetting("Box", "Drop TimeOut", 5, true)
		--end
		
		
		if _G.drops and os.time() > (_G.LastDrop + tonumber(_G["Drop Delay"])) and not library.Variables.LoadingWorld then		
			--_G.DropCoolOff = os.time() + _G.DropDelay			
			--_G.CollectingDrops = true
			--spawn(function()
				_G.DropCoolOff = os.time() + tonumber(_G["Drop TimeOut"] + _G.TeleportDelay)
				_G.LastDrop = os.time() + _G.DropCoolOff
				LogMe("Starting Drops")
				local objectname = ""
				local baddrops = {}
				local pickupTotals = {}
					
					
				while _G.drops and (os.time() < _G.DropCoolOff) do
					--local playerLibrary = library.Save.Get()
					--_G.playerCoins = playerLibrary["Coins"]
					
					local sendbreak = false
				
					local closest = nil
					local dis = math.huge
					local dropcurrency = nil
					local dropname = nil
					
					local pickupsLib = library.Network.Invoke("Get Pickups")
					local pickupcount = 0
					local dropfound = false
					
					--if _G.forcedrops then
						for x,y in pairs(game.Workspace.Stuff.Pickups:GetChildren()) do
							if y ~= nil and pickupsLib[y.Name] ~= nil then
								local droparea = tostring(pickupsLib[y.Name].a)
								if pickupsLib[y.Name].a == "Main" then
									droparea = tostring(pickupsLib[y.Name].w .. " " .. pickupsLib[y.Name].a)
								end	
								for a,b in pairs(areas) do
									if playerLibrary.World == a then
									--print(a,b)
										for c,d in pairs(b) do
										--print(c)
										--print(c,d)
											for e,f in pairs(currency) do
												--if e == _G.lastBestCurrency then
													for g,h in pairs(f) do
														
														if d == "VIP" and VIP then
															if _G[e] and y:FindFirstChild(h) and _G[a] then dropfound = true sendbreak = true break end --  
														elseif d ~= "VIP" and d == "Main" then
															if _G[e] and y:FindFirstChild(h) and _G[a .. " " .. d] then dropfound = true sendbreak = true break end -- 
														elseif d ~= "VIP" and d ~= "Main" then
															if _G[e] and y:FindFirstChild(h) and _G[d] then dropfound = true sendbreak = true break end --  
														end	
													end
													if sendbreak then
														break
													end
												--end
											end
											if sendbreak then
												break
											end
										end
										if sendbreak then
											break
										end
									end
								end
							end
						end
						
						--print("drop found", dropfound)
						
						if not dropfound then --or (playerLibrary.World == "Spawn World" and _G.lastBestCurrency == "Pearls" and _G["Pearls"])  then
							local newWorld = nil
							for a,b in pairs(areas) do
								if a ~= playerLibrary.World then
									for c,d in pairs(b) do
										for e,f in pairs(currency) do
											for g,h in pairs(f) do
												sendbreak = false
												if d == "VIP" and VIP then
													if _G[d] then newWorld = a sendbreak = true break end
												elseif d ~= "VIP" and d == "Main" then
													if _G[a .. " " .. d] then newWorld = a sendbreak = true break end
												elseif d ~= "VIP" and d ~= "Main" then
													if _G[d] then newWorld = a sendbreak = true break end
												end
												if sendbreak then
													break
												end
											end
											if sendbreak then
												break
											end
										end
										if sendbreak then
											break
										end
									end
									if sendbreak then
										break
									end
								end
							end
							if newWorld ~= nil then
								print("newworld", newWorld)
								changeWorld(playerLibrary.World, newWorld)
							end
						end
					--end
					
					if dropfound then
						sendbreak = false
						pickupsLib = library.Network.Invoke("Get Pickups")
						
						for i , v in ipairs(game.Workspace.Stuff.Pickups:GetChildren()) do
							if v ~= nil and pickupsLib[v.Name] ~= nil then
								local droparea = pickupsLib[v.Name].a
								if pickupsLib[v.Name].a == "Main" then
									droparea = pickupsLib[v.Name].w .. " " .. pickupsLib[v.Name].a
								end
								if v ~= nil and pickupsLib[v.Name] ~= nil and pickupsLib[v.Name].w == playerLibrary.World and _G[droparea] then
									local isbaddrop = false
									for index, baddrop in pairs(baddrops) do
										if baddrop == v.Name then
											isbaddrop = true
											--LogMe(baddrop .. " is bad")
										end
									end
									--print(pickupsLib[v.Name].w)
									if not isbaddrop and pickupsLib[v.Name] and _G[droparea] then
										pickupcount++
										for a,b in pairs(currency) do
											if _G[a] and tonumber(_G.droprange) ~= nil then
												for x,y in pairs(b) do
													if v ~= nil and v.Name ~= objectname and v:FindFirstChild('POS') and v:FindFirstChild(y) and v[y]:FindFirstChild("TouchInterest") and (GetPlayerRoot().Position-v.POS.Position).magnitude <= tonumber(_G.droprange) and (GetPlayerRoot().Position-v.POS.Position).magnitude < dis then --and farm.flags.Drops == true  and _G.sell ~= true then
														--root.CFrame = CFrame.new(root.CFrame.X,v.CFrame.Y,root.CFrame.Z)
														
														
														--if not baddrop then
															closest = v.POS
															dis = (GetPlayerRoot().Position-v.POS.Position).magnitude
															dropcurrency = a
															dropname = v.Name
														--end
														--print("closest " .. v.Name .. " " .. y)
													end
												end
											end
										end
									else
										--break
									end
								--elseif v ~= nil and pickupsLib[v.Name] ~= nil and pickupsLib[v.Name].w ~= playerLibrary.World then
									--print("break1")
									--sendbreak = true
									--break
								elseif v ~= nil and pickupsLib[v.Name] ~= nil and pickupsLib[v.Name].w ~= playerLibrary.World then
									--print("break2")
									--break
								end
							end
						end
						
						if sendbreak then
							_G.DropCoolOff = os.time()
							_G.LastDrop = os.time()
							objectname = ""
							break
						end
						
						--print(pickupcount)	
						if closest ~= nil and (target == nil or target.Parent == nil) then
						
							closest.Parent.Parent.ChildRemoved:connect(function(object) --_G.Pickups[v.Name] = false 
																	objectname = object.name
																end)
							local dis = closest.CFrame.Y - GetPlayerRoot().CFrame.Y
							--if dis > 250 then
								--G.player.Character:SetPrimaryPartCFrame(CFrame.new(closest.Position.X+1, closest.Position.Y+3, closest.Position.Z+1))
							--end
							local dropStart = os.time()
							local oldamount = playerLibrary[dropcurrency]
							_G.statchanged = {[dropcurrency] = false}
							repeat
								if dis < (closest.Size.Y * -1) or dis > closest.Size.Y then
									GetPlayerRoot().CFrame = CFrame.new(GetPlayerRoot().CFrame.X,closest.CFrame.Y + 2,GetPlayerRoot().CFrame.Z)
								end
								toTarget(GetPlayerRoot().Position,closest.Position + Vector3.new(0,2,0),closest.CFrame + Vector3.new(0,2,0))
								--LogMe("Picking up " .. dropname)
								wait(.1)
							until (dropcurrency == "XP" and wait(.5)) or (_G.statchanged[dropcurrency] or os.time() > dropStart + math.random(_G.droptimeout, _G.droptimeout * 2))

							if dropcurrency == "XP" then
								--LogMe("Moving to next " .. dropcurrency)
								if pickupTotals[dropcurrency] == nil then
									pickupTotals[dropcurrency] = 1
								else
									pickupTotals[dropcurrency] = pickupTotals[dropcurrency] + 1
								end
								table.insert(baddrops, dropname)
							elseif _G.statchanged[dropcurrency] then
								if pickupTotals[dropcurrency] == nil then
									pickupTotals[dropcurrency] = playerLibrary[dropcurrency] - oldamount
								else
									pickupTotals[dropcurrency] = pickupTotals[dropcurrency] + (playerLibrary[dropcurrency] - oldamount)
								end
								table.insert(baddrops, dropname)
							else
								--LogMe("Could not pickup " .. dropcurrency)
								table.insert(baddrops, dropname)
							end
						elseif pickupcount == 0 then
							LogMe("No Valid Drops")
							_G.DropCoolOff = os.time()
							_G.LastDrop = os.time()
							objectname = ""					
						end
					end
				end
				--LogMe("Ending Drops")
				for a,b in pairs(pickupTotals) do
					local message = "Picked up " .. library.Functions.NumberShorten(b) .. " " .. a
					if a == "XP" then 
						message = message .. " Orbs"
					end
					LogMe(message)
				end
				_G.LastDrop = os.time()
				objectname = ""
				
			wait(_G.TeleportDelay)
			--end)
			--_G.CollectingDrops = false
			--end
		end
		
		doSellBubbles()
		
		while library.Variables.LoadingWorld and wait(1) do
			LogMe("Waiting on world to load")
		end
		
		
		local otherworldchest = nil
			
		for a,b in pairs(library.Directory.Chests) do
			if a == "VIP Chest" and not VIP then
			
			elseif _G[a] and b.world ~= playerLibrary.World and (not _G.chesttimers[a] or _G.chesttimers[a] < _G.chestwait) then
				otherworldchest = b.world
			end
		end
		

		
		if otherworldchest ~= nil then
		
			local otherworldfound = false
			
			if otherworldchest == "Spawn World" then
				otherworldfound = true
			end
			
			
			for a,b in pairs(playerLibrary.Worlds) do
				if b == otherworldchest then
					otherworldfound = true
				end
			end
			
			

			if otherworldfound then
					changeWorld(playerLibrary.World, otherworldchest)
						
					CollectChests()
					wait(1)
					if otherworldchest == "Spawn World" then
						doGroupRewards()
						wait(1)
					end
					
				
					changeWorld(otherworldchest, playerLibrary.World)
			end

		end
			
			

		



	end	
		
	end
end)

--[[
spawn(function()
	while wait(5) do
		if _G["StPattysWheel"] then

			local ohTable1 = {
				[1] = {
					[1] = false
				},
				[2] = {
					[1] = 2
				}
			}

			game:GetService("ReplicatedStorage").Remotes["buy event wheel spin"]:InvokeServer(ohTable1)
		end
	end
end)
]]--
	
spawn(function()
	while wait(60) do
		if not library.Variables.LoadingWorld then
			doFairyExchange()
			doReaperExchange()
			doTierRewards()
			doBubblePass()
			doChallenge()
			SpinPrizeWheel()
			--FreeEventWheel() 
			doMerchant()
			doDailyShop()
			
			local playerLibrary = library.Save.Get()
			local newworld = nil
			
					
			for a,b in pairs(library.Directory.Worlds) do
				if a ~= "Spawn World" and a ~= "Easter Island" then
					local worldfound = false
					for c,d in pairs(playerLibrary.Worlds) do
						if d == a then
							worldfound = true
						end
					end
					
					if not worldfound then
						newworld = a
						LogMe("Found New World " .. a)
					end
				end
			end
			
			if newworld ~= nil then
				changeWorld("Spawn World", newworld)
			end
			
			--local playerLibrary = library.Save.Get()

			for a,b in pairs(library.Directory.Chests) do
				--if b.world ~= playerLibrary.World and 
				if _G.chesttimers[a] then
					LogMe(a .. " Timer: " .. _G.chesttimers[a])
				end
			end
		end
	end
end)

spawn(function()
	while wait(5) do
		if not library.Variables.LoadingWorld then
			EquipBestPets()
		end
	end
end)

--[[
local ClickButton = function(button)
	
	mousemoveabs(button.AbsolutePosition.X, button.AbsolutePosition.Y)
	wait(.1)
	mouse1click()

end

_G.ImportantWindows = library.Variables.ImportantWindows
library.Variables.ImportantWindows = {}

local MessageWindows = {["NewItemWindow"] = {["GUI"] = GetLocalPlayer().PlayerGui:FindFirstChild("New Item"), ["Messages"] = {"None"}},
						["MessageWindow"] = {["GUI"] = GetLocalPlayer().PlayerGui:FindFirstChild("Message"), ["Messages"] = {" to buy this"}},
						["BuyWorldWindow"] = {["GUI"] = GetLocalPlayer().PlayerGui:FindFirstChild("Buy World"), ["Messages"] = {" to buy this."}}}
						
for name, values in pairs(MessageWindows) do
	
	for i, message in pairs(values.Messages) do
		--print(message)
		values.GUI:GetPropertyChangedSignal("Enabled"):Connect(function()
																if values.GUI.Enabled == true and ((values.GUI.Frame:FindFirstChild("Desc") ~= nil and string.find(values.GUI.Frame.Desc.Text, message)) or message == "None") then
																	LogMe("Closing " .. values.GUI.Name .. " Window")
																	--library.Variables.ImportantWindows = {}
																	values.GUI.Enabled = false
																end
															end)
	end
end


local MessageWindow = game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("Message")
MessageWindow:GetPropertyChangedSignal("Enabled"):Connect(function()
																local closeWindow
																if MessageWindow.Enabled and not string.find(MessageWindow.Frame.Desc.Text, "Delete this team?") then
																	print("Message Window Enabled")
																	for i, connection in pairs(getconnections(MessageWindow.Frame.Ok.MouseButton1Click)) do
																		closeWindow = connection.Function
																	end
																	--repeat
																		print("Closing Message Window")
																		if closeWindow ~= nil then
																			closeWindow()
																		end
																	--until not MessageWindow.Enabled
																else
																	print("Message Window Disabled")
																end
															end)
--]]

local NewItemWindow = game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("New Item")
NewItemWindow:GetPropertyChangedSignal("Enabled"):Connect(function()
																local closeWindow
																if NewItemWindow.Enabled then
																	LogMe("New Item Window Enabled")
																	for i, connection in pairs(getconnections(NewItemWindow.Frame.Claim.Activated)) do
																		closeWindow = connection.Function
																	end
																	--repeat
																		print("Closing New Item Window")
																		closeWindow()
																		updateBoosts()
																	--until not MessageWindow.Enabled
																else
																	LogMe("New Item Window Disabled")
																end
															end)	


spawn(function()
	while wait(.5) do
		local library = require(game.ReplicatedStorage:WaitForChild("Nevermore"):WaitForChild("Library"))
		local MessageWindow = game:GetService("Players").LocalPlayer.PlayerGui.Message
																		local closeWindow
																		if MessageWindow.Enabled and not string.find(MessageWindow.Frame.Desc.Text, "Delete this team?") then
																			--library.Signal.Fire("Window Opened", MessageWindow)
																			LogMe("Message Window Popup")
																			for i, connection in pairs(getconnections(MessageWindow.Frame.Ok.MouseButton1Click)) do
																				closeWindow = connection.Function
																			end
																			--repeat
																				if closeWindow ~= nil then
																					LogMe("Closing Message Window")
																					closeWindow()
																					_G.nomoney = true
																				else
																					LogMe("Couldn't Close Message Window")
																				end
																		end
																			--until not MessageWindow.Enabled
																			--library.Signal.Fire("Window Closed", MessageWindow)
																			--return
																		--else --if MessageWindow.Enabled then
																			--library.Signal.Fire("Window Opened", MessageWindow)
																			--return
																		--end
																		--library.Signal.Fire("Window Closed", MessageWindow)
																	
		

	end
end)

--[[
spawn(function()

function DecodePacket(p9)
	local v38 = {};
	local v39 = p9[1];
	local v40 = 0;
	local v41, v42, v43 = pairs(p9[2]);
	while true do
		local v44, v45 = v41(v42, v43);
		if v44 then

		else
			break;
		end;
		v43 = v44;
		local v46 = v39[v44];
		if v45 then
			if v45 ~= 2 then
				local u5 = nil;
				if pcall(function()
					u5 = library.Functions.Compress.Decode(v46);
				end) then
					if u5 then
						if v45 == 1 then
							u5 = library.Services.HttpService:JSONDecode(u5);
						end;
						v38[v44] = u5;
					else
						u1.Print("Failed to decode packet argument [bold](" .. v46 .. ")[/bold]", true);
					end;
				else
					u1.Print("Failed to decode packet argument [bold](" .. v46 .. ")[/bold]", true);
				end;
			else
				v38[v44] = nil;
			end;
		else
			v38[v44] = v46;
		end;
		v40 = v44;	
	end;
	return unpack(v38, 1, v40);
end;


local sharedModules = game:GetService("ReplicatedStorage").Nevermore["Shared Modules"]
local netremotes = nil

local counter = 0
for a,b in pairs(sharedModules:GetChildren()) do

	if b:FindFirstChild("msg") then
		netremotes = b
	end
	
	for c,d in pairs(b:GetChildren()) do
		--print(d)
		counter++
	end
	if counter > 100 then
		remotes = b
		counter = 0
	end
	
end

local oldMessage = nil
local oldCon = nil
for i, connection in pairs(getconnections(netremotes["msg"].Event)) do 
	oldMessage = connection.Function
	oldCon = connection
end
oldCon:Disable()

local newMessage = function(...)
					local v16 = { "msg", ... };
					print(v16)
					local v22, v23 = unpack(v16);
					print(v22, v23)
					--print(v22);
					_G.ohString1, _G.ohTable2 = DecodePacket(v23)
					print(_G.ohString1)
					if not _G.ohString1:find("to buy this egg") and not _G.ohString1:find("to buy this Egg") then
						oldMessage(_G.ohString1)
					else
						_G.nomoney = true
					end
					--
end
local messageremote = game:GetService("ReplicatedStorage").Remotes:FindFirstChild("msg")
repeat
	wait(1)
	messageremote = game:GetService("ReplicatedStorage").Remotes:FindFirstChild("msg")
until messageremote ~= nil
messageremote.OnClientEvent:Connect(newMessage)
print("Done")

end)
--]]
														
--[[
spawn(function()
	while wait(1) do
		if not library.Variables.LoadingWorld then
			local NewItemWindow = game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("New Item")
			local MessageWindow = game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("Message")
			
			--while wait(1) and not NewItemWindow.Enabled do
				--print(NewItemWindow.Enabled)
			--end
			local closeWindow = nil
			if NewItemWindow.Enabled then
				for i, connection in pairs(getconnections(NewItemWindow.Frame.Claim.Activated)) do
					closeWindow = connection.Function
				end
				updateBoosts()
				LogMe("Closing New Item Window")
			elseif MessageWindow.Enabled then
				if MessageWindow.Frame.Desc.Text:find("to buy this Egg") then
					LogMe("Not Enough to buy egg")
					_G.nomoney = true
					--_G.eggopened = false
					--_G.LastEgg = 0
					--if _G.drops and _G.forcedrops then
						--if _G["Drop Delay"] ~= 0 then
							--_G["Old Drop Delay"] = _G["Drop Delay"]
							--changeSetting("Box", "Drop Delay", 0, true)
						--end
					--end
				end
				for i, connection in pairs(getconnections(MessageWindow.Frame.Ok.MouseButton1Click)) do
					closeWindow = connection.Function
				end
				--LogMe("Closing Message Window")			
			end
			if closeWindow ~= nil then
				closeWindow()
			end
		end
	end
end)
]]--



local UsePotions = function()

	if boosts.flags["Max Pet Level Use"] or boosts.flags["1 Pet Level Use"] or boosts.flags["Power 1 Use"] or boosts.flags["Power 2 Use"] then
	
		local library = require(game.ReplicatedStorage:WaitForChild("Nevermore"):WaitForChild("Library"))
						
		local playerLibrary = library.Save.Get()
		
		local petsTable = {}


		for x,y in pairs(playerLibrary.Pets) do

			local highestuid = 0
			local highestbubbles = 0
			local highestcoins = 0
			local highestdiamonds = 0
				
			for a,b in pairs(playerLibrary.Pets) do
				
					local petFound = false
					for i,v in pairs(petsTable) do
						--print(b.uid,v)
						if b.uid == v then
							petFound = true
							--print("Pet Found")
						end
					end
						--print(lowestbubbles,library.Directory.Pets[b.id].buffs.Bubbles)
						--print(lowestcoins,library.Directory.Pets[b.id].buffs.Coins)
						--print(lowestdiamonds,library.Directory.Pets[b.id].buffs.Diamonds)
					
					local petBubbles = 0
					local petCoins = 0
					local petDiamonds = 0
					
					if b.s then
						petBubbles = library.Directory.Pets[b.id].buffs.Bubbles * 2
						petCoins = library.Directory.Pets[b.id].buffs.Coins * 2
						petDiamonds = library.Directory.Pets[b.id].buffs.Diamonds * 2
					else
						petBubbles = library.Directory.Pets[b.id].buffs.Bubbles
						petCoins = library.Directory.Pets[b.id].buffs.Coins
						petDiamonds = library.Directory.Pets[b.id].buffs.Diamonds
					end
					
				
					if not petFound and (petBubbles > highestbubbles or 
										 petCoins > highestcoins or 
										 petDiamonds > highestdiamonds) then
						highestuid = b.uid
						highestbubbles = petBubbles
						highestcoins = petCoins
						highestdiamonds = petDiamonds
					end
			end

			table.insert(petsTable,highestuid)
		end
		
		for x,y in pairs(petsTable) do
			local petIndex = nil
				
			for a,b in pairs(playerLibrary.Pets) do
				if b.uid == y then
					petIndex = a
				end
			end
			
			local sendbreak = false
			
			if petIndex ~= nil then	
				
				if boosts.flags["1 Pet Level Use"] then
					for idx,potions in pairs(playerLibrary.Potions) do
						if potions.name == "1 Pet Level" and playerLibrary.Pets[petIndex].lvl < 25 then
							LogMe("Attempting to use 1 Pet Level on " .. playerLibrary.Pets[petIndex].nk)
							local ohTable1 = {
								[1] = {
									[1] = potions.name,
									[2] = playerLibrary.Pets[petIndex].uid
								},
								[2] = {
									[1] = false,
									[2] = false
								}
							}

							game:GetService("ReplicatedStorage").Remotes["use potion"]:FireServer(ohTable1)
							wait(1)
							sendbreak = true
							break
						end
					end
				end
				
				if sendbreak then
					break
				elseif boosts.flags["Max Pet Level Use"] then
					for idx,potions in pairs(playerLibrary.Potions) do
						if potions.name == "Max Pet Level" and playerLibrary.Pets[petIndex].lvl < 25 then
							LogMe("Attempting to use Max Pet Level on " .. playerLibrary.Pets[petIndex].nk)
							local ohTable1 = {
								[1] = {
									[1] = potions.name,
									[2] = playerLibrary.Pets[petIndex].uid
								},
								[2] = {
									[1] = false,
									[2] = false
								}
							}

							game:GetService("ReplicatedStorage").Remotes["use potion"]:FireServer(ohTable1)
							wait(1)
							sendbreak = true
							break
						end
					end
				end
				
				if sendbreak then
					break
				elseif boosts.flags["Power 1 Use"] then
					for idx,potions in pairs(playerLibrary.Potions) do
						if potions.name == "Power 1" and playerLibrary.Pets[petIndex].power == nil then
							LogMe("Attempting to use Power 1 on " .. playerLibrary.Pets[petIndex].nk)
							local ohTable1 = {
								[1] = {
									[1] = potions.name,
									[2] = playerLibrary.Pets[petIndex].uid
								},
								[2] = {
									[1] = false,
									[2] = false
								}
							}
								game:GetService("ReplicatedStorage").Remotes["use potion"]:FireServer(ohTable1)
							wait(1)
							sendbreak = true
							break
						end
					end
				end
				
				if sendbreak then
					break
				elseif boosts.flags["Power 2 Use"] then
					for idx,potions in pairs(playerLibrary.Potions) do
						if potions.name == "Power 2" and (playerLibrary.Pets[petIndex].power == nil or playerLibrary.Pets[petIndex].power == "Power 1") then
							LogMe("Attempting to use Power 2 on " .. playerLibrary.Pets[petIndex].nk)
							local ohTable1 = {
								[1] = {
									[1] = potions.name,
									[2] = playerLibrary.Pets[petIndex].uid
								},
								[2] = {
									[1] = false,
									[2] = false
								}
							}

							game:GetService("ReplicatedStorage").Remotes["use potion"]:FireServer(ohTable1)
							wait(1)
							sendbreak = true
							break
						end
					end
				end
				
				if sendbreak then break end
			end
		end
	end
end


local GetEasterEgg = function(egg)		
	--for x = 1, num do
	local eggfound = false
		for a,b in pairs(game:GetService("Workspace").Stuff.Eggs:GetChildren()) do
			if b:FindFirstChild(egg) then
			
				local starttime = os.time()
				repeat
					if game:GetService("Workspace").Stuff.Eggs:FindFirstChild(b.name) ~= nil and b ~= nil and b:FindFirstChild("POS") ~= nil then
						toTarget(GetPlayerRoot().Position,b.POS.Position,b.POS.CFrame)
						wait()

						local ohTable1 = {
							[1] = {
								[1] = b.Name
							},
							[2] = {
								[1] = false
							}
						}

						game:GetService("ReplicatedStorage").Remotes["collect egg"]:FireServer(ohTable1)
					end
					wait(.5)
				until game:GetService("Workspace").Stuff.Eggs:FindFirstChild(b.name) == nil or b:FindFirstChild("POS") == nil or b == nil or library.LocalPlayer.Character:FindFirstChild("__EGG") or os.time() > starttime + 5
				wait(1)
				if library.LocalPlayer.Character:FindFirstChild("__EGG") and GetPlayerRoot() ~= nil then
					local sellarea = game:GetService("Workspace").MAP.Activations["Bunny"]
					GetPlayerChar():SetPrimaryPartCFrame(CFrame.new(sellarea.Position.X+10, sellarea.Position.Y + 2, sellarea.Position.Z+8))
					wait(.5)
					toTarget(GetPlayerRoot().Position,sellarea.Position + Vector3.new(0,2,0),sellarea.CFrame + Vector3.new(0,0,0))
					
					eggfound = true
					break
				end
			
				--[[
				toTarget(GetPlayerRoot().Position,b.POS.Position,b.POS.CFrame)
				wait(5)

				local ohTable1 = {
					[1] = {
						[1] = b.Name
					},
					[2] = {
						[1] = false
					}
				}

				game:GetService("ReplicatedStorage").Remotes["collect egg"]:FireServer(ohTable1)
				wait(1)
				if library.LocalPlayer.Character:FindFirstChild("__EGG") then
					local sellarea = game:GetService("Workspace").MAP.Activations["Bunny"]
					GetPlayerChar():SetPrimaryPartCFrame(CFrame.new(sellarea.Position.X+10, sellarea.Position.Y + 2, sellarea.Position.Z+8))
					wait(.5)
					toTarget(GetPlayerRoot().Position,sellarea.Position + Vector3.new(0,2,0),sellarea.CFrame + Vector3.new(0,0,0))
					
					--eggfound = true
					break
				end
				]]--
			end
		end
		
		
		if not eggfound and _G.CollectCommon then
		
			for a,b in pairs(game:GetService("Workspace").Stuff.Eggs:GetChildren()) do
				if b:FindFirstChild("Common Egg") then
				
					local starttime = os.time()
					repeat
						if game:GetService("Workspace").Stuff.Eggs:FindFirstChild(b.name) ~= nil and b ~= nil and b:FindFirstChild("POS") ~= nil then
							toTarget(GetPlayerRoot().Position,b.POS.Position,b.POS.CFrame)
							wait()

							local ohTable1 = {
								[1] = {
									[1] = b.Name
								},
								[2] = {
									[1] = false
								}
							}

							game:GetService("ReplicatedStorage").Remotes["collect egg"]:FireServer(ohTable1)
						end
						wait(.5)
					until game:GetService("Workspace").Stuff.Eggs:FindFirstChild(b.name) == nil or b:FindFirstChild("POS") == nil or b == nil or library.LocalPlayer.Character:FindFirstChild("__EGG") or os.time() > starttime + 5
					wait(1)
					if library.LocalPlayer.Character:FindFirstChild("__EGG") and GetPlayerRoot() ~= nil then
						local sellarea = game:GetService("Workspace").MAP.Activations["Bunny"]
						GetPlayerChar():SetPrimaryPartCFrame(CFrame.new(sellarea.Position.X+10, sellarea.Position.Y + 2, sellarea.Position.Z+8))
						wait(.5)
						toTarget(GetPlayerRoot().Position,sellarea.Position + Vector3.new(0,2,0),sellarea.CFrame + Vector3.new(0,0,0))
						
						eggfound = true
						break
					end
				
				
					--[[
				
					toTarget(GetPlayerRoot().Position,b.POS.Position,b.POS.CFrame)
					wait(3)

					local ohTable1 = {
						[1] = {
							[1] = b.Name
						},
						[2] = {
							[1] = false
						}
					}

					game:GetService("ReplicatedStorage").Remotes["collect egg"]:FireServer(ohTable1)
					wait(.5)
					local sellarea = game:GetService("Workspace").MAP.Activations["Bunny"]
					GetPlayerChar():SetPrimaryPartCFrame(CFrame.new(sellarea.Position.X+10, sellarea.Position.Y + 2, sellarea.Position.Z+8))
					wait(.5)
					toTarget(GetPlayerRoot().Position,sellarea.Position + Vector3.new(0,2,0),sellarea.CFrame + Vector3.new(0,0,0))
					eggfound = true
					break
					
					]]--
					
				end
			end

		end
		
		
		wait(1)
	--end

end

local ClaimPrize = function()

local ohTable1 = {
						[1] = {
							[1] = false
						},
						[2] = {
							[1] = 2
						}
					}

					game:GetService("ReplicatedStorage").Remotes["claim easter prize"]:FireServer(ohTable1)

end

spawn(function()
	while wait(5) do

		if _G.EasterQuests then
			local library = require(game:GetService("ReplicatedStorage").Nevermore.Library)

			local playerLibrary = library.Save.Get()

					if playerLibrary["Easter"] ~= nil and playerLibrary["Easter"].Claimed ~= nil then
						local lastPrize = 0

						for a,b in pairs(library.Directory["EasterQuests"]) do
							if a > lastPrize then
								lastPrize = a
							end
							
							if a == (playerLibrary["Easter"].Claimed + 1) and string.find(b.challengeType, "Egg") and string.find(b.title, "Return") and (playerLibrary["Easter"].Progress.EggCount[b.challengeType] == nil or playerLibrary["Easter"].Progress.EggCount[b.challengeType] < b.amount) then
								changeWorld("Spawn World", "Easter Island")
										
								if playerLibrary["Easter"].Progress.EggCount[b.challengeType] == nil then
									print((b.amount - 0) .. " " .. b.challengeType .. " remaining to claim Easter " .. a)
								else
									print((b.amount - playerLibrary["Easter"].Progress.EggCount[b.challengeType]) .. " " .. b.challengeType .. " remaining to claim Easter " .. a)
								end
								local eggfound = false
								changeWorld("Spawn World", "Easter Island")
								for c,d in pairs(game:GetService("Workspace").Stuff.Eggs:GetChildren()) do
									if d:FindFirstChild(b.challengeType) then
										changeSetting("Selection", "Buy Mode", "None", true)
										changeSetting("Checkmark", "Kick on Zero Eggs", disabled, true)
										GetEasterEgg(b.challengeType)
										eggfound = true
									end
									
								end
								if not eggfound and not _G.CollectCommon then
									
										if _G.oldeggs["Buy Mode"] == nil then
											local oldeggs = switchEggs({["Buy Mode"] = "Best", ["Eggs"] = {"Bunny Egg", "Common Egg"}}, {}, true)
											LogMe("return old eggs", oldeggs["Buy Mode"], oldeggs["Eggs"][1])
											_G.oldeggs = oldeggs
										else
											LogMe("Chal" .. _G.oldeggs["Buy Mode"])
											for a,b in pairs(_G.oldeggs["Eggs"]) do
												LogMe(b)
											end
											local oldeggs = switchEggs({["Buy Mode"] = "Best", ["Eggs"] = {"Bunny Egg", "Common Egg"}}, _G.oldeggs, false)
											--_G.oldeggs = oldeggs
										end
								else
								
									changeSetting("Selection", "Buy Mode", "None", true)
									changeSetting("Checkmark", "Kick on Zero Eggs", disabled, true)
									GetEasterEgg(b.challengeType)
										
								
								end
							elseif a == (playerLibrary["Easter"].Claimed + 1) and string.find(b.challengeType, "Egg") and string.find(b.title, "Return") and playerLibrary["Easter"].Progress.EggCount[b.challengeType] >= b.amount then
								print("Claiming Easter Prize " .. a)
								ClaimPrize()
							elseif a == (playerLibrary["Easter"].Claimed + 1) and string.find(b.challengeType, "Key") then
								changeWorld("Spawn World", "Easter Island")
										
								changeSetting("Selection", "Buy Mode", "None", true)
								changeSetting("Checkmark", "Kick on Zero Eggs", disabled, true)
								changeWorld("Spawn World", "Easter Island")
								
								toTarget(GetPlayerRoot().Position,game:GetService("Workspace").MAP.KEY.Position,game:GetService("Workspace").MAP.KEY.CFrame)
								wait(.5)
								local ohTable1 = {
									[1] = {
										[1] = false
									},
									[2] = {
										[1] = 2
									}
								}

								game:GetService("ReplicatedStorage").Remotes["take key"]:FireServer(ohTable1)
								wait(1)
								local sellarea = game:GetService("Workspace").MAP.Activations["Bunny"]
								local playerroot = GetPlayerRoot()
								GetPlayerChar():SetPrimaryPartCFrame(CFrame.new(sellarea.Position.X+10, sellarea.Position.Y + 2, sellarea.Position.Z+8))
								wait(.5)
								toTarget(GetPlayerRoot().Position,sellarea.Position + Vector3.new(0,2,0),sellarea.CFrame + Vector3.new(0,0,0))
								wait(1)
								ClaimPrize()
							elseif a == (playerLibrary["Easter"].Claimed + 1) and string.find(b.challengeType, "Castle") then
								changeWorld("Spawn World", "Easter Island")
										
								changeSetting("Selection", "Buy Mode", "None", true)
								changeSetting("Checkmark", "Kick on Zero Eggs", disabled, true)
								changeWorld("Spawn World", "Easter Island")
								
								toTarget(GetPlayerRoot().Position,game:GetService("Workspace").MAP.Models["Wizard Tower"].Blocked.DOOR.Main.Position,game:GetService("Workspace").MAP.Models["Wizard Tower"].Blocked.DOOR.Main.CFrame)
								wait(.5)
								game:GetService("Workspace").MAP.Models["Wizard Tower"].Blocked.DOOR.Main.Activated:Fire()
								wait(1)
								local sellarea = game:GetService("Workspace").MAP.Activations["Bunny"]
								local playerroot = GetPlayerRoot()
								GetPlayerChar():SetPrimaryPartCFrame(CFrame.new(sellarea.Position.X+10, sellarea.Position.Y + 2, sellarea.Position.Z+8))
								wait(.5)
								toTarget(GetPlayerRoot().Position,sellarea.Position + Vector3.new(0,2,0),sellarea.CFrame + Vector3.new(0,0,0))
								wait(1)
								ClaimPrize()
							elseif a == (playerLibrary["Easter"].Claimed + 1) and string.find(b.challengeType, "Shard") and playerLibrary["Easter"].Progress.Shards < b.amount then
								changeWorld("Spawn World", "Easter Island")
										
								changeSetting("Selection", "Buy Mode", "None", true)
								changeSetting("Checkmark", "Kick on Zero Eggs", disabled, true)
								changeWorld("Spawn World", "Easter Island")
								if playerLibrary["Easter"].Progress.Shards ~= nil then
									print((b.amount - playerLibrary["Easter"].Progress.Shards) .. " Shards remaining to claim Easter " .. a)
								end
								
								for a,b in pairs(game:GetService("Workspace").MAP.Shards:GetChildren()) do
									for c,d in pairs(b:GetChildren()) do
										if game:GetService("Workspace").MAP.Shards:FindFirstChild(b.Name) ~= nil and b ~= nil and b:FindFirstChild(d.Name) ~= nil and d ~= nil and d:FindFirstChild("Activated") then
										local starttime = os.time()
											repeat
												if game:GetService("Workspace").MAP.Shards:FindFirstChild(b.Name) ~= nil and b ~= nil and b:FindFirstChild(d.Name) ~= nil and d ~= nil and d:FindFirstChild("Activated") then
													toTarget(GetPlayerRoot().Position,b.PrimaryPart.Position,b.PrimaryPart.CFrame)
													wait()
													if d ~= nil and d:FindFirstChild("Activated") ~= nil then
														d.Activated:Fire()
														--library.Network.Fire("Take Shard", b)
													end
													wait()
												end
											until game:GetService("Workspace").MAP.Shards:FindFirstChild(b.Name) == nil or b == nil or b:FindFirstChild(d.Name) == nil or d == nil or d:FindFirstChild("Activated") == nil or os.time() > starttime + 5
											wait(1)
											break
										end
									end
									break
								end
								ClaimPrize()
							elseif a == (playerLibrary["Easter"].Claimed + 1) and string.find(b.challengeType, "Shard") and playerLibrary["Easter"].Progress.Shards >= b.amount then
								ClaimPrize()
							elseif a == (playerLibrary["Easter"].Claimed + 1) and (b.challengeType == "EpicPets" or b.challengeType == "LegendaryPets" or b.challengeType == "Eggs") and playerLibrary["Easter"].Progress[b.challengeType] < b.amount then
								changeWorld("Spawn World", "Easter Island")
										
								if playerLibrary["Easter"].Progress[b.challengeType] ~= nil then
									print((b.amount - playerLibrary["Easter"].Progress[b.challengeType]) .. " " .. b.challengeType .. " remaining to claim Easter " .. a)
								end
								if _G.oldeggs["Buy Mode"] == nil then
									local oldeggs = switchEggs({["Buy Mode"] = "Best", ["Eggs"] = {"Bunny Egg", "Common Egg"}}, {}, true)
									LogMe("return old eggs", oldeggs["Buy Mode"], oldeggs["Eggs"][1])
									_G.oldeggs = oldeggs
								else
									LogMe("Chal" .. _G.oldeggs["Buy Mode"])
									for a,b in pairs(_G.oldeggs["Eggs"]) do
										LogMe(b)
									end
									local oldeggs = switchEggs({["Buy Mode"] = "Best", ["Eggs"] = {"Bunny Egg", "Common Egg"}}, _G.oldeggs, false)
									--_G.oldeggs = oldeggs
								end
							elseif a == (playerLibrary["Easter"].Claimed + 1) and (b.challengeType == "EpicPets" or b.challengeType == "LegendaryPets" or b.challengeType == "Eggs") and playerLibrary["Easter"].Progress[b.challengeType] >= b.amount then
								ClaimPrize()
							elseif a == (playerLibrary["Easter"].Claimed + 1) and b.challengeType == "EggsFound" then
								changeWorld("Spawn World", "Easter Island")
										
								for a,b in pairs(library.Directory.EasterEggs) do
									if playerLibrary["Easter"].Progress.EggCount[a] == nil then
										for c,d in pairs(game:GetService("Workspace").Stuff.Eggs:GetChildren()) do
											if d:FindFirstChild(a) then
												eggfound = true
											end
										end
										if eggfound then	
										
											changeSetting("Selection", "Buy Mode", "None", true)
											changeSetting("Checkmark", "Kick on Zero Eggs", disabled, true)
											GetEasterEgg(a)
											changeSetting("Selection", "Buy Mode", "Best", true)
						
								
										end
									end
								end
								wait(1)
								ClaimPrize()
							end
							
						end
					end
		end
	end				
end)


spawn(function()
	while wait(15) do
		if not library.Variables.LoadingWorld then

			DeletePets()

			ShinyPets()
			
			UsePotions()
		end
	end
end)


						function sma(period)
							local t = {}
							function sum(a, ...)
								if a then return a+sum(...) else return 0 end
							end
							function average(n)
								if #t == period then table.remove(t, 1) end
								t[#t + 1] = n
								return sum(unpack(t)) / #t
							end
							return average
						end

						_G.currAlertWait = 60
						_G.currAlertMsgWaitMins = 15
						local smaPeriodMin = 60 / _G.currAlertWait
						local smaPeriodHour = smaPeriodMin * 60						

		function getCurrRate(currAverage, lastTime, period, isformatted)
			local currAvg = currAverage
			local currRate = 0
			if period == "mins" then
				currRate = math.floor(currAvg * smaPeriodMin) -- / (os.time() - lastTime))
			elseif period == "hours" then
				currRate = math.floor(currAvg * smaPeriodHour) -- / (os.time() - lastTime))
			end
			local isNeg = false
			if currRate < 0 then
				isNeg = true
				currRate = -currRate
			end	
			local currTril = currRate / 1000000000000
			local currBil = currRate / 1000000000
			local currMil = currRate / 1000000
			local currThou = currRate / 1000
			--currRate = math.floor(currRate)
			if currTril >= 1 then
				currFormatted = string.format("%.1fT", currTril)
			elseif currBil >= 1 then
				currFormatted = string.format("%.1fB", currBil)
			elseif currMil >= 1 then
				currFormatted = string.format("%.1fM", currMil)
			elseif currThou >= 1 then
				currFormatted = string.format("%.1fK", currThou)
			else
				currFormatted = math.floor(currRate)
			end
			if isNeg then
				currFormatted = "-" .. currFormatted
			end
			if isformatted then
				return currFormatted
			elseif not isformatted then
				return currRate
			end
		end

					--local playerData = f:InvokeServer("GetPlayerData")
					--local eggsOpenedindex = require(game:GetService("ReplicatedStorage").Assets.Modules.Library.index)["EGGS_OPENED"]
					--local bubblesBlownindex = require(game:GetService("ReplicatedStorage").Assets.Modules.Library.index)["BUBBLES_BLOWN"]
					--local shardindex = require(game:GetService("ReplicatedStorage").Assets.Modules.Library.index)["SHARDS"]
					local stats = {"EggsOpened", "TotalBubbles"}
					for a,b in pairs(currency) do
						if a ~= "XP" then
							table.insert(stats, a)
						end
					end
					
					for a,b in pairs(stats) do
						_G[b .. "sma"] = sma(smaPeriodMin)
						_G[b .. "smahour"] = sma(smaPeriodHour)
						_G[b .. "FirstVal"] = 0
						_G[b .. "LastVal"] = 0
						_G[b .. "LastTime"] = 0
						_G[b .. "AlertLast"] = 0
										
					end

				spawn(function()
					local zeroeggcounter = 0
					while wait(.1) do
						local zerocounter = 0
						local grindkick = 0
						for a,b in pairs(stats) do
							local playerLibrary = library.Save.Get()
							if b == "EggsOpened" then
								local eggtotal = 0
								for c,d in pairs(playerLibrary[b]) do
									if d ~= nil and d > 0 then
										eggtotal = eggtotal + d
									end
								end
								formatted = eggtotal
								unformatted = eggtotal
							else	
								formatted = playerLibrary[b]
								unformatted = playerLibrary[b]
							end
							if formatted == nil then
								formatted = 0
							end
							if unformatted == nil then
								unformatted = 0
							end
							while true do  
								formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
								if (k==0) then
									break
								end
							end
							if _G[b .. "LastTime"] ~= 0 then
								if os.time() >= (_G[b .. "LastTime"] + _G.currAlertWait) then
									local ratemins = getCurrRate(_G[b .. "sma"](unformatted - _G[b .. "LastVal"]), _G[b .. "LastTime"], "mins", true)
									local ratehours = getCurrRate(_G[b .. "smahour"](unformatted - _G[b .. "LastVal"]), _G[b .. "LastTime"], "hours", true)
									--[[
									if getCurrRate(_G[b .. "sma"](unformatted - _G[b .. "LastVal"]), _G[b .. "LastTime"], "mins", false) > 0 then
										LogMe(ratemins .. " " .. b .. "/min")
									end
									if getCurrRate(_G[b .. "smahour"](unformatted - _G[b .. "LastVal"]), _G[b .. "LastTime"], "hours", false) ~= 0 then
										LogMe(ratehours .. " " .. b .. "/hour")
									end
									]]--
									if getCurrRate(_G[b .. "sma"](unformatted - _G[b .. "LastVal"]), _G[b .. "LastTime"], "mins", false) ~= 0 or 
											getCurrRate(_G[b .. "smahour"](unformatted - _G[b .. "LastVal"]), _G[b .. "LastTime"], "hours", false) ~= 0 then
										--LogMe("Total " .. b .. ": " .. formatted)
										LogMe("Total " .. b .. ": " .. library.Functions.NumberShorten(unformatted) .. "\tCurrent Rates:\t" 
											.. library.Functions.NumberShorten(getCurrRate(_G[b .. "sma"](unformatted - _G[b .. "LastVal"]), _G[b .. "LastTime"], "mins", false)) .. "/min\t" 
											.. library.Functions.NumberShorten(getCurrRate(_G[b .. "smahour"](unformatted - _G[b .. "LastVal"]), _G[b .. "LastTime"], "hours", false)) .. "/hour")
									end
									if getCurrRate(_G[b .. "sma"](unformatted - _G[b .. "LastVal"]), _G[b .. "LastTime"], "mins", false) == 0 then
										zerocounter++
										LogMe("Stats with Zero: " .. zerocounter .. "/" .. #stats)
									end
									
									if _G.drops and _G.GrindKick and _G[b] and getCurrRate(_G[b .. "sma"](unformatted - _G[b .. "LastVal"]), _G[b .. "LastTime"], "mins", false) == 0 then
										LogMe("Grind " .. b .. " Zero")
										grindkick++
									elseif b == "Pearls" and _G.drops and _G.GrindKick and _G[b] and getCurrRate(_G[b .. "sma"](unformatted - _G[b .. "LastVal"]), _G[b .. "LastTime"], "mins", false) < _G["PearlsMin"] then
										LogMe("Grind " .. b .. " Less Than Threshold")
										grindkick++
									end
									
									if b == "EggsOpened" and getCurrRate(_G[b .. "sma"](unformatted - _G[b .. "LastVal"]), _G[b .. "LastTime"], "mins", false) == 0 then
										zeroeggcounter++
										LogMe("Zero Eggs Counter :" .. zeroeggcounter)
									elseif b == "EggsOpened" and getCurrRate(_G[b .. "sma"](unformatted - _G[b .. "LastVal"]), _G[b .. "LastTime"], "mins", false) > 0 then
										zeroeggcounter = 0
									end
											
										
									_G[b .. "LastVal"] = unformatted
									_G[b .. "LastTime"] = os.time()
									
									--[[
									if (_G[b .. "AlertLast"] == 0 or os.time() >= (_G[b .. "AlertLast"] + (smaPeriodMin * _G.currAlertWait * _G.currAlertMsgWaitMins))) then
										print("Total: " .. formatted .. " #\n# Current Rates:\t" .. ratemins .. "/min & " .. ratehours .. "/hour")
										_G[b .. "AlertLast"] = os.time()
									else
										local minutesLeft = 0
										local secondsLeft = (_G[b .. "AlertLast"] + (smaPeriodMin * _G.currAlertWait * _G.currAlertMsgWaitMins)) - os.time()
										if secondsLeft >= 60 then
											minutesLeft = math.floor(secondsLeft / 60)
											secondsLeft = secondsLeft - (minutesLeft * 60)
										end
										--print(string.format("%02d:%02d", minutesLeft, secondsLeft))
									end
									]]--
									
								end
							elseif _G[b .. "LastTime"] == 0 then
								_G[b .. "FirstVal"] = unformatted
								_G[b .. "LastVal"] = unformatted
								_G[b .. "LastTime"] = os.time()
							end
						end
						if zerocounter == #stats and _G.kickonzerostats then
							LogMe("Disconnected: Player Frozen")
							Players.LocalPlayer:Kick("Player Frozen")
							break
						elseif egg.flags["KickZeroEggs"] and zeroeggcounter >= 2 then
							LogMe("Disconnected: No Eggs Opened")
							Players.LocalPlayer:Kick("No Eggs Opened")
							break
						end
						
						local currencysgrinding = 0
						for a,b in pairs(currency) do
							if _G.drops and _G[a] then
								currencysgrinding++
							end
						end
						
						if _G.GrindKick and currencysgrinding > 0 and grindkick == currencysgrinding then
							LogMe("Disconnected: No Currency")
							Players.LocalPlayer:Kick("No Currency")
							break
						end
					end
				end)


if _G.autoloadsettings then
	loadSettings()
else
	_G.settingsloaded = true
end