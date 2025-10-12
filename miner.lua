function __BEGIN__()
	
end
function __CHECK__()
	local cTorch, cCoalBlock, cChest, cCobblestone, cChunkloader = {}, {}, {}, {}, {}
	term.write("Checking inventory, please wait\n")
	os.sleep(1)
	for num1 = 1, 5, 1 do
		print(textutils.serialise(turtle.getItemDetail(num1,true)))
		if turtle.getItemDetail(num1) == "minecraft:torch" then
			print("success") 
			cTorch[1], cTorch[2] = turtle.getItemDetail(num1), num1
		end
		if turtle.getItemDetail(num1) == "minecraft:coal_block" then
			print("success")
			cCoalBlock[1], cCoalBlock[2] = turtle.getItemDetail(num1), num1
		end
		if turtle.getItemDetail(num1) == "minecraft:chest" then 
			print("success")
			cChest[1], cChest[2] = turtle.getItemDetail(num1), num1
		end
		if turtle.getItemDetail(num1) == "mychunkloader:chunkloader" then
			print("success")
			cChunkloader[1], cChunkloader[2] = turtle.getItemDetail(num1), num1
		end
		if turtle.getItemDetail(num1) == "minecraft:cobblestone" then 
			print("success")
			cCobblestone[1], cCobblestone[2] = turtle.getItemDetail(num1), num1
		end
	end
	if not cTorch then
		return nil
	elseif not cCobblestone then
		return nil
	elseif not cCoalBlock then
		return nil
	elseif not cChunkloader then
		return nil
	elseif not cChest then
		return nil
	else
		return {cTorch, cCoalBlock, cChest, cCobblestone, cChunkloader}
	end
end
function __MAIN__()
	
end
--https://pastebin.com/8BvSBn1K