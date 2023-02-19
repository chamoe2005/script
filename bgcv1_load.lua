COREGUI = game:GetService("CoreGui")
if not game:IsLoaded() then
	local notLoaded = Instance.new("Message")
	notLoaded.Parent = COREGUI
	notLoaded.Text = 'Waiting for the game to load'
	game.Loaded:Wait()
	notLoaded:Destroy()
end

if game.placeId == 11746859781 then

	_G.startscript = true
	_G.canceltimeout = 10
	_G.autoloadsettings = true
	_G.ChallengeName = "Valentines"
	_G.ChallengeRemote = "claim valentines prize"

	print("BGS Script Loader Started")

	local wally = loadstring(game:HttpGet(("https://raw.githubusercontent.com/chamoe2005/script/main/wally"),true))()
	local confirm = wally:CreateWindow('Confirm')
	confirm:Section("Run Script")
	confirm:Button('Continue',function()
							_G.startscript = false
							spawn(function() 
									game:GetService("CoreGui").ScreenGui:Destroy()
									loadstring(game:HttpGet(("https://raw.githubusercontent.com/chamoe2005/script/main/bgc_script_v1.lua"),true))() 
									end)
								end)
	confirm:Button('Cancel',function()
								game:GetService("CoreGui").ScreenGui:Destroy()
								_G.startscript = false 
							end)

	wait(_G.canceltimeout)
	if _G.startscript then
		game:GetService("CoreGui").ScreenGui:Destroy()
		wait(1)
		spawn(function() loadstring(game:HttpGet(("https://raw.githubusercontent.com/chamoe2005/script/main/bgc_script_v1.lua"),true))() end)
	else
		return
	end
	
end