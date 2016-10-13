--[[
	MNX SR12b : Moonux Satellite Rewrite 12B
	Made by thecrimulo

	NAME: /lib/env.l
	SET:  Library RW12B
	TYPE: msti.code.lua
	DESCRIPTION
		Environment and sandboxing library

    Read /man/tlco.man on the subject
]]--

env = {}

function env.create(tBase, tExclude)
	local tReturn = {}
	for bK, bV in pairs(tBase) do
		for eK, eV in pairs(tExclude) do
			if bK ~= eV then
				tReturn[bK] = bV
			end
		end
	end
	return tReturn end

function env.run(file, tEnv)
	loadfile(file, "bt", tEnv)() end

env.print = print