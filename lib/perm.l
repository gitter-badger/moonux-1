--[[
  mnx11: Moonux Satellite 11
  NAME:        /lib/perm.l
  CATEGORY:    corelib
  VERSION:     11:90816A
  DESCRIPTION: Permission and user library

  Made by thecrimulo
  ~ Moonux Project
]]--

api.load('/lib/sha.l')

ftmode = false
if not g.exists('_u') then
	g.add('_u', {})
	ftmode = true
end

local filter = {'/vit', '/boot', '/core'}

local password = {}
function password.hash(raw)
	return sha.sha256(raw)
end

if ftmode then g.add('_cu', "root")

local user = {}
function user.add(name, hash)
	_u[name] == hash
	vold.fs.makeDir("/home/"..name)
	if SYSDEBUG then print("[perm.l] Added user "..user.." with hash "..hash) end
end

function user.exists(name)
	if _u[name] == nil then return false else return true end
end

function user.remove(name)
	if user.exists(name) then _u[name] = nil; vold.fs.delete("/home/"..name); return true
	if SYSDEBUG then print("[perm.l] Removed user "..user) end else return false end
end

function user.login(name, rawpass)
	if user.exists(name) then
		if password.hash(rawpass) == _u[name] then
			_cu = name return true
			if SYSDEBUG then print("[perm.l] Logged in: "..name) end
		else 
			return false
			if SYSDEBUG then print("[perm.l] Attempt to log in failed. Wrong password") end
		end
	else 
		return false
		if SYSDEBUG then print("[perm.l] Attempt to log in failed. Wrong user") end
	end
end

if ftmode then user.add("root", password.hash("root")) end
if ftmode then user.login("root", "root") end

local permission = {}
function permission.addUserToFile(file, user, canw, canx)
	addu = function(inner)
		for item in inner do
			if item['$isdir'] then addu(item)
			elseif item.name == file then item['users'] = {[user] = {['w'] = canw, ['x'] = canx}};
			if SYSDEBUG then print("[perm.l] Added "..user.." to "..file.." with custom wx permissions") end; break end
		end
	end
end

function permission.check(path, user, wx)
	if not user.exists(user) return false end
	for _,filt in filter do if string.startsWith(path, filt) then return false end
	local patht = string.seperate(path, "/")
	g.add('_tmp-permission-check', table.copy(_fs))
	c = 1
	while patht[c] != nil do
		_tmp-permission-check = _tmp-permission-check[patht[1]]
	end
	if not wx then
		return _tmp-permission-check.users[user]['w']
	else
		return _tmp-permission-check.users[user]['x']
	end
end

_G.perm = {user, permission}
