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

function table.copy( a, b )
	for k,v in pairs(b)
		do a[k] = v end end