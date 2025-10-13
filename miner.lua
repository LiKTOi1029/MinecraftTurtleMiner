function __CHECK__()
	local cTorch, cCoalBlock, cChest, cCobblestone, cChunkloader = {}, {}, {}, {}, {}
	term.write("Checking inventory, please wait\n")
	os.sleep(1)
	for num1 = 1, 5, 1 do
		local SelectedItem = textutils.serialise(turtle.getItemDetail(num1))["name"]
		if SelectedItem == "minecraft:torch" then
			print("Torches: success") 
			cTorch["Details"], cTorch["Location"] = SelectedItem, num1
		end
		if SelectedItem == "minecraft:coal_block" then
			print("CoalBlock: success")
			cCoalBlock["Details"], cCoalBlock["Location"] = SelectedItem, num1
		end
		if SelectedItem == "minecraft:chest" then 
			print("Chest: success")
			cChest["Details"], cChest["Location"] = SelectedItem, num1
		end
		if SelectedItem == "mychunkloader:chunkloader" then
			print("Chunkloader: success")
			cChunkloader["Details"], cChunkloader["Location"] = SelectedItem, num1
		end
		if SelectedItem == "minecraft:cobblestone" then 
			print("Cobblestone: success")
			cCobblestone["Details"], cCobblestone["Location"] = SelectedItem, num1
		end
	end
	if #cCobblestone = 0 then
		error("Add cobbletsone (a maximum of 64) to any one of the first 5 slots of the turtle")
	end
	if #cChunkloader = 0 then
		error("Add chunkloaders (a maximum of 64) to any one of the first 5 slots of the turtle")
	end
	if #cChest = 0 then
		error("Add chests (a maximum of 64) to any one of the first 5 slots of the turtle")
	end
	if #cCoalBlock = 0 then
		error("Add coal blocks (a maximum of 64) to any one of the first 5 slots of the turtle")
	end
	if #cTorch = 0 then
		error("Add torches (a maximum of 64) to any one of the first 5 slots of the turtle")
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
function __FOUND_ORE__(Block)
	
end
function __MINING__()
	local Pattern, cImportantItems = {["Length"] = 13, ["PerTunnel"] = 3, ["Tunnels"] = 5}, __CHECK__()	
	local ValidOres = {"minecraft:iron_ore", "minecraft:coal_ore", "minecraft:diamond_ore", "minecraft:lapis_lazuli_ore", "minecraft:gold_ore"}
	local function CheckSurroundingBlocks()
		local function Validifer(Block)
			for Number, Value in ipairs(ValidOres) do
				if textutils.serialise(Block)["name"] == Value then
					return __FOUND_ORE__(Value)
				end
			end
		end
		local Inspected = turtle.inspectDown()
		Validifier(Inspected)
		local Inspected = turtle.inspectUp()
		Validifier(Inspected)
		turtle.turnRight()
		local Inspected = turtle.inspect()
		Validifier(Inspected)
		turtle.turnLeft(2)
		local Inspected = turtle.inspect()
		Validifier(Inspected)
		turtle.turnRight()
	end
	local function TunnelingColumns()
		turtle.select(cImportantItems["Torches"]["Location"])
		turtle.placeDown()
		turtle.select(cImportantItems["Chunkloader"]["Location"])
		turtle.digUp()
		turtle.placeUp()
		for num1 = 0, Pattern["Length"], 1 do
			if num1 % 2 == 1 then
				turtle.dig()
				turtle.forward()
				CheckSurroundingBlocks()
				turtle.digDown()
				turtle.down()
				CheckSurroundingBlocks()
			else
				turtle.dig()
				turtle.forward()
				CheckSurroundingBlocks()
				turtle.digUp()
				turle.up()
				CheckSurroundingBlocks()
			end
		end
	end
	local function TunnelingRows()
		local LengthOfRow = (Patterns["Tunnels"]-1)*(Patterns["PerTunnel"])
		turtle.select(cImportantItems["Torches"]["Location"])
		turtle.placeDown()
		turtle.turnRight()
		for num1 = 0, LengthOfRow, 1 do
			if num1 % 3 == 0 then
				turtle.select(cImportantItems["Torches"]["Location"])
				turtle.placeDown()
			end
			if num1 % 2 == 1 then
				turtle.dig()
				turtle.forward()
				CheckSurroundingBlocks()
				turtle.digDown()
				turtle.down()
				CheckSurroundingBlocks()
			else
				turtle.dig()
				turtle.forward()
				CheckSurroundingBlocks()
				turtle.digUp()
				turle.up()
				CheckSurroundingBlocks()
			end
		end
	end
	
end
function __MAIN__()
	
end
--https://pastebin.com/8BvSBn1K