--[[
  mnx11: Moonux Satellite 11
  NAME:        /lib/io.l
  CATEGORY:    corelib
  VERSION:     11:90816A
  DESCRIPTION: Input/Output library

  Made by thecrimulo
  ~ Moonux Project
]]--

local iol = {}

function iol.readLines(ofile)
  local file = vold.io.open(ofile, "r")
  sc = file:read()
  file:close()
  tc = vold.textutils.unserialize(sc)
  return tc
end

function iol.open(ofile, mode)
	local handle = vold.fs.open(ofile, mode)
	hdl = {}
	hdl.close = handle.close
	hdl.flush = handle.flush
	if SYSDEBUG then print("[io] Attempt to open "..ofile)
	if mode == "r" then
		hdl.readLine = handle.readLine
		hdl.readLines = iol.readLines
		hdl.readAll = handle.readAll
		return hdl
	elseif mode == "w" or mode == "a" then
		if perm.permission.check(ofile, _cu, false)
		hdl.write = handle.write
		hdl.writeLine = handle.writeLine
	else return false end
end

iol.write = vold.io.write

_G.io = iol