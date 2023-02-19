print("Version 1.2.8")

_G.settingsloaded = false
_G.DisabledEggs = {"Valentine's 2023 Egg"}
_G.LastSell = os.time()
_G.LastDrop = os.time()
_G.TeleportDelay = 1
_G.LastEgg = os.time()
_G.EggDelay = 5
_G.oldeggs = {}
_G.DropTimeOut = 15
_G.DropDelay = 60
_G.DropCoolOff = os.time() + _G.DropDelay

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

function GetLocalPlayer()
	local player = Players.LocalPlayer
	while not player do
		player = Players.LocalPlayer
		wait(1)
		print("Waiting for LocalPlayer")
	end
	return player
end

function GetPlayerChar()
	local character = GetLocalPlayer().Character
	while not character do
		character = Players.LocalPlayer
		wait(1)
		print("Waiting for Character")
	end
	return character
end


function GetPlayerRoot()
	local playerroot = GetPlayerChar():FindFirstChild("HumanoidRootPart")
	while not playerroot do
		playerroot = GetPlayerChar():FindFirstChild("HumanoidRootPart")
		wait(1)
		print("Waiting for Root")
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
		print("Waiting for Workspace")
	end
	return workspace
end

function GetMap()
	local map = GetWorkspace():FindFirstChild("MAP")
	while not map do
		map = GetWorkspace():FindFirstChild("MAP")
		wait(1)
		print("Waiting on MAP")
	end
	return map
end

function GetChests()
	local chest = GetMap():FindFirstChild("Chests")
	while not chest do
		chest = GetWorkspace():FindFirstChild("MAP")
		wait(1)
		print("Waiting on Chests")
	end
	return chest
end
		
local workspace = GetWorkspace()
local map = GetMap()
local chests = GetChests()

local Dir = COREGUI:FindFirstChild("RobloxPromptGui"):FindFirstChild("promptOverlay")
	Dir.DescendantAdded:Connect(function(Err)
		if Err.Name == "ErrorTitle" then
			Err:GetPropertyChangedSignal("Text"):Connect(function()
				if Err.Text:sub(0, 12) == "Disconnected" then
					if #Players:GetPlayers() <= 1 then
						Players.LocalPlayer:Kick("\nRejoining...")
						wait()
						TeleportService:Teleport(PlaceId, Players.LocalPlayer)
					else
						TeleportService:TeleportToPlaceInstance(PlaceId, JobId, Players.LocalPlayer)
					end
				end
			end)
		end
	end)

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



local nevermore = game.ReplicatedStorage:FindFirstChild("Nevermore")
while not nevermore do
	nevermore = game.ReplicatedStorage:FindFirstChild("Nevermore")
	wait(1)
	print("Waiting on Replicated Storage")
end
local lib = nevermore:FindFirstChild("Library")
while not lib do
	lib = nevermore:FindFirstChild("Library")
	wait(1)
	print("Waiting on Game Library")
end

library = require(lib)

while not library.Save do
	print("Waiting on Game Library")
	wait(1)
end
	

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
					print(b.nk .. " is being deleted.")
				end
			end
		end
					
		game:GetService("ReplicatedStorage").Remotes["delete pets"]:FireServer(ohTable1)
	end	

	if _G["DeletePetMode"] == "Delete When Full" and table.getn(playerLibrary.Pets) >= (playerLibrary.MaxSlots - 1) and pet.flags.AutoDeleteNum ~= nil and tonumber(pet.flags.AutoDeleteNum) > 0 then
	
		print("Will Delete " .. pet.flags.AutoDeleteNum .. " Pets")
		doDelete(pet.flags.AutoDeleteNum)

	elseif _G["DeletePetMode"] == "Delete When Full" and table.getn(playerLibrary.Pets) < (playerLibrary.MaxSlots - 1) then
	
		print(playerLibrary.MaxSlots - table.getn(playerLibrary.Pets) .. " Pet Slots Left in Inventory")
		
	elseif _G["DeletePetMode"] == "Custom Delete" and pet.flags["KeepOnlyNum"] ~= nil and pet.flags["KeepOnlyNum"] ~= "" and tonumber(pet.flags["KeepOnlyNum"]) > 0 and table.getn(playerLibrary.Pets) > pet.flags["KeepOnlyNum"] then
	
		print("Will Delete " .. (table.getn(playerLibrary.Pets) - pet.flags.KeepOnlyNum) .. " Pets")
		doDelete(table.getn(playerLibrary.Pets) - pet.flags.KeepOnlyNum)
		
	elseif _G["DeletePetMode"] == "Custom Delete" and pet.flags["KeepOnlyNum"] ~= nil and pet.flags["KeepOnlyNum"] ~= "" and tonumber(pet.flags["KeepOnlyNum"]) > 0 and table.getn(playerLibrary.Pets) < pet.flags["KeepOnlyNum"] then

		print((pet.flags["KeepOnlyNum"] - table.getn(playerLibrary.Pets)) .. " Pet Slots Left until Auto Delete")

	end
end

	pet:Dropdown("Delete Mode", {location = _G, flag = "DeletePetMode", list = {"Off", "Delete When Full", "Custom Delete"} })
	pet:Box('Num Pets to Delete', {flag = "AutoDeleteNum",
        type = 'number'
    })
	pet:Box('Delete at Pet #', {flag = "KeepOnlyNum",
    type = 'number'
    })


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

		farm:Toggle('Free Prize Wheel', {flag = 'FreePrizeWheel'}, function() spawn(function() SpinPrizeWheel() end) end)

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
			Eggs[d.Name]["World"] = b.Name
			Eggs[d.Name]["Currency"] = require(d[d.Name]).currency
			Eggs[d.Name]["Cost"] = require(d[d.Name]).cost
		end
	end
end

function doFreeLoot()

			local playerLibrary = library.Save.Get()
			for a,b in pairs(library.Directory.FreeGifts) do
				local found = false
				for c,d in pairs(playerLibrary.FreeGiftsRedeemed) do
					if a == d then
						found = true
					end
				end
				if playerLibrary.FreeGiftsTime > b.waitTime and not found then
					--repeat
						_G.player.Character:SetPrimaryPartCFrame(CFrame.new(game:GetService("Workspace").MAP.PlayerSpawns:FindFirstChild("Part").Position))
						toTarget(root.Position,game:GetService("Workspace").MAP.PlayerSpawns:FindFirstChild("Part").Position,game:GetService("Workspace").MAP.PlayerSpawns:FindFirstChild("Part").CFrame)
						wait(_G.TeleportDelay)
						game:GetService("ReplicatedStorage").Remotes["redeem free gift"]:InvokeServer({[1] = {[1] = a},[2] = {[1] = false}})
					--until game:GetService("Workspace").Stuff.Lootbags:FindFirstChildWhichIsA("MeshPart", true) ~= nil
					print("Claiming Loot Bag " .. a)
				end
			end
		
		
			local closest = nil
			local dis = math.huge
			for i , v in ipairs(game:GetService("Workspace").Stuff.Lootbags:GetChildren()) do
				closest = v:FindFirstChildWhichIsA("MeshPart")
				dis = (GetPlayerRoot().Position-v:FindFirstChildWhichIsA("MeshPart").Position).magnitude
				if closest ~= nil then
					_G.player.Character:SetPrimaryPartCFrame(CFrame.new(closest.Position.X+8, closest.Position.Y + 2, closest.Position.Z+10))
					local dis = closest.CFrame.Y - GetPlayerRoot().CFrame.Y
					if dis < (closest.Size.Y * -1) or dis > closest.Size.Y then
						GetPlayerRoot().CFrame = CFrame.new(GetPlayerRoot().CFrame.X,closest.CFrame.Y,GetPlayerRoot().CFrame.Z)
					end
					toTarget(GetPlayerRoot().Position,closest.Position,closest.CFrame)
					print("TP to Lootbag " .. v.Name)
					wait(_G.TeleportDelay)
				end
			end
		

end

		farm:Toggle('Free Loot', {flag = 'FreeLoot'})
		
function doBubblePass()

		local playerLibrary = library.Save.Get()

		if playerLibrary.BubblePass and playerLibrary.BubblePass.Owned and farm.flags.ClaimPass then
		
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
			
			if allClaimed and playerLibrary.BubblePass.CurrentEggs > highestEggPrize and playerLibrary["Diamonds"] >= 500000000 then
			
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
				print((highestEggPrize - playerLibrary.BubblePass.CurrentEggs) .. " eggs left before Bubble Pass is complete")
			end
			
		elseif not playerLibrary.BubblePass and farm.flags.ClaimPass and playerLibrary["Diamonds"] >= 1000000000 then
		
			print("Purchasing Bubble Pass")
		
			local ohTable1 = {
				[1] = {
					[1] = false
				},
				[2] = {
					[1] = 2
				}
			}

			game:GetService("ReplicatedStorage").Remotes["buy bubble pass"]:FireServer(ohTable1)
		
		else
			print("Bubble Pass not Owned")
			
			
		end

end
		farm:Toggle('Claim Bubble Pass', {flag = 'ClaimPass'}, function() spawn(function() doBubblePass() end) end)
		
function doTierRewards()

	if farm.flags["Tier Rewards"] then

		local playerLibrary = library.Save.Get()
		local Rewards = {["Spawn World"] = 0}
		
		for a,b in pairs(Rewards) do
			if playerLibrary.Rewards[a] then
				Rewards[a] = playerLibrary.Rewards[a]
			end
		end

			for a,b in pairs(Rewards) do
				if library.Directory.Rewards[a].price(b + 1) <= playerLibrary["Diamonds"] then
					print("Redeeming " .. a .. " Reward Slot #" .. b + 1 .. " for " .. library.Directory.Rewards[a].price(b + 1) .. " Diamonds")
					
					local ohTable1 = {
						[1] = {
							[1] = "Spawn World"
						},
						[2] = {
							[1] = false
						}
					}

					game:GetService("ReplicatedStorage").Remotes["buy rewards"]:FireServer(ohTable1)
					wait(.5)
				else
					print((library.Directory.Rewards[a].price(b + 1) - playerLibrary["Diamonds"]) .. " Diamonds until " .. a .. " Reward Slot #" .. b + 1 .. " can be redeemed")
				end
			end
		--elseif library.Directory.Rewards[a].price(1) <= playerLibrary["Diamonds"] then
		
	end
	
end
		
		farm:Toggle('Tier Rewards', {flag = 'Tier Rewards'}, function() spawn(function() doTierRewards() end) end)
		
		
local changeSetting = function(settingtype, settingname, value)

	for a,b in pairs(game:GetService("CoreGui").ScreenGui:GetDescendants()) do
	
		if settingtype == "Checkmark" and b.Name == "Checkmark" and b.Parent.name == settingname and ((value and b.Text ~= utf8.char(10003)) or (not value and b.Text == utf8.char(10003))) then
			for a,b in pairs(getconnections(b.MouseButton1Click)) do
				b:Fire()
			end
		elseif settingtype == "Box" and b.Name == "Box" and b.Parent.name == settingname and settingname ~= "" and settingname ~= 0 then
			b.Text = value
			for i,v in pairs(getconnections(b.FocusLost)) do
				v:Fire()
			end
		elseif settingtype == "Selection" and b.Name == "Selection" then
		
			local currentValue = b.Text			
						
			for i,v in pairs(getconnections(b.Parent.drop.MouseButton1Click)) do
				v:Fire()
			end
			wait(.5)
			local selectionname = b.Text
			--print(selectionname, settingname)
			
			if selectionname == settingname then
				for i,v in pairs(b.Parent.DropContainer:GetChildren()) do
					if v.Name == "TextButton" and v.Text == value then
						for x,y in pairs(getconnections(v.MouseButton1Click)) do
							y:Fire()
						end
						--print(selectionname, value)
					end
				end
			else
				for i,v in pairs(b.Parent.DropContainer:GetChildren()) do
					if v.Name == "TextButton" and v.Text == currentValue then
						for x,y in pairs(getconnections(v.MouseButton1Click)) do
							y:Fire()
						end
						--print(selectionname, currentValue)
					end
				end
			end	
		end
	end
end

function switchEggs(args, old, switch)
	if _G.settingsloaded then
		print("Switching Eggs")
		--print(args[2])
		if old["Buy Mode"] == nil then
			print("New Settings")
			old = {["Buy Mode"] = _G.BuyEggMode}
		elseif switch then
			args = old
			old = {}
		end
		
		if old["Buy Mode"] == nil then
			old = {["Buy Mode"] = _G.BuyEggMode}
		else
			print("old",old["Buy Mode"])
		end
		if old["Eggs"] == nil then
			print("New Settings")
		else
			for a,b in pairs(old["Eggs"]) do
				print("old",b)
			end
		end
		print("new",args["Buy Mode"])
		for a,b in pairs(args["Eggs"]) do
			print("new",b)
		end
		
		local oldeggs = {}

		for a,b in pairs(Eggs) do
	
			if old["Eggs"] == nil then
				if _G[a] then
					print("Insert Egg")
					table.insert(oldeggs, a)
				end
			end
			
			enabled = false
			for c,d in pairs(args["Eggs"]) do
				if a == d then
					enabled = true
					print(a, enabled)
				end
			end
			
			
			changeSetting("Checkmark", a, enabled)
				
		end
		

		changeSetting("Selection", "Buy Mode", args["Buy Mode"])
		
		print("Old Eggs")
		print(old["Buy Mode"])
		--old["Eggs"] = {}
		if old["Eggs"] == nil then
			old["Eggs"] = {}
			for a,b in pairs(oldeggs) do
				table.insert(old["Eggs"], b)
			end
			for a,b in pairs(old["Eggs"]) do
				print(b)
			end
		else
			print("Old Settings")
		end	
		
		return old
		
	else
		print("Settings not loaded")
	end
end


		
local doChallenge = function()

		local playerLibrary = library.Save.Get()

		if _G.ChallengeName ~= nil and farm.flags[_G.ChallengeName] and playerLibrary[_G.ChallengeName] ~= nil and playerLibrary[_G.ChallengeName].Claimed ~= nil then
			--print("Claimed " .. playerLibrary.Valentines.Claimed)

			local lastPrize = 0

			for a,b in pairs(library.Directory[_G.ChallengeName]) do
				if a > lastPrize then
					lastPrize = a
				end
				
				if a == (playerLibrary[_G.ChallengeName].Claimed + 1) and playerLibrary[_G.ChallengeName].Progress[b.challengeType] >= b.amount  then
					--print(playerLibrary.Valentines.Progress[b.challengeType] .. " " .. b.challengeType)
					--print(b.amount)
					print("Attempting to claim " .. a .. " " .. _G.ChallengeName)
					local ohTable1 = {
						[1] = {
							[1] = false
						},
						[2] = {
							[1] = 2
						}
					}

					game:GetService("ReplicatedStorage").Remotes[_G.ChallengeRemote]:FireServer(ohTable1)
					
					if b.challengeType == "CoinPickups" then
						print("Switching OFF Coin Pickups")
						changeSetting("Checkmark", "Collect Drops", false)
						changeSetting("Checkmark", "Coins Bag", false)
						changeSetting("Checkmark", "Large Coin", false)
						changeSetting("Checkmark", "Medium Coin", false)
						changeSetting("Checkmark", "Small Coin", false)
						changeSetting("Box", "Range", 0)
					elseif b.challengeType == "DiamondPickups" then
						print("Switching OFF Diamond Pickups")
						changeSetting("Checkmark", "Collect Drops", false)
						changeSetting("Checkmark", "Large Diamonds", false)
						changeSetting("Checkmark", "Small Diamond", false)
						changeSetting("Box", "Range", 0)
					elseif b.challengeType == "LegendaryPets" or b.challengeType == "GodlyPets" then
						print("Switch Back Eggs")
						switchEggs({["Buy Mode"] = {}, ["Eggs"] = {}}, _G.oldeggs, true)
						_G.oldeggs = {}
					else
						wait(5)
					end
					
				elseif a == (playerLibrary[_G.ChallengeName].Claimed + 1) then
				
					print ((b.amount - playerLibrary[_G.ChallengeName].Progress[b.challengeType]) .. " " .. b.challengeType .. " remaining to claim " .. _G.ChallengeName .. " " .. a)
				
					if b.challengeType == "CoinPickups" then
						print("Switching ON Coin Pickups")
						changeSetting("Checkmark", "Collect Drops", true)
						changeSetting("Checkmark", "Coins Bag", true)
						changeSetting("Checkmark", "Large Coin", true)
						changeSetting("Checkmark", "Medium Coin", true)
						changeSetting("Checkmark", "Small Coin", true)
						changeSetting("Box", "Range", 50000)
					elseif b.challengeType == "DiamondPickups" then
						print("Switching ON Diamond Pickups")
						changeSetting("Checkmark", "Collect Drops", true)
						changeSetting("Checkmark", "Large Diamonds", true)
						changeSetting("Checkmark", "Small Diamond", true)
						changeSetting("Box", "Range", 50000)
					elseif b.challengeType == "LegendaryPets" then
						print("Switch to Legendary Challenege")
						if _G.oldeggs["Buy Mode"] == nil then
							local oldeggs = switchEggs({["Buy Mode"] = "Best", ["Eggs"] = {"Magma Egg", "Common Egg"}}, {}, true)
							print("return old eggs", oldeggs["Buy Mode"], oldeggs["Eggs"][1])
							_G.oldeggs = oldeggs
						else
							print("Chal" .. _G.oldeggs["Buy Mode"])
							for a,b in pairs(_G.oldeggs["Eggs"]) do
								print(b)
							end
							local oldeggs = switchEggs({["Buy Mode"] = "Best", ["Eggs"] = {"Magma Egg", "Common Egg"}}, _G.oldeggs, false)
							--_G.oldeggs = oldeggs
						end
						--switchEggs({["Buy Mode"] = "Best", ["Eggs"] = {"Magma Egg", "Common Egg"}})
					elseif b.challengeType == "GodlyPets" then
						print("Switch to Godly Challenege")
						if _G.oldeggs["Buy Mode"] == nil then
							local oldeggs = switchEggs({["Buy Mode"] = "Best", ["Eggs"] = {"Safe Egg", "Galaxy Egg", "Common Egg"}}, {}, true)
							print("return old eggs", oldeggs["Buy Mode"], oldeggs["Eggs"][1])
							_G.oldeggs = oldeggs
						else
							print("Chal" .. _G.oldeggs["Buy Mode"])
							for a,b in pairs(_G.oldeggs["Eggs"]) do
								print(b)
							end
							local oldeggs = switchEggs({["Buy Mode"] = "Best", ["Eggs"] = {"Safe Egg", "Galaxy Egg", "Common Egg"}}, _G.oldeggs, false)
							--_G.oldeggs = oldeggs
						end
						--switchEggs({["Buy Mode"] = "Best", ["Eggs"] = {"Safe Egg", "Galaxy Egg", "Common Egg"}}, )					
					end
				end
			end
			
			if playerLibrary[_G.ChallengeName].Claimed == lastPrize then
				print("All " .. _G.ChallengeName .. " Prizes Claimed")
			end
		end

end

		if _G.ChallengeName ~= nil then
			farm:Toggle(_G.ChallengeName .. " Challenge", {flag = _G.ChallengeName}, function() spawn(function() while not _G.settingsloaded do print("Settings not loaded") wait(1) end doChallenge() end) end)
		end


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
		wait(.1)
		--library.Variables.OpeningEgg = false
		game:GetService("ReplicatedStorage").Remotes["buy egg"]:InvokeServer(ohTable2)
	end
end


local egg = wally:CreateWindow('Eggs')
	egg:Section('Select Eggs')
	egg:Toggle('Fast Hatch', {flag = "FastHatch"}, function(fasthatch) if fasthatch then _G.EggDelay = 3 else _G.EggDelay = 5 end end)
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
    local info = TweenInfo.new((targetPos - pos).Magnitude/150, Enum.EasingStyle.Quad)
    -- local tic_k = tick()
    local tween, err = pcall(function()
        local tween = tween_s:Create(GetPlayerRoot(), info, {CFrame = targetCFrame})
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
						
							local currentValue = b.Text
						
							for i,v in pairs(getconnections(b.Parent.drop.MouseButton1Click)) do
								v:Fire()
							end
							wait(.5)
							local selectionname = b.Text
						
							if json[plr.Name][selectionname] ~= nil and json[plr.Name][selectionname] ~= "" and json[plr.Name][selectionname] ~= 0 then
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
		
		_G.settingsloaded = true
end


local settingsGUI = wally:CreateWindow('Settings')
settingsGUI:Button('Load Settings', function() loadSettings() end)
settingsGUI:Button('Save Settings', function() saveSettings() end)
	

spawn(function()	
	while wait(.1) do
			--if not _G.collectingchests and not _G.sell and farm.flags.Drops == true and (_G.canafford ~= true or _G.eggSkip == true) then
	if _G.settingsloaded then
	
		local bestEgg = {["Diamonds"] = {["Name"] = nil, ["Cost"] = 0},
						 ["Coins"] = {["Name"] = nil, ["Cost"] = 0}
						}
		local playerLibrary = library.Save.Get()
		print("Hatching Eggs")
		while os.time() < (_G.LastEgg + _G.EggDelay) do
			if _G.BuyEggMode == "Best" then
				for i,v in pairs(Eggs) do
					if playerLibrary[v.Currency] > (v.Cost * multiplier) and v.Cost > bestEgg[v.Currency].Cost and _G[i] then
						bestEgg[v.Currency].Name = i
						bestEgg[v.Currency].Cost = v.Cost
					end
				end
				if bestEgg["Diamonds"].Name and bestEgg["Coins"].Name then
					--print("Opening " .. bestEgg.Name)
					if bestEgg["Diamonds"].Name == "Valentine's 2023 Egg" then
						openEgg(bestEgg["Diamonds"].Name)
					elseif bestEgg["Coins"].Cost > bestEgg["Diamonds"].Cost then
						openEgg(bestEgg["Coins"].Name)
					else
						openEgg(bestEgg["Diamonds"].Name)
					end
				elseif bestEgg["Diamonds"].Name then
					openEgg(bestEgg["Diamonds"].Name)
				elseif bestEgg["Coins"].Name then
					openEgg(bestEgg["Coins"].Name)
				end
				
			elseif _G.BuyEggMode == "Any" then
				for i,v in pairs(Eggs) do
					if _G[i] then
						--print("Opening " .. i)
						openEgg(i)
					end
				end
				
			end
			wait(_G.TeleportDelay)
		end
		
		_G.LastEgg = os.time()
		if farm.flags.FreeLoot then
			--print("Do Free Loot")
			doFreeLoot()
			--print("End Free Loot")
		end
		

		if _G.drops and os.time() > (_G.LastDrop + _G.DropDelay)  then		
			--_G.DropCoolOff = os.time() + _G.DropDelay			
			--_G.CollectingDrops = true
			--spawn(function()
				_G.DropCoolOff = os.time() + _G.DropTimeOut
				_G.LastDrop = os.time() + _G.DropCoolOff
				print("Starting Drops")
				while _G.drops and (os.time() < _G.DropCoolOff) do
					
				
					local closest = nil
					local dis = math.huge
					
					local pickupsLib = library.Network.Invoke("Get Pickups")
					
					for i , v in ipairs(game.Workspace.Stuff.Pickups:GetChildren()) do
						if (pickupsLib[v.Name].a == "VIP" and VIP) or pickupsLib[v.Name].a ~= "VIP" then
							for x,y in pairs(pickups) do
								if _G[y] and tonumber(_G.droprange) ~= nil then
									if v:FindFirstChild('POS') and v:FindFirstChild(y) and v[y]:FindFirstChild("TouchInterest") and (GetPlayerRoot().Position-v.POS.Position).magnitude <= tonumber(_G.droprange) and (GetPlayerRoot().Position-v.POS.Position).magnitude < dis then --and farm.flags.Drops == true  and _G.sell ~= true then
										--root.CFrame = CFrame.new(root.CFrame.X,v.CFrame.Y,root.CFrame.Z)
										closest = v.POS
										dis = (GetPlayerRoot().Position-v.POS.Position).magnitude
									end
								end
							end
						end
					end
					
						
					if closest ~= nil and (target == nil or target.Parent == nil) then
						closest.Parent.ChildRemoved:connect(function(object) --_G.Pickups[v.Name] = false 
																print(object .. " removed") 
															end)
						local dis = closest.CFrame.Y - GetPlayerRoot().CFrame.Y
						--if dis > 250 then
							--G.player.Character:SetPrimaryPartCFrame(CFrame.new(closest.Position.X+1, closest.Position.Y+3, closest.Position.Z+1))
						--end
						if dis < (closest.Size.Y * -1) or dis > closest.Size.Y then
							GetPlayerRoot().CFrame = CFrame.new(GetPlayerRoot().CFrame.X,closest.CFrame.Y + 2,GetPlayerRoot().CFrame.Z)
						end
						toTarget(GetPlayerRoot().Position,closest.Position + Vector3.new(0,2,0),closest.CFrame + Vector3.new(0,2,0))
						wait(.1)
					end
				end
				print("Ending Drops")
				_G.LastDrop = os.time()
				
			wait(_G.TeleportDelay)
			--end)
			--_G.CollectingDrops = false
			--end
		end
		
		
		
		if _G.SellBubbleDelay > 0 and os.time() > (_G.LastSell + _G.SellBubbleDelay) then
			if _G.SellBubbleArea ~= "No Sell" then
				print("Sell Bubble")
				_G.LastSell = os.time()
				local sellarea = game:GetService("Workspace").MAP.Activations[_G.SellBubbleArea]
				--local playerLibrary = library.Save.Get()
				--for i = 1, 5 do
				_G.player.Character:SetPrimaryPartCFrame(CFrame.new(sellarea.Position.X+10, sellarea.Position.Y + 2, sellarea.Position.Z+8))
				wait(.5)
				toTarget(GetPlayerRoot().Position,sellarea.Position + Vector3.new(0,2,0),sellarea.CFrame + Vector3.new(0,0,0))
					
					--playerLibrary = library.Save.Get()
					
				
				wait(_G.TeleportDelay)
			end
		end	
		
		for a,b in pairs(game:GetService("Workspace").MAP.Chests:GetChildren()) do
			if _G[b.name] then
				local chest = game:GetService("Workspace").MAP.Activations[b.name]
				repeat
					print("TP to Chest")
					_G.player.Character:SetPrimaryPartCFrame(CFrame.new(chest.Position.X + math.random(3,8), chest.Position.Y + 10, chest.Position.Z + math.random(3,8)))
					wait(_G.TeleportDelay)
					toTarget(GetPlayerRoot().Position,chest.Position,chest.CFrame)
				until game:GetService("Workspace").MAP.Chests:FindFirstChild(b.name) == nil
				print("Grabbed " .. b.name .. "!!!")
				wait(_G.TeleportDelay)
			end
			
		end
			

	end	
		
	end
end)
	
spawn(function()
	while wait(180) do
		doTierRewards()
		doBubblePass()
		doChallenge()
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
	while wait(15) do	

		DeletePets()

	
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
						print(i,v)
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
						
						print("Attempting Shiny " .. i)
						print("Shiny Cost " .. library.Shared.ShinyCost(petid, _G.AutoShinyNum))
						
						for c,d in pairs(ohTable1[1][1]) do
							print(c,d)
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
end)


if _G.autoloadsettings then
	loadSettings()
else
	_G.settingsloaded = true
end



function NoobSim()
						print("BGClicker n00b Challenge SIMULATOR")
						wait(1)
						print("...")
						wait(3)
						print("Rdy?")
						wait(10)
						print("Get some coins you bugger!")
						wait(5)
						changeSetting("Checkmark", "Collect Drops", true)
						changeSetting("Checkmark", "Coins Bag", true)
						changeSetting("Checkmark", "Large Coin", true)
						changeSetting("Checkmark", "Medium Coin", true)
						changeSetting("Checkmark", "Small Coin", true)
						changeSetting("Box", "Range", 50000)
						wait(10)
						print("Now get some more stupid pets!")
						changeSetting("Checkmark", "Collect Drops", false)
						changeSetting("Checkmark", "Coins Bag", false)
						changeSetting("Checkmark", "Large Coin", false)
						changeSetting("Checkmark", "Medium Coin", false)
						changeSetting("Checkmark", "Small Coin", false)
						changeSetting("Box", "Range", 0)
						switchEggs({"Void Egg", "Galaxy Egg"})
						wait(15)
						print("Colleca crap lo of Diamon")
						switchEggs({"old"})
						changeSetting("Checkmark", "Collect Drops", true)
						changeSetting("Checkmark", "Large Diamonds", true)
						changeSetting("Checkmark", "Small Diamond", true)
						changeSetting("Box", "Range", 50000)
						wait(10)
						print("Hatch 100 Legendaries!")
						changeSetting("Checkmark", "Collect Drops", false)
						changeSetting("Checkmark", "Large Diamonds", false)
						changeSetting("Checkmark", "Small Diamond", false)
						changeSetting("Box", "Range", 0)
						switchEggs({"Magma Egg"})
						wait(10)
						print("Blow 1 kagillion bubbles!!!")
						switchEggs({"old"})
end
						