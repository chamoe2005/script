local library = require(game.ReplicatedStorage:WaitForChild("Nevermore"):WaitForChild("Library"))
local petDir = library.Directory.Pets
local currency = {"Bubbles"}
for a,b in pairs(library.Shared.Currency) do
	table.insert(currency, a)
end
local categories = {"rarity", "name"}
local header = ""
local Pets = {}
local sortedPets = {}
writefile("pets.txt", "")
header = header .. "Pet ID" .. "\t".. "Egg" .. "\t".. "Chance" .. "\t"
for a,b in pairs(categories) do
	header = header .. b .. "\t"
end
for a,b in pairs(currency) do
	header = header .. b .. "\t"
end
header = header .. "\n"
function GetEggNameFromPetID(petid, isSecret)
		for e,f in pairs(library.Directory.Eggs) do
			for g,h in pairs(f.pets) do
			
			if h[1] == petid then
				--if h[2] and isSecret then
					--return e .. " (Secret)", "1 in " .. library.Functions.NumberShorten(math.ceil(1 / h[2] * 100))
				--else
				if h[2] then
					return e, h[2] --"1 in " .. library.Functions.NumberShorten(math.ceil(1 / h[2] * 100))
				else
					return e, "Inf"
				end
			end
			
			end
			
		end
		for e,f in pairs(library.Directory.Rewards) do
			for g,h in pairs(f.rewards) do
				if h.rewardType == "Pet" and h.reward == petid then
					return e .. " Tier Reward", "#" .. g
				end
			end
		end
		for e,f in pairs(library.Directory.BubblePass) do
			if f.rewardType == "Pet" and f.reward == petid then		
				return "Bubble Pass", "#" .. e
			end
		end
		for e,f in pairs(library.Directory.PrizeWheel) do
			if f.rewardType == "Pet" and f.reward == petid then
				return "Prize Wheel", "1 in " .. library.Functions.NumberShorten(math.ceil(1 / f.chance * 100))
			end
		end
		for e,f in pairs(library.Directory.Event) do
			if f.rewardType == "Pet" and f.reward == petid then
				return "St. Patricks Day Challenege", "#" .. e
			end
		end
	return "No Egg", "Inf"
end

--print("Unsorted Pets")
			
for j,k in pairs(petDir) do
	Pets[j] = {}
	Pets[j]["Bubbles"] = library.Directory.Pets[j]["Bubbles"]	
	for a,b in pairs(categories) do
		if b == "rarity" and library.Directory.Pets[j]["secret"] then
			Pets[j][b] = library.Directory.Pets[j][b] .. " (S)"
		else
			Pets[j][b] = library.Directory.Pets[j][b]
		end
	end
	for a,b in pairs(currency) do
		Pets[j][b] = 0
		if library.Directory.Pets[j].buffs[b] ~= nil then
			Pets[j][b] = library.Directory.Pets[j].buffs[b]
		end			
	end
	Pets[j]["Egg"], Pets[j]["Chance"] = GetEggNameFromPetID(j, k.secret)
end


for j,a in pairs(Pets) do
	--[[
	local best = {}
	for x,y in pairs(currency) do
		best[x] = 0
	end	
	for i,v in pairs(Pets) do
		
				
				--local petid = i
				
				--local petFound = false
				
					--for a,b in pairs(sortedPets) do
						--if petid == b then
							--petFound = true
						--end
					--end
				
					--if petid ~= 0 and not petFound then 
						
					
				--print(j,k)
		local isbest = false
		for x,y in pairs(currency) do
			if Pets[i][x] ~= nil and Pets[i][x] > best[x] and sortedPets[i] == nil then
				best[x] = Pets[i][x]
				isbest = true
			end	
		end
		--if isbest then
			--best["id"] = i
		--end	
	end
	]]--
	--table.insert(sortedPets, a)
end
					--[[and ((petDir[petid].buffs.Bubbles ~= nil) and ()) 
					((petDir[petid].buffs.Bubbles ~= nil and petDir[petid].buffs.Bubbles > bestbubble) or 
														(petDir[petid].buffs.Coins ~= nil and petDir[petid].buffs.Coins > bestcoin) or
														(petDir[petid].buffs.Diamonds ~= nil and petDir[petid].buffs.Diamonds > bestdiamond) or
														(petDir[petid].buffs.Pearls ~= nil and petDir[petid].buffs.Pearls > bestpearl)) then 
						function() if petDir[petid].buffs.Bubbles ~= nil then return petDir[petid].buffs.Bubbles else return 0 end end
						bestcoin = function() if petDir[petid].buffs.Coins ~= nil then return petDir[petid].buffs.Coins else return 0 end end
						bestdiamond = function() if petDir[petid].buffs.Diamonds ~= nil then return petDir[petid].buffs.Diamonds else return 0 end end
						bestpearl = function() if petDir[petid].buffs.Pearls ~= nil then return petDir[petid].buffs.Pearls else return 0 end end ]]--
						
						--bestpetid = i 
		
						--local eggname,chance = GetEggNameFromPetID(petid)

						--table.insert(sortedPets, bestpetid)
						
						--[[
						
						
									
						]]--


local petlist = ""
for a,b in pairs(Pets) do
	header = header .. a .. "\t" .. Pets[a]["Egg"] .. "\t".. Pets[a]["Chance"] .. "\t"
	for c,d in pairs(categories) do
	print(Pets[a][d])
		if Pets[a][d] ~= nil then
			header = header .. Pets[a][d] .. "\t"
		else
			header = header .. " " .. "\t"
		end
	end
	for c,d in pairs(currency) do
		print(Pets[a][d])
		header = header .. Pets[a][d] .. "\t"
	end
	header = header .. "\n"
end
appendfile("pets.txt", header)			


		
	
















