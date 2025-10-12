function __BEGIN__()
	
end
function __CHECK__()
	local cTorch, cCoalBlock, cChest, cCobblestone, cChunkloader = {}, {}, {}, {}, {}
	term.write("Checking inventory, please wait\n")
	os.sleep(1)
	for num1 = 1, 5, 1 do
		print(textutils.serialise(turtle.getItemDetail(num1,true)))
		if turtle.getItemDetail(num1) == "minecraft:torch" then
			print("Torches: success") 
			cTorch["Details"], cTorch["Location"] = turtle.getItemDetail(num1), num1
		else
			error("No torches between slots 1 and 5")
		end
		if turtle.getItemDetail(num1) == "minecraft:coal_block" then
			print("CoalBlock: success")
			cCoalBlock["Details"], cCoalBlock["Location"] = turtle.getItemDetail(num1), num1
		else
			error("No coal blocks between slots 1 and 5")
		end
		if turtle.getItemDetail(num1) == "minecraft:chest" then 
			print("Chest: success")
			cChest["Details"], cChest["Location"] = turtle.getItemDetail(num1), num1
		else
			error("No chests between slots 1 and 5")
		end
		if turtle.getItemDetail(num1) == "mychunkloader:chunkloader" then
			print("Chunkloader: success")
			cChunkloader["Details"], cChunkloader["Location"] = turtle.getItemDetail(num1), num1
		else
			error("No chunkloaders between slots 1 and 5")
		end
		if turtle.getItemDetail(num1) == "minecraft:cobblestone" then 
			print("Cobblestone: success")
			cCobblestone["Details"], cCobblestone["Location"] = turtle.getItemDetail(num1), num1
		else
			error("No cobblestone between slots 1 and 5")
		end
	end
	for num1 = 6, 16, 1 do
		if turtle.getItemDetail(num1) then
			error("Please empty all slots past slot 5. They are required for random access storage.")
		end
	end
	if turtle.getFuelLevel() < 20000 then
		turtle.select(cCoalBlock["Location"])
		while turtle.getFuelLevel() < 20000 do
			turtle.refuel()
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
		return {["Torches"] = cTorch,
				["CoalBlock"] = cCoalBlock,
				["Chest"] = cChest,
				["Cobblestone"] = cCobblestone,
				["Chunkloader"] = cChunkloader}
	end
end
function __MAIN__()
	local cImportantItems = __CHECK__()
	
end
--https://pastebin.com/8BvSBn1K