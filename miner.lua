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

--https://pastebin.com/8BvSBn1K