
local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   wait(1)
   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)


local wally = loadstring(game:HttpGet(("https://raw.githubusercontent.com/chamoe2005/script/main/wally"),true))()
local farm = wally:CreateWindow('Auto Farm')

	farm:Section("Farm")
    farm:Toggle('Auto-Bubble Blow', {flag = 'Bubble'})
    
local library = require(game.ReplicatedStorage:WaitForChild("Nevermore"):WaitForChild("Library"))
	
spawn(function()

	while(wait()) do
		local ohTable1 = 
		{
			[1] = {
				[1] = false
			},
			[2] = {
				[1] = 2
			}
		}

		if farm.flags.Bubble then
			library.Variables.AutoClicker = farm.flags.Bubble
			
			--if library.Variables.AutoClicker == false then
				--game:GetService("ReplicatedStorage").Remotes["blow bubble"]:FireServer(ohTable1)
				
			--end
		end
	end
end)