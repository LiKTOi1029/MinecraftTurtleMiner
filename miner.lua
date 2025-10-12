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
			cTorch["Details"], cTorch["Location"] = turtle.getItemDetail(num1), num1
		end
		if turtle.getItemDetail(num1) == "minecraft:coal_block" then
			print("success")
			cCoalBlock["Details"], cCoalBlock["Location"] = turtle.getItemDetail(num1), num1
		end
		if turtle.getItemDetail(num1) == "minecraft:chest" then 
			print("success")
			cChest["Details"], cChest["Location"] = turtle.getItemDetail(num1), num1
		end
		if turtle.getItemDetail(num1) == "mychunkloader:chunkloader" then
			print("success")
			cChunkloader["Details"], cChunkloader["Location"] = turtle.getItemDetail(num1), num1
		end
		if turtle.getItemDetail(num1) == "minecraft:cobblestone" then 
			print("success")
			cCobblestone["Details"], cCobblestone["Location"] = turtle.getItemDetail(num1), num1
		end
	end
	for num1 = 6, 16, 1 do
		if turtle.getItemDetail(num1) then
			error("Please empty all slots past slot 6. They are required for storage purposes.")
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
	cImportantItems = 
end
--https://pastebin.com/8BvSBn1K