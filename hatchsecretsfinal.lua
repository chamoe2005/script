
Players = game:GetService("Players")
PlaceId, JobId = game.PlaceId, game.JobId

function GetLocalPlayer()
	local player = Players.LocalPlayer
	while not player do
		player = Players.LocalPlayer
		wait(1)
		print("Waiting for LocalPlayer")
	end
	return player
end

function LogMe(statusmessage)

	local TIME_ZONE = -5
	local date = os.date("!*t")
	local hour = (date.hour + TIME_ZONE) % 24
	local ampm = hour < 12 and "AM" or "PM"
	local timestamp = string.format("%02i:%02i:%02i %s", ((hour - 1) % 12) + 1, date.min, date.sec, ampm)

	--if isfile("bgclog" .. GetLocalPlayer().Name .. ".txt") then
		--if message and message ~= "" then
			print(statusmessage)
			--appendfile("bgclog" .. GetLocalPlayer().Name .. ".txt", timestamp .. "\t" .. message .. "\n")
		--end
	--end

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

local library = require(game.ReplicatedStorage:WaitForChild("Nevermore"):WaitForChild("Library"))
local playerLibrary = library.Save.Get()

local sharedModules = game:GetService("ReplicatedStorage").Nevermore["Shared Modules"]
local netremotes = nil

local counter = 0
for a,b in pairs(sharedModules:GetChildren()) do

	if b:FindFirstChild("open egg") then
		netremotes = b
	end
	--[[
	for c,d in pairs(b:GetChildren()) do
		--print(d)
		counter++
	end
	if counter > 100 then
		remotes = b
		counter = 0
	end
	]]--
end


_G.showhatches = true
_G.onlysecrets = true


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

local oldOpenEgg = nil
local oldCon = nil
for i, connection in pairs(getconnections(netremotes["open egg"].Event)) do 
	oldOpenEgg = connection.Function
	oldCon = connection
end

local newHatch = function (...) 

																						
																					

																					
																					local v16 = { "open egg", ... };
																					local v22, v23 = unpack(v16);
																					--print(v22);
																					_G.ohString1, _G.ohTable2 = DecodePacket(v23)
																					
																					--[[_G.ohString1 = "Magma Egg"
																					_G.ohTable2 = {
																									[1] = {
																										["autoDelete"] = true,
																										["id"] = "24"
																										}
																									}
																					--]]
																					local ohColor32 = Color3.new(255, 255, 255)																					
																					 
																					local petDir = library.Directory.Pets
																					local eggDir = library.Directory.Eggs[_G.ohString1]
																					local secretid = nil
																					local petname = ""
																					local rarity = ""
																					local chance = ""
																					local shiny = ""
																					local secret = ""
																					for a,b in pairs(eggDir.pets) do		
																						for c,d in pairs(petDir) do
																							if b[1] == c and d.secret then
																								secretid = c
																							end
																						end
																					end
																					local messages = {}
																					for a,b in pairs(_G.ohTable2) do
																						if secretid ~= nil and _G.onlysecrets then
																							b.id = secretid
																							b.autoDelete = false
																							b.s = true
																							b.secret = true
																						end
																						petname = petDir[b.id]["name"]
																						
																						for c,d in pairs(eggDir.pets) do																			
																							if d[1] == b.id then																																									
																								chance = d[2]																																												
																							end																																												
																						end
																						rarity = petDir[b.id]["rarity"]
																						shiny = b.s																						
																						local ohString2 = ""																						
																						if b.secret then 
																							ohColor32 = Color3.new(0, 0, 0)
																							ohString2 = ohString2 .. "OMG!!!!! " 
																						end
																						ohString2 = ohString2 .. GetLocalPlayer().Name .. " hatched a " 
																						if shiny then 
																							ohString2 = ohString2 .. "SHINY " 
																						end
																						ohString2 = ohString2 .. rarity .. " " .. petname .. " pet! ("
																						if shiny then 
																							ohString2 = ohString2 .. (chance / 10)
																						else
																							ohString2 = ohString2 .. chance
																						end
																						ohString2 = ohString2 .. "%)"
																						table.insert(messages, ohString2)
																					end	
																					--[[
																					
																					--]]
																					if _G.showhatches then
																						oldOpenEgg(_G.ohString1, _G.ohTable2)
																						wait(5)
																						for i,v in pairs(messages) do
																							if string.find(v, "SHINY") or string.find(v, "Legendary") or string.find(v, "Godly") then
																								netremotes["system message"]:Fire(v, ohColor32)
																								wait(.25)
																							end
																						end
																					end
																				end

--game:GetService("ReplicatedStorage").Nevermore["Shared Modules"]['']["open egg"]:Fire(ohString1, ohTable2)
local openeggremote = game:GetService("ReplicatedStorage").Remotes:FindFirstChild("open egg")
repeat
	wait(1)
	openeggremote = game:GetService("ReplicatedStorage").Remotes:FindFirstChild("open egg")
until openeggremote ~= nil
oldCon:Disable()
openeggremote.OnClientEvent:Connect(newHatch)
print("Done")