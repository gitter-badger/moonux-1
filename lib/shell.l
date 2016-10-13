--[[
  moonux-corelib:shell
  Shell API replacement
  
  Made by thecrimulo
  ~ Moonux Project
]]--

shell.run("/vit/vinit.old.l")
local shelllib = vinit.old.shell
local iolib = vinit.old.io
local fslib = vinit.old.fs

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

local shellc = { 
  ['run'] = function(path, ...)
    local fcuser = fslib.open("/vit/cu.v", "r")
    cuser = fcuser.read()
    fcuser.close()
    if isVit(path) and cuser ~= "root" then
      iolib.writeLine("Permission denied.")
      return nil
    end
    canw, canx = perm.canAccess(cuser, path)
    print(tostring(canx))
    print(tostring(...))
    if canx then
      shell.run(path, ...)
    else
      iolib.writeLine("Permission denied.")
      return nil
    end
  end,
  ['openTab'] = function(path, ...)
    if isVit(path) then
      iolib.writeLine("Permission denied.")
      return nil
    end
    local fcuser = fslib.open("/vit/cu.v", "r")
    cuser = fcuser.read()
    fcuser.close()
    canw, canx = perm.canAccess(cuser, path)
    if canx then
      shell.openTab(path, ...)
    else
      iolib.writeLine("Permission denied.")
      return nil
    end
  end,
  ['completeProgram'] = shelllib.completeProgram
}


shelllib['run'] = nil
shelllib['openTab'] = nil
shelllib['completeProgram'] = nil
for k,v in pairs(shelllib) do shellc[k] = v end

shell = shellc
