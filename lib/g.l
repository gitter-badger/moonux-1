--[[
  mnx11: Moonux Satellite 11
  NAME:        /lib/g.l
  CATEGORY:    corelib
  VERSION:     11:310916A
  DESCRIPTION: _G Utils

  Made by thecrimulo
  ~ Moonux Project
]]--

local gl = {}

function gl.add(name,element)
	_G[name] = element
  if SYSDEBUG then print("[g.l] Added "..name.." to _G") end
end

function gl.remove(name)
	_G[name] = nil
  if SYSDEBUG then print("[g.l] Removed "..name.." from _G") end
end

function gl.exists(name)
	if not _G[name] == nil then return true else return false end
end

gl.add('g', gl)