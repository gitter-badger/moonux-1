--[[
  moonux-corelib:io
  Replacement for the fs/io CCAPI
  
  Made by thecrimulo
  ~ Moonux Project, KernlORG
]]--

local fslib = _G['fs']
local iolib = _G['io']
local tablelib = _G['table']
local perm = dofile("/lib/perm.l")

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

local fsc = {
  ['list'] = fslib.list,
  ['exists'] = fslib.exists,
  ['isDir'] = fslib.isDir,
  ['isDirectory'] = fslib.isDir,
  ['isReadOnly'] = fslib.isReadOnly,
  ['isReadonly'] = fslib.isReadOnly,
  ['getName'] = fslib.getName,
  ['getFinal'] = fslib.getName,
  ['getDrive'] = fslib.getDrive,
  ['getMount'] = fslib.getDrive,
  ['getSize'] = fslib.getSize,
  ['size'] = fslib.size,
  ['complete'] = fslib.complete,
  ['getFreeSpace'] = fslib.getFreeSpace,
  ['getHddBlank'] = fslib.getFreeSpace,
  ['makeDir'] = function(path)
    local fcuser = fslib.open("/vit/cu.v", "r")
    cuser = fcuser.read()
    fcuser.close()
    canw, canx = perm.canAccess(cuser, file)
    if canw then
      if isVit(path) then
        iolib.writeLine("Permission denied.")
        return nil
      end
      fslib.makeDir(path)
    else
      iolib.writeLine("Permission denied.")
      return nil
    end
  end,
  ['move'] = function(from, to)
    local fcuser = fslib.open("/vit/cu.v", "r")
    cuser = fcuser.read()
    fcuser.close()
    canw, canx = perm.canAccess(cuser, file)
    if canw then
      if isVit(path) then
        iolib.writeLine("Permission denied.")
        return nil
      end
      fslib.move(from, to)
    else
      iolib.writeLine("Permission denied.")
      return nil
    end
  end,
  ['copy'] = function(from, to)
    local fcuser = fslib.open("/vit/cu.v", "r")
    cuser = fcuser.read()
    fcuser.close()
    canw, canx = perm.canAccess(cuser, file)
    if canw then
      if isVit(path) then
        iolib.writeLine("Permission denied.")
        return nil
      end
      fslib.copy(from, to)
    else
      iolib.writeLine("Permission denied.")
      return nil
    end
  end,
  ['delete'] = function(path)
    local fcuser = fslib.open("/vit/cu.v", "r")
    cuser = fcuser.read()
    fcuser.close()
    canw, canx = perm.canAccess(cuser, file)
    if canw then
      if isVit(path) then
        iolib.writeLine("Permission denied.")
        return nil
      end
      fslib.delete(path)
    else
      iolib.writeLine("Permission denied.")
      return nil
    end
  end,
  ['remove'] = function(path)
    local fcuser = fslib.open("/vit/cu.v", "r")
    cuser = fcuser.read()
    fcuser.close()
    canw, canx = perm.canAccess(cuser, file)
    if canw then
      if isVit(path) then
        iolib.writeLine("Permission denied.")
        return nil
      end
      fslib.delete(path)
    else
      iolib.writeLine("Permission denied.")
      return nil
    end
  end,
  ['combine'] = fslib.combine,
  ['find'] = fslib.find,
  ['getDir'] = fslib.getDir,
  ['getParent'] = fslib.getDir,
  -- New: Gives a table tree including all subpaths from a root path
  ['dlist'] = function(path)
    root = {}
    for a in fs.list(path) do
      if fs.isDir(a) then
        recur = getSub(a)
        root[#root+1] = recur
      else
        root[#root+1] = a
      end
    end
    return root
  end,
  ['readLines'] = function(ofile)
    if isVit(ofile) then
        iolib.writeLine("Permission denied.")
        return nil
      end
    local file = iolib.open(ofile, "r")
    sc = file:read()
    file:close()
    tc = textutils.unserialize(sc)
    return tc
  end,
  ['open'] = function(file, mode)
    if isVit(file) then
        print("Permission denied.")
        return nil
      end
    local handle = fslib.open(file, 'r')
    hand = {}
    if mode == "r" then
      fslib.open(file, mode)
    else
      local fcuser = fslib.open("/vit/cu.v", "r")
      cuser = fcuser.read()
      fcuser.close()
      canw, canx = perm.canAccess(cuser, file)
      if canw then
        fslib.open(file, mode)
      else
        print("Permission denied.")
        return nil
      end
    end
    readLines = function(fle)
      local feele = iolib.open(fle, "r")
      sc = feele:read()
      feele:close()
      tc = textutils.unserialize(sc)
      return tc
    end
    hand['read'] = handle.read
    hand['readLine'] = handle.readLine
    hand['readAll'] = handle.readAll
    hand['close'] = handle.close
    hand['readLines'] = readLines
    return hand
  end
}

fs = fsc
_G['fs'] = fsc
