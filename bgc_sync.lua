
--function()
	local version = "1.08"

	local sync = {["sync"] = 
					{["Auto-Bubble Blow V2"] = true,
					 ["Sell Bubble Delay"] = "0",
					 ["Sell Bubble Area"] = "None",
					 ["Free Prize Wheel"] = true,
					 ["Free Loot"] = true,
					 ["Claim Bubble Pass"] = true,
					 ["Fairy Exchange"] = true,
					 ["Spawn World Egg Quests"] = true,
					 ["Equip Best"] = true,
					 ["Delete Mode"] = "List of Names",
					 ["Pet Names"] = "Pop Cat,Huge Chill Axolotl,Huge Shark",
					 ["Delete Pet Type"] = "Both",
					 ["Auto Claim"] = true,
					 ["Auto Send"] = true,
					 ["Recipient"] = "xyzzy1111111122",
					 ["Gift Pet"] = "Void Shard,Galacticorn,Huge Lucky Cat,King Doggy,S3 Shard Spirit",
					 ["Pet Type"] = "Normal",
					 ["Num To Send"] = "1",
					 ["2x Coins "] = true,
					 ["2x Diamonds "] = true,
					 ["3x Shiny Luck "] = true,
					 ["Power 1 "] = false,
					 ["Power 2 "] = false,
					 ["Power 3 "] = false,
					 ["Fast Hatch "] = true,
					 ["Mega Luck "] = true,
					 ["Super Lucky "] = true,
					 ["1 Pet Level Use"] = true,
					 ["Power 1 Use"] = true,
					 ["Power 2 Use"] = true,
					 ["Hide Animation"] = true,
					 ["Buy Mode"] = "Best",
					 ["Common Egg"] = true,
					 ["Season 3 Egg"] = true,
					 ["Sky Island"] = true,
					 ["Heaven"] = true,
					 ["Space"] = true,
					 ["The Void"] = true,
					 ["Lucky Landing"] = true,
					 ["Fairy World"] = true,
					 ["VIP"] = true,
					 ["Server Sync"] = true
					 }
				 }
	sync["DadaRogueBlox"] = {}
	for a,b in pairs(sync["sync"]) do
		sync["DadaRogueBlox"][a] = b
	end
	sync["DadaRogueBlox"]["Power 3 "] = true

	sync["CheekyDeliverance"] = {}
	for a,b in pairs(sync["sync"]) do
		sync["CheekyDeliverance"][a] = b
	end
	sync["CheekyDeliverance"]["Power 3 "] = true
	

	return version, sync
				

--end
