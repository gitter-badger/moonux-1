--[[

	* CCBH *
	
	Name: Computercraft BIOS Helper
	First release: January 2016
	Version: 1.2.1
	State: stable
	A Developer Method computercraft software
	
]]--

-- [[ Welcome to CC BIOS Helper ]] --
-- [[ Modify the next part to customize your experience ]] -- 

-- Initial animation
	enableInitialAnimation = true
-- Custom animation text
	enableCustomAniText = true
-- Custom animation text
	customAniText = "Moonux Satellite 10"
-- Minimum CraftOs version
	minimumCraftOsVersion = 1.6
-- Minimum needed space
	minimumNeededSpace = 150
-- Autorun program
	biosSoftware = "/boot/init/biosup.d"
-- Autorun sleep time
	biosSleep = 1
-- Error sleep time
	errorSleep = 10

-- [[ Do not modify beneath if you don't know what are you doing ]] --

if enableInitialAnimation then
animationY = 6
term.clear()
if enableCustomAniText then
CustomX = (51-#customAniText)/2
term.setCursorPos(CustomX,14)
print(customAniText)
else
term.setCursorPos(18,animationY+8)
print("CC BIOS Helper")
end
	
	for i=1,6 do
	sleep(0.04)
	term.setCursorPos(21,animationY)
	print("00====00")
	animationY = animationY + 1
	end
	animationY = 6
	for i=1,6 do
	sleep(0.04)
	term.setCursorPos(21,animationY)
	print("OO----OO")
	animationY = animationY + 1
	end
	
sleep(0.5)
end
	-- Color settings
		if term.isColor() then
				bgColor = colors.blue
				errorColor = colors.red
				errorBgColor = colors.blue
			else
				bgColor = colors.gray
				errorColor = colors.gray
				errorBgColor = colors.lightGray
			end

	-- Setting up the screen 
term.setBackgroundColor(bgColor)
term.clear()
term.setTextColor(colors.white)
term.setCursorPos(19,1)
print("CC BIOS Helper")

	-- Creating UI
term.setCursorPos(1,2)
print("---------------Moonux Satellite 10-----------------")
sleep(0.01)
term.setCursorPos(1,17)
print("----------------------BIOS-------------------------")
sleep(0.01)
term.setCursorPos(1,11)
print("------------------------")
sleep(0.01)
for i=1,14 do
term.setCursorPos(25,2+i)
print("|")
end
for i=1,10 do
term.setCursorPos(40,2+i)
print("|")
end
sleep(0.01)
term.setCursorPos(41,7)
print("-----------")
sleep(0.01)
term.setCursorPos(41,12)
print("-----------")
sleep(0.01)

	-- Writing the checking steps
term.setCursorPos(1,3)
print("Screen check ")
sleep(0.01)
print("Mod check ")
sleep(0.01)
print("Free space check ")
sleep(0.01) 
print("Finding a disk ")
sleep(0.01)
print("Finding a modem ")
sleep(0.01)
print("Finding a printer ")
sleep(0.01)
print("Finding a monitor ")
sleep(0.01)
print("Autorun software")
sleep(0.01)
print("")
print("Version: ")
sleep(0.01)
print("Computer ID: ")
sleep(0.01)
print("Computer label:")
print("")
sleep(0.01)
print("Computer type: ")
sleep(0.01)
term.setCursorPos(27,3)
print("% Used space")
sleep(0.01)
term.setCursorPos(29,4)
print("\30")
for Is=1,10 do
term.setCursorPos(29,4+Is)
print("|")
end
term.setCursorPos(29,15)
print("0")
for Is=1,8 do
term.setCursorPos(29+Is,15)
print("-")
end
term.setCursorPos(37,15)
print("\16")
sleep(0.01)
term.setCursorPos(31,16)
print("T")
sleep(0.01)
term.setCursorPos(33,16)
print("R")
sleep(0.01)
term.setCursorPos(35,16)
print("D")
sleep(0.01)
term.setCursorPos(41,14)
print("T = '/'")
sleep(0.01)
term.setCursorPos(41,15)
print("R = '/rom'")
sleep(0.01)
term.setCursorPos(41,16)
print("D = '/disk'")
sleep(0.01)
term.setCursorPos(42,3)
print("Computer")
sleep(0.01)
term.setCursorPos(41,5)
print("X = ")
sleep(0.01)
term.setCursorPos(41,6)
print("Y = ")
sleep(0.01)
term.setCursorPos(42,8)
print("Monitor")
sleep(0.01)
term.setCursorPos(41,10)
print("X = ")
sleep(0.01)
term.setCursorPos(41,11)
print("Y = ")
sleep(0.01)


-- Output functions

	-- Screen check notifier
		function resultNotifier(col,coly,tf)
			if col == 1 then
			
				if tf == true then
				term.setCursorPos(23,coly)
					print("OK")
				elseif tf == false then
				term.setCursorPos(23,coly)
					print("NO")
				end
			elseif col == 2 then
				
				if tf == true then
				term.setCursorPos(50,coly)
					print("OK")
				elseif tf == false then
				term.setCursorPos(50,coly)
					print("NO")
				end
			end
		end

	-- Error notifier
		
		function errorNotifier(str,av,rv)
			term.setBackgroundColor(errorBgColor)
			term.clear()
			term.setCursorPos(1,6)
			term.setBackgroundColor(errorColor)
			print("                                                   ")
			print("                                                   ")
			print("                                                   ")
			print("                                                   ")
			print("                                                   ")
			print("                                                   ")
			print("                                                   ")
			print("                                                   ")
			term.setCursorPos(23,6)
			print("Error")
				print("Error string: ")-- 14,7
			term.setCursorPos(1,12)
				print("Actual value: ")-- 15,12
			term.setCursorPos(1,13)
				print("Needed value: ")-- 15,13
				
			term.setCursorPos(15,7)
			print(str)
			term.setCursorPos(15,12)
			print(av)
			term.setCursorPos(15,13)
			print(rv)
			sleep(errorSleep)
			term.setBackgroundColor(colors.black)
			term.clear()
			term.setCursorPos(1,1)
			shell.run("/rom/programs/shell")
			end
	
	-- Get size [Made by lyqyd - http://bit.ly/1YYqEoy]
		function getSize(path)
		  local size = 0
		  for _, file in ipairs(fs.list(path)) do
			if fs.isDir(fs.combine(path, file)) then
			  size = size + getSize(fs.combine(path, file))
			else
			  size = size + fs.getSize(fs.combine(path, file))
			end
		  end
		  return size
		end
		
	-- String notifier
	
		function stringNotifier(str)
			term.setCursorPos(1,18)
			write("                                                   ")
			write("                                                   ")
			term.setCursorPos(1,18)
			write(str)
		end
		
	-- Chart creator
		
function tableLines(xPos,yPos,inputTable,title,titlepos)
dtable = inputTable
scale={}
columns={}
-- Function datas
inputType = type(dtable)
maxValue = math.max(unpack(dtable))
yAxisScale = math.floor((maxValue/5)*10)*0.1
xAxisL = #dtable * 2
for tableY=1,5 do
table.insert(scale,math.floor((yAxisScale+yAxisScale*(5-tableY))+0.5))
end

if inputType ~= "table" then error("Invalid input") end
 if maxValue <= 9 then
  for yAxisN=1,maxValue do
   term.setCursorPos(xPos,yPos+yAxisN)
   write(maxValue-yAxisN+1)
  end
   term.setCursorPos(xPos+1,yPos)
   write("\30")
  for yAxisL=1,maxValue do
   term.setCursorPos(xPos+1,yPos+yAxisL)
   write("|")
   term.setCursorPos(xPos+1,yPos+1+yAxisL)
   write("0")
   yAxisEnd = yAxisL
  end
 else
  for yAxisN=1,5 do
   lynePos = string.len(maxValue)-string.len(scale[yAxisN])+1
   term.setCursorPos(lynePos+xPos-1,yPos+(yAxisN*2)-1)
   write(scale[yAxisN])
  end
   lynePos = string.len(maxValue)
   term.setCursorPos(xPos+lynePos,yPos)
   write("\30")
  for yAxisL=1,10 do
  lynePos = string.len(maxValue)+1
   term.setCursorPos(xPos+lynePos-1,yPos+yAxisL)
   write("|")
   term.setCursorPos(xPos+lynePos-1,yPos+1+yAxisL)
   write("0")
   yAxisEnd = yAxisL
  end
 end
  for xAxisD=1,xAxisL+1 do
   term.setCursorPos(xPos+string.len(maxValue)+xAxisD,yPos+yAxisEnd+1)
    write("-")
   write("\16")
  end
 if maxValue > 9 then
  for columnN=1,#dtable do
    if dtable[columnN] == 0 then
     table.insert(columns,0)
	elseif dtable[columnN] > 0 and dtable[columnN] < scale[5] then
	 table.insert(columns,1)
	elseif dtable[columnN] == scale[5] then
	 table.insert(columns,2)
	elseif dtable[columnN] > scale[5] and dtable[columnN] < scale[4] then
	 table.insert(columns,3)
	elseif dtable[columnN] == scale[4] then
	 table.insert(columns,4)
	elseif dtable[columnN] > scale[4] and dtable[columnN] < scale[3] then
	 table.insert(columns,5)
	elseif dtable[columnN] == scale[3] then
	 table.insert(columns,6)
	elseif dtable[columnN] > scale[3] and dtable[columnN] < scale[2] then
	 table.insert(columns,7)
	elseif dtable[columnN] == scale[2] then
	 table.insert(columns,8)
	elseif dtable[columnN] > scale[2] and dtable[columnN] < scale[1] then
	 table.insert(columns,9)
	elseif dtable[columnN] == scale[1] then
	 table.insert(columns,10)
	end
  end
 else
  for columnN=1,#dtable do
   table.insert(columns,dtable[columnN])
   end
 end
 for drowColumnN=1,#dtable do
  for drowCol=1,columns[drowColumnN] do
   term.setCursorPos(xPos+string.len(maxValue)+drowColumnN*2,yPos+yAxisEnd-(columns[drowColumnN]-drowCol))
   write("#")
  end
 end
 if titlepos == 1 then
  term.setCursorPos(xPos+string.len(maxValue)+2,yPos)
  write(title)
 elseif titlepos == 2 then
  term.setCursorPos(xPos+string.len(maxValue)+1,yPos+yAxisEnd+2)
  write(title)
 elseif titlepos == 3 then
 term.setCursorPos(xPos+string.len(maxValue)+xAxisL+2,yPos+2)
  write(title)
 elseif titlepos == 0 then
 else
  error("Invalid title position")
 end
end

-- Checking steps

	-- Screen Value Check
	sx, sy = term.getSize()
	stringNotifier("Checking the monitor")
	if (sx == 51) and (sy == 19) then
		resultNotifier(1,3,true)
		if (sx == 26) and (sy == 20) then
			errorNotifier("CCBH isn't supported on pocket computers","Pocket Computer","Advanced Computer")
		elseif (sx == 39) and (sy == 13) then
			errorNotifier("CCBH isn't supported on turtle","Turtle","Advanced Computer")
		end
	end
	
	sleep(0.01)
	
	-- CraftOs Version Check
	stringNotifier("Checking the CraftOS version")
	ver = os.version()
	cros=string.sub(ver,1,8)
	v=string.sub(ver,9,11)
	local ver = tonumber(v)
	
	 if ver <= minimumCraftOsVersion then
		errorNotifier("Needed a more recent version of the mod",v,minimumCraftOsVersion)
	else
		resultNotifier(1,4,true)
	 end
	
	sleep(0.01)
	
	-- Free space check
		
		stringNotifier("Checking the space availability")
		tfFreeSpace = tonumber(fs.getFreeSpace("/")) >= minimumNeededSpace
		
	if not tfFreeSpace then
		errorNotifier("Needed more free space",fs.getFreeSpace("/"),minimumNeededSpace.." or more")
	else
		resultNotifier(1,5,true)
	end
	
	sleep(0.01)
	
	-- Connected dirve check
	
	stringNotifier("Checking for connected disks")
		Disk_Check_result = false
	-- Made by ThatParadox - http://pastebin.com/K7WavBcP
	for a,b in pairs(rs.getSides()) do
	  if peripheral.getType(b) == "drive" then
	   Disk_Check_result = true
	   break
	  end
	end
	
	if Disk_Check_result then
		resultNotifier(1,6,true)
		else
		resultNotifier(1,6,false)
		end
	
	-- Connected modem check
	
	stringNotifier("Checking for connected modems")
	
	if peripheral.find("modem") then
		resultNotifier(1,7,true)
		else
		resultNotifier(1,7,false)
		end
	
	-- Connected printer check
	
	stringNotifier("Checking for connected printers")
	
		if peripheral.find("printer") then
		resultNotifier(1,8,true)
		else
		resultNotifier(1,8,false)
		end
	
	-- Connected monitor check
	
		stringNotifier("Checking for connected monitors")
	
		if peripheral.find("monitor") then
		resultNotifier(1,9,true)
		Monitor_Check_result = true
		else
		resultNotifier(1,9,false)
		Monitor_Check_result = false
		end
	
	-- Autorun software check
	
		stringNotifier("Checking the autorun software")
	
		if fs.exists(biosSoftware) then
			resultNotifier(1,10,true)
		else
			resultNotifier(1,10,false)
			errorNotifier("Failed to check the autorun software","No software",biosSoftware)
		end
		
	-- Computer info panel
		-- CC version 
			stringNotifier("Getting computercraft version")
			term.setCursorPos(10,12)
			print(os.version())
			sleep(0.08)
		-- Computer ID
		stringNotifier("Getting computer ID")
			term.setCursorPos(14,13)
			print(os.getComputerID())
			sleep(0.08)
		-- Computer label
		stringNotifier("Getting computer label")
			computerLabel = os.getComputerLabel()
			
			if computerLabel == nil then
				term.setCursorPos(2,15)
				print("No label")
			else
				if #computerLabel > 23 then
					PcLabel = string.sub(computerLabel,1,19).."..."
					term.setCursorPos(2,15)
					print(PcLabel)
				else
					term.setCursorPos(2,15)
					print(computerLabel)
				end
			end
		sleep(0.08)
		-- Computer type
		term.setCursorPos(16,16)
			if term.isColor() then
				print("Advanced")
			else
				print("Normal")
			end
			
			sleep(0.04)
		
	-- Used space
	
		stringNotifier("Creating used space chart")
	
		Spchart={}
	
		usedSpace = getSize("/")
		freeSpace = fs.getFreeSpace("/")
		space = usedSpace+freeSpace
		Ch_D_TotalSpace = math.floor((usedSpace/space)*100 + .5)
		RomusedSpace = getSize("/rom")
		Ch_D_RomSpace = math.floor((RomusedSpace/space)*100 + .5)
		
		if Disk_Check_result then
			DiskusedSpace = getSize("/disk")
			Ch_D_DiskUsedSpace = (DiskusedSpace / space) * 100
			Ch_D_DiskUsedSpace = math.floor(Ch_D_DiskUsedSpace + .5)
		else
			Ch_D_DiskUsedSpace = 0
		end

		table.insert(Spchart, Ch_D_TotalSpace)
		table.insert(Spchart, Ch_D_RomSpace)
		table.insert(Spchart, Ch_D_DiskUsedSpace)
		
		
		tableLines(27,4,Spchart,"",0)
	
		sleep(0.04)
	
	-- Computer & monitor sizes
	
		cx, cy = term.getSize()
		term.setCursorPos(45,5)
		print(cx)
		sleep(0.01)
		term.setCursorPos(45,6)
		print(cy)
		sleep(0.01)
	
		if Monitor_Check_result then
		
			-- Made by ThatParadox - http://pastebin.com/K7WavBcP
			for a,b in pairs(rs.getSides()) do
			  if peripheral.getType(b) == "monitor" then
			   monitor = peripheral.wrap(b)
			   break
			  end
			end
			
			mx, my = monitor.getSize()
			term.setCursorPos(45,10)
			print(mx)
			sleep(0.01)
			term.setCursorPos(45,11)
			print(my)
		
		else
			term.setCursorPos(45,10)
			print("00")
			sleep(0.01)
			term.setCursorPos(45,11)
			print("00")
		end
		
		stringNotifier("Starting bios software in "..biosSleep.."s")
	
term.setCursorPos(1,19)
sleep(biosSleep)
os.run({},biosSoftware)
