CHUNKLOADER = "mychunkloader:chunkloader"
--[[
THIS IS ONLY WORKS ON CRAFTOS IN A MINECRAFT WORLD ON A TURTLE
THIS WAS NOT MADE FOR VANILLA LUA AND THUS WILL THROW MANY, MANY ERRORS!
--]]
function __BEGIN__()
	
end
function __CHECK__()
	term.write("Checking inventory, please wait\n")
	os.sleep(1)
	for num1 = 1, 5, 1 do
		print(textutils.serialise(turtle.getItemDetail(num1,true)))
		if turtle.getItemDetail(num1) == "minecraft:torch" then print("success") end
	end
end
function __SETTINGS__()
	return nil
end
function __MAIN__()
	term.write("What would you like to do?\n1)Setup/Check Inventory (recommended)\n2)Settings\n3)Begin\n4)Exit")
	while true
		local input = read("*l"):gsub("\n","")
		if tonumber(input) == 1 then __CHECK__()
		elseif tonumber(input) == 2 then __SETTINGS__()
		elseif tonumber(input) == 3 then __BEGIN__() 
		elseif tonumber(input) == 4 then break
		else term.write("Please pick a valid option\n") end
	end
	--add some code to contact ender modem when that component is ready.
end
--https://pastebin.com/8BvSBn1K