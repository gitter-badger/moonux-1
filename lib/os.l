--[[
  moonux-corelib:os
  OS API replacement for Moonux
  
  Made by thecrimulo
  ~ Moonux project
]]--

dofile("/vit/vinit.old.l")
local oslib = vinit.old.os
local iolib = vinit.old.io
local fslib = vinit.old.fs
dofile("/lib/perm.l")


local function startsWith(str,Start) --Check if @str starts with @Start
    if not str then return nil end
    str = tostring(str)
    return str:sub(1,Start:len())==Start
end

local function endsWith(str,End)  --Check if @str ends with @End
    if not str then return nil end
    str = tostring(str)
    return End=='' or str:sub(#str-#End+1)==End
end

local function isVit(path)
  if startsWith(path, "/vit/") then return true else return false end
end

local osc = {
  ['version'] = oslib.version,
  ['getID'] = oslib.getComputerID,
  ['label'] = {
    ['set'] = oslib.setComputerLabel,
    ['get'] = oslib.getComputerLabel
  },
  ['run'] = function(env, path, ...)
    fuser = fslib.open("/vit/cu.v", "r")
    cuser = fuser.readAll()
    fuser.close()
    canw, canx = fidx.canAccess(cuser, path)
    print(canx)
    print(cuser)
    if canx then
      if isVit(path) and cuser ~= "root" then
        print("Permission denied.")
        return nil
      end
      oslib.run(env, path, ...)
    else
      print("Permission denied.")
      return nil
    end
  end,
  ['exec'] = function(env, path, args)
    local fcuser = fs.open("/vit/cu.v", "r")
    cuser = fcuser.read()
    fcuser.close()
    canw, canx = fidx.canAccess(cuser, file)
    if canx then
      if isVit(path) then
        print("Permission denied.")
        return nil
      end
      oslib.run(env, path, args)
    else
      print("Permission denied.")
      return nil
    end
  end,
  ['pullEvent'] = oslib.pullEventRaw,
  ['pullEventRaw'] = oslib.pullEventRaw,
  ['queueEvent'] = oslib.queueEvent,
  ['clock'] = oslib.clock,
  ['timer'] = {
    ['start'] = oslib.startTimer,
    ['stop'] = oslib.cancelTimer
  },
  ['time'] = oslib.time,
  ['sleep'] = oslib.sleep,
  ['wait'] = oslib.sleep,
  ['day'] = oslib.day,
  ['alarm'] = {
    ['set'] = oslib.setAlarm,
    ['cancel'] = oslib.cancelAlarm
  },
  ['power'] = {
    ['off'] = oslib.shutdown,
    ['shutdown'] = oslib.shutdown,
    ['restart'] = oslib.reboot,
    ['reboot'] = oslib.reboot
  },
  ['luaVersion'] = function() return _G._VERSION end
}

os = osc
so = osc
_G['os'] = osc
_G['so'] = osc
