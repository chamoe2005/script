_G.autoloadsettings = true

print("BGS Script Loader Started")

for i = 1, 30 do
	wait(1)
	print(30 - i)
end

loadstring(game:HttpGet(("https://raw.githubusercontent.com/chamoe2005/script/main/bgc_script_v1.lua"),true))()