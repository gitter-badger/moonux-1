--[[
  moonux-corelib:multishell
  Multishell API replacement
  
  Made by thecrimulo
  ~ Moonux Project
]]--

dofile("/vit/vinit.old.l")
local multishelllib = vinit.old.multishell
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

local multishellc = {
  ['launch'] = function(environment, path, ...)
    if isVit(path) then
      iolib.writeLine("Permission denied.")
      return nil
    end
    local fcuser = fslib.open("/vit/cu.v", "r")
    cuser = fcuser.read()
    fcuser.close()
    canw, canx = perm.canAccess(cuser, path)
    if canx then
      multishell.launch(environment, path, ...)
    else
      iolib.writeLine("Permission denied.")
      return nil
    end
  end
}

local nmultic = multishelllib
table.remove(nmultic, 'launch')

for k,v in pairs(multishellc) do
  nmultic[k] = v 
end

multishell = nmultic
