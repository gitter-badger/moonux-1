--[[
	MNX SR12b : Moonux Satellite Rewrite 12B
	Made by thecrimulo

	NAME: /lib/core.l
	SET:  Library RW12B
	TYPE: msti.code.lua
	DESCRIPTION
		Used by /startup, loads useful functions for
		all the system
]]--

core = {table={}}

-- local copy = core.table.copy
-- local a = {1,2,3}
-- local b = {4,5,6}
-- a:copy(b)
function core.table.copy( a, b )
	for k,v in pairs(b)
		do a[k] = v end
end

-- local set = core.set
-- local function fn(a) return a end
-- local a = a:set(a)
function core.call( tArgs, fnExec )
	return fnExec(table.unpack(tArgs))
end