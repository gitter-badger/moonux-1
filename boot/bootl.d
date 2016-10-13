--[[
  moonux-boot:bootl
  Boot script for Moonux.
  To add detection for OSes and manage your entries, edit /boot
  You might want to disable automatic startup, then manually init 'startup'. This is to avoid hacking.
  WARNING: Other programs might rewrite your startup file, be careful with those.
  
  Made by thecrimulo
  ~ Moonux project
]]--

-- Load settings
dofile("/boot/bootl.conf")
-- Implicitly load xstring.l
local xstring = dofile("/lib/include/xstring.l")

outside = {['bootmedia'] = "craftOS", ['continueBinit'] = binit.runBinit}

function getOuts() return outside end

local function sfg(color) term.setTextColor(color) end
local function sbg(color) term.setBackgroundColor(color) end
local function sc(colora, colorb) term.setTextColor(colora); term.setBackgroundColor(colorb) end

term.clear()
sc(palette.text, palette.background)
print("[bootl] Bootl launched successfully.")
print("[bootl] Searching for devices...")
i = 1
craftosv = "craftOS:"..os.version()
entries = {craftosv, "luais"}
if fs.exists("/btld") then
  local filebtl = fs.open("/btld", "r")
  local btldos = filebtl.readAll()
  filebtl.close()
  entries[#entries+1] = btldos
elseif fs.exists("/disk/btld") then
  local filebtl = fs.open("/disk/btld", "r")
  local btldos = filebtl.readAll()
  filebtl.close()
  entries[#entries+1] = btldos
end
co = 1
for k,v in pairs(entries) do
  print(tostring(co), ". ", v, " >")
  co = co + 1
end
local typeEvent, value = os.pullEventRaw()
done = false
sc(palette.success, palette.background)
while not done do
  if typeEvent == "key" then
    if value == keys.one then
      print("[bootl] Booting into CraftOS")
      return -- Return to startup
    elseif value == keys.two then
      print("[bootl] Booting into LuaIS")
      term.clear()
      outside.bootmedia = "luais"
      return -- Return to startup
    elseif value == keys.three then
      print("[bootl] Booting into "..entries[3].."")
      outside.bootmedia = "/"..entries[3]..".vm"
      return -- Return to startup
    elseif value == keys.four then
      print("[bootl] Booting into "..entries[4].."")
      outside.bootmedia = "/"..entries[3]..".vm"
      return -- Return to startup
    end
  end
end
