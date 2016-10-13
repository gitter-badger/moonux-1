--[[
  mnx11: Moonux Satellite 11
  NAME:        /lib/fs.l
  CATEGORY:    corelib
  VERSION:     11:90816A
  DESCRIPTION: Filesystem library (mfs)

  Made by thecrimulo
  ~ Moonux Project
]]--

local fsl = {}
local fsin = {}

function fsl.tree(path)
  root = {}
  for _,a in pairs(vold.fs.list(path)) do
    if vold.fs.isDir(a) then
      recur = fsl.tree(a)
      recur['$isdir'] = true
      root[#root+1] = recur
    else
    	tbl = {['name'] = a}; tbl['$isdir'] = false
      root[#root+1] = tbl
    end
  end
  root['$isdir'] = true
  if SYSDEBUG then print("[fs.l] Tree of "..path.." was returned ("..root..")")
  return root
end

function fsin.initfs()
	g.add('_fs', {})
	_fs = fsl.tree("/")
	addu = function(inner)
		for _,item in pairs(inner) do
			if item['$isdir'] then addu(item) else item['users'] = {['root'] = {['w'] = "true", ['x'] = "true"}}
      if SYSDEBUG then print("[fs.l] Adding "..item.."to filesystem.") end end
		end
	end
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
  ['combine'] = fslib.combine,
  ['find'] = fslib.find,
  ['getDir'] = fslib.getDir,
  ['getParent'] = fslib.getDir
}

function fsl.makeDir(path)
	if perm.permission.check(path, _cu, false) then
		vold.fs.makeDir(path)
    if SYSDEBUG then print("[fs.l] Made directory: "..path) end
		return true
	else
		return false
	end
end

function fsl.move(from, to)
	if perm.permission.check(from, _cu, false) and perm.permission.check(to, _cu, false) then
		vold.fs.move(from, to)
    if SYSDEBUG then print("[fs.l] Moved "..from.." to "..to) end
		return true
	else
		return false
	end
end

function fsl.copy(from, to)
	if perm.permission.check(from, _cu, false) and perm.permission.check(to, _cu, false) then
		vold.fs.copy(from, to)
    if SYSDEBUG then print("[fs.l] Copied "..from.." to "..to) end
		return true
	else
		return false
	end
end

function fsl.delete(path)
	if perm.permission.check(path, _cu, false) then
		vold.fs.delete(path)
    if SYSDEBUG then print("[fs.l] Deleted "..path) end
		return true
	else
		return false
	end
end

table.inject(fsc, fsl)
fs = fsl