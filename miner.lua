function __CHECK__()
	local cTorch, cCoalBlock, cChest, cCobblestone, cChunkloader = {}, {}, {}, {}, {}
	term.write("Checking inventory, please wait\n")
	os.sleep(1)
	for num1 = 1, 5, 1 do
		local SelectedItem = textutils.serialise(turtle.getItemDetail(num1))["name"]
		if SelectedItem == "minecraft:torch" then
			print("Torches: success") 
			cTorch["Details"], cTorch["Location"] = SelectedItem, num1
		else
			error("No torches between slots 1 and 5")
		end
		if SelectedItem == "minecraft:coal_block" then
			print("CoalBlock: success")
			cCoalBlock["Details"], cCoalBlock["Location"] = SelectedItem, num1
		else
			error("No coal blocks between slots 1 and 5")
		end
		if SelectedItem == "minecraft:chest" then 
			print("Chest: success")
			cChest["Details"], cChest["Location"] = SelectedItem, num1
		else
			error("No chests between slots 1 and 5")
		end
		if SelectedItem == "mychunkloader:chunkloader" then
			print("Chunkloader: success")
			cChunkloader["Details"], cChunkloader["Location"] = SelectedItem, num1
		else
			error("No chunkloaders between slots 1 and 5")
		end
		if SelectedItem == "minecraft:cobblestone" then 
			print("Cobblestone: success")
			cCobblestone["Details"], cCobblestone["Location"] = SelectedItem, num1
		else
			error("No cobblestone between slots 1 and 5")
		end
	end
	for num1 = 6, 16, 1 do
		local SelectedItem = textutils.serialise(turtle.getItemDetail(num1))
		if SelectedItem then
			error("Please empty slot "..num1..". Slots past slot 5 are used for Random Access Storage.")
		end
	end
	if turtle.getFuelLevel() < 20000 then
		turtle.select(cCoalBlock["Location"])
		while turtle.getFuelLevel() < 20000 do
			turtle.refuel()
		end
	end
	return {["Torches"] = cTorch,
			["CoalBlock"] = cCoalBlock,
			["Chest"] = cChest,
			["Cobblestone"] = cCobblestone,
			["Chunkloader"] = cChunkloader}
end
function __FOUND_ORE__()

end
function __MINING__()
	local StartingBlock = "minecraft:torch"
	
end
function __MAIN__()
	local cImportantItems = __CHECK__()
	
end
--https://pastebin.com/8BvSBn1K