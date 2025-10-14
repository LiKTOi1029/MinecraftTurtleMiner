function __CHECK__()
	local cTorch, cCoalBlock, cChest, cCobblestone, cChunkloader = {[1] = "hello"}, {}, {}, {}, {}
	local Debug = "[DEBUG]: "
	term.write("Checking inventory, please wait\n")
	os.sleep(1)
	for num1 = 1, 5, 1 do
		local SelectedItem = turtle.getItemDetail(num1)["name"]
		print(Debug..SelectedItem)
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
		print(Debug..#cTorch.." "..#cCoalBlock..""..#cChunkloader..""..#cChest..""..#cCobblestone)
	end
	if not cCobblestone["Details"] then
		error("Add cobblestone (a maximum of 64) to any one of the first 5 slots of the turtle")
	end
	if not cTorch["Details"] then
		error("Add chunkloaders (a maximum of 64) to any one of the first 5 slots of the turtle")
	end
	if not cChest["Details"] then
		error("Add chests (a maximum of 64) to any one of the first 5 slots of the turtle")
	end
	if not cCoalBlock["Details"] then
		error("Add coal blocks (a maximum of 64) to any one of the first 5 slots of the turtle")
	end
	if not cTorch["Details"] then
		error("Add torches (a maximum of 64) to any one of the first 5 slots of the turtle")
	end
	for num1 = 6, 16, 1 do
		local SelectedItem = turtle.getItemDetail(num1)
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
	print("Turtle refueled and ready for action.")
	return {["Torches"] = cTorch,
			["CoalBlock"] = cCoalBlock,
			["Chest"] = cChest,
			["Cobblestone"] = cCobblestone,
			["Chunkloader"] = cChunkloader}
end
function __FOUND_ORE__(Block)
	-- Not done yet.
end
function __MINING__()
	local Pattern, TunnelsLeft, cImportantItems = {["Length"] = 13, ["PerTunnel"] = 3, ["Tunnels"] = 5}, 5, __CHECK__()
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
		turtle.up()
		turtle.select(cImportantItems["Torches"]["Location"])
		turtle.placeDown()
		turtle.select(cImportantItems["Chunkloader"]["Location"])
		turtle.digUp()
		turtle.placeUp()
		turtle.down()
		for num1 = 0, Pattern["Length"], 1 do
			if num1 % 2 == 1 then
				turtle.dig()
				turtle.forward()
				--CheckSurroundingBlocks()
				turtle.digDown()
				turtle.down()
				--CheckSurroundingBlocks()
			else
				turtle.dig()
				turtle.forward()
				--CheckSurroundingBlocks()
				turtle.digUp()
				turtle.up()
				--CheckSurroundingBlocks()
			end
		end
	end
	local function TunnelingRows()
		local LengthOfRow = (Pattern["Tunnels"]-1)*(Pattern["PerTunnel"])
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
				--CheckSurroundingBlocks()
				turtle.digDown()
				turtle.down()
				--CheckSurroundingBlocks()
			else
				turtle.dig()
				turtle.forward()
				--CheckSurroundingBlocks()
				turtle.digUp()
				turle.up()
				--CheckSurroundingBlocks()
			end
		end
	end
	local function TravelingBetweenTunnels(Boolean)
		if Boolean == true then
			turtle.turnRight()
			turtle.forward(Pattern["PerTunnel"])
			turtle.turnRight()
		else
			turtle.turnLeft()
			turtle.forward(Pattern["PerTunnel"])
			turtle.turnLeft()
		end
	end
	TunnelingColumns()
	TunnelingRows()
	turtle.turnRight()
	for Iterations = 1, Patterns["Tunnels"]-1, 1 do
		TunnelingColumns()
		if Iterations % 2 == 1 then
			TravelingBetweenTunnels(true)
		else 
			TravelingBetweenTunnels(false)
		end
	end
end
__MINING__()
--https://pastebin.com/8BvSBn1K