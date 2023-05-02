
--function()
	local version = 33

	local sync = {["sync"] = 
					{["Auto-Bubble Blow V2"] = true,
					 ["Sell Bubble Delay"] = "0",
					 ["Sell Bubble Area"] = "No Sell",
					 ["Free Prize Wheel"] = true,
					 ["Free Loot"] = true,
					 ["Claim Bubble Pass"] = false,
					 ["Fairy Exchange"] = true,
					 ["Spawn World Egg Quests"] = false,
					 ["Equip Best"] = true,
					 ["Delete Mode"] = "List of Names",
					 ["Pet Names"] = "Pop Cat,Huge Chill Axolotl,Huge Shark,Easter Chick Trio",
					 ["Delete Pet Type"] = "Both",
					 ["Auto Claim"] = true,
					 ["Auto Send"] = true,
					 ["Recipient"] = "CheekyDeliverance",
					 ["Gift Pet"] = "Gigantic Pop Cat,Huge Pop Cat",
					 ["Pet Type"] = "Both",
					 ["Num To Send"] = "1",
					 ["1 Pet Level Brew"] = false,
					 ["Max Pet Level Brew"] = false,
					 ["Power 1 Brew"] = false,
					 ["Power 2 Brew"] = false,
					 ["Power 3 Brew"] = false,
					 ["Bubbles Brew"] = false,
					 ["Shadow Brew"] = false,
					 ["2x Coins "] = true,
					 ["2x Diamonds "] = true,
					 ["3x Shiny Luck "] = true,
					 ["Power 1 "] = true,
					 ["Power 2 "] = true,
					 ["Power 3 "] = true,
					 ["Bubbles "] = true,
					 ["Shadow "] = true,
					 ["1 Pet Level "] = true,
					 ["Max Pet Level "] = true,
					 ["Fast Hatch "] = true,
					 ["Super Lucky "] = true,
					 ["1 Pet Level Use"] = false,
					 ["Power 1 Use"] = false,
					 ["Power 2 Use"] = false,
					 ["Hide Animation"] = true,
                                         ["Open Exclusive Eggs"] = true,
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
	sync["DadaRogueBlox"]["Mega Luck "] = true

	sync["CheekyDeliverance"] = {}
	for a,b in pairs(sync["sync"]) do
		sync["CheekyDeliverance"][a] = b
	end
	sync["CheekyDeliverance"]["Mega Luck "] = true
	sync["CheekyDeliverance"]["Auto Send"] = false
        sync["CheekyDeliverance"]["Recipient"] = ""
	sync["CheekyDeliverance"]["Gift Pet"] = ""
					
	return version, sync
				

--end
