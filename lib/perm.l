--[[
  moonux-corelib:perm
  Permission manager for Moonux
  
  Made by thecrimulo
  ~ Moonux project
]]--

-- Load aesutil.l
local aes = dofile("/lib/aes.l")
-- Load sha256.l
local sha = dofile("/lib/include/sha256.l")
-- Load include/xstring.l
local xstring = dofile("/lib/include/xstring.l")

dofile("/vit/vinit.old.l")
local iolib = vinit.old.io

if not fs.exists("/vit/hbi") then
  fs.makeDir("/vit/ul")
  local pf = fs.open("/vit/cu.v", "w"); pf.write("root"); pf.close()
end

keychain = {}


pkey = {}
function pkey.generate(datatable, index)
  key = "shk:"
  for data in datatable do
    key = key..aes.encrypt(sha.sha256("moonux:keydata-encrypt"), data)
  end
  keychain[index] = key
  return true
end
function pkey.remove(index)
  keychain[index] = nil
  return true
end

user = {}
function user.new(username, password, keyidx)
  if fs.isDir("/vit/ul"..username) then
    iolib.writeLine("[perm.l] Username already exists!")
    return false
  end
  os.mkdir("/vit/ul/"..username)
  local pwd = fs.open("/vit/ul/"..username.."/pwd.e", "w+")
  pwd.write(aes.encrypt(keychain[keyidx], password))
  pwd.close()
  os.mkdir("/home/"..username)
  return true
end
function user.cpwd(username, password, keyidx)
  if not fs.exists("/vit/ul"..username.."/pwd.e") then
    iolib.writeLine("[perm.l] Password doesn't exist! Create an user")
  end
  local pwd = fs.open("/vit/ul/"..username.."/pwd.e", "w+")
  pwd.write(aes.encrypt(keychain[keyidx], password))
  pwd.close()
  return true
end
function user.delete(username)
  if not fs.exists("/vit/ul/"..username) then
    iolib.writeLine("[perm.l] User doesn't exist!")
    return false
  end
  os.delete("/vit/ul"..username)
  return true
end
function user.login(user, pass, keyidx)
  if not fs.exists("/vit/ul/"..user) then
    iolib.writeLine("[perm.l] User doesn't exist!")
    return false
  end
  local password = fs.open("/vit/ul/"..user.."/pwd.e", "r")
  local pwd = password.readAll()
  password.close()
  pwd = aes.decrypt(keychain[keyidx], pwd)
  if pass == pwd then
    local cuf = fs.open("/vit/cu.v", "w+")
    cuf.write(user)
    cuf.close()
  else
    iolib.writeLine("[perm.l] Invalid password!")
  end
end
function user.logout()
  local cuf = fs.open("/vit/cu.v", "w+")
  cuf.write("")
  cuf.close()
end

fidx = {}
function fidx.add(user, path, canW, canX)
  if not fs.exists("/vit/ul/"..user.."/prmindex.v") then
    iolib.writeLine("[perm.l] prmindex.v doesn't exist!")
    return false
  end
  local prmidx = fs.open("/vit/ul/"..user.."/prmindex.v", "a")
  prmidx.writeLine(path..":"..canW..":"..canX)
  return true
end
-- Note on why not removing permissions:
-- All files and directories shall have a prmindex, instead, use .change()
function fidx.change(path, canW, canX)
  if not fs.exists("/vit/ul/"..user.."/prmindex.v") then
    iolib.writeLine("[perm.l] prmindex.v doesn't exist!")
    return false
  end
  local prmidx = fs.readLines("/vit/ul/"..user.."/prmindex.v")
  lc = 0
  for ln in prmidx do
    if xstring.startsWith(ln, path) then
      table.remove(prmidx, lc)
      table.insert(prmidx, lc, path..":"..canW..":"..canX)
    end
    lc = lc + 1
  end
  return true
end
-- Returns canW, canX
function fidx.canAccess(user, path)
  if user == "root" then
    return true, true
  end
  if not fs.exists("/vit/ul/"..user.."/prmindex.v") then
    print("[perm.l] prmindex.v doesn't exist!")
    return false
  end
  local prmidx = fs.readLines("/vit/ul/"..user.."/prmindex.v")
  for ln in prmidx do
    if xstring.startsWith(ln, path) then
      local p = split(split(ln, " ")[1], ":")
      return p[1], p[2]
    end
  end
end
