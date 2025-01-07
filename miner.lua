cCheckFront, blockDataFront = turtle.inspect()
cCheckUp, blockDataUp = turtle.inspectUp()
cCheckDown, blockDataDown = turtle.inspectDown()
data = blockDataFront["name"]
dataup = blockDataUp["name"]
datadown = blockDataDown["name"]
acceptableOres = {[1] = "minecraft:iron_ore",[2] = "minecraft:gold_ore",[3] = "minecraft:diamond_ore",[4] = "appliedenergistics2:quartz_ore",[5] = "appliedenergistics2:charged_quartz_ore",[6] = "minecraft:coal_ore",}
tRemainingNodes = {}
tDirections = {["n"] = 0, ["e"] = 1, ["s"] = 2, ["w"] = 3}
directionChoosingDone = false
function fAppendList(tBlockList)
	for number, tBlockList in ipairs(tBlockList) do
        table.insert(tRemainingNodes, tBlockList)
    end
return tRemainingNodes
end
 
function fLogBlock()
	number1 = 1
	repeat
		if data == acceptableOres[number1] then
			print("I found "..tostring(acceptableOres[number1]))
			return fFoundOre(acceptableOres[number1])
		elseif data == nil then
			print("I found "..tostring(nil))
		end
	number1 = number1+1
	until #acceptableOres < number1
	if data ~= acceptableOres[number1-1] then
		return fUnknownBlock(data)
	end
end

function fUnknownBlock()
	print("unknown block!")
end

function fFoundOre(oreBlock)
	for num = 1, 3, 1 do
		table.insert(remainingNodes, oreBlock)
	end 
end

function fSelfChecker()
	print("check self!")
end

function fChecker()
	if data == fLogBlock() then return fFoundOre(data)
	elseif dataup == fLogBlock() then return fFoundOre(dataup)
	elseif datadown == fLogBlock() then return fFoundOre(datadown)
	else local check1 = fUnknownBlock(data,dataup,datadown) end
	turtle.turnRight()
	if data == fLogBlock() then return fFoundOre(data)
	else local check2 = fUnknownBlock(data,dataup,datadown) end
	turtle.turnLeft(2)
	if data == fLogBlock() then return fFoundOre(data)
	else local check3 = fUnknownBlock(data,dataup,datadown) end
	return check1, check2, check3
end

function fChoiceMenu()
	local branchNum, layerNum, direction
	local condition1 = true
	local condition2 = true
	local condition3 = true
    while condition1 == true and condition2 == true and condition3 == true do
		if branchNum == nil then
			print("How many branches do you want?")
			local success, num1 = pcall(tonumber, read())
			if success then
				branchNum = num1
				condition1 = false
			else
				print("this is not an integer!")
			end
		end
		if layerNum == nil then
			print("How many layers do you want?")
			local success, num2 = pcall(tonumber, read())
			if success then
				layerNum = num2
				condition2 = false
			else
				print("this is not an integer!")
			end
		end
		if direction == nil then
			print([[In which direction (relative to the turtle) would you like to mine?
			(N)orth
			(E)ast
			(S)outh
			(W)est]])
			local success, direction = pcall(tDirections[string.lower(read())])
			if not success then print("N, E, S, or W please!") else condition3 = false end 
		end
	end
	return branchNum, layerNum, direction
end

function fBranchMining()
	local branchDistance
	local branchNum, layerNum, direction = fChoiceMenu()
	local branchLen = 2
	if branchNum == 1 then
		branchDistance = 0
	elseif branchNum > 1 then
		branchDistance = (branchNum-1)*3
	else 
		print("something is wrong with the value ("..tostring(branchNum)..") you inputted!")
		fBranchMining()
	end
	if turtle.getFuelLevel() < 15000 then
		turtle.select(1)
		repeat
			turtle.refuel()
		until turtle.getFuelLevel() > 15000
	end
	turtle.up()
	turtle.select(2)
	assert(turtle.placeDown())
	if direction ~= 0 and not directionChoosingDone then
		for num4 = 1, direction, 1 do
			turtle.turnRight()
		end
		directionChoosingDone = true
	end
	for num5 = 1, branchDistance, 3 do
		for num3 = 1, 13, 1 do
			turtle.dig()
			turtle.forward()
			--check
			turtle.digDown()
			turtle.down()
			--check
			turtle.up()
		end
		turtle.turnRight()
		for num6 = 0, branchDistance, 3 do
			turtle.dig()
			turtle.forward()
			--check
			turtle.digDown()
			turtle.down()
			--check
		end
	end
end
fBranchMining()
--https://pastebin.com/8BvSBn1K