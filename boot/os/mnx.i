--[[
	MNX SR12b : Moonux Satellite Rewrite 12B
	Made by thecrimulo

	NAME: /boot/os/mnx.i
	SET:  Boot RW12B
	TYPE: msti.code.lua
	DESCRIPTION
		This file is usually ran after /startup, and
		boots up, and sets the needed environment for
		Moonux.

		Read more in /man/bseq.man
	NOTES
		[1] This APIs are going to be replaced due to
		a change in the way the windows and terminals
		work, using xwindow.
]]--

dofile("/lib/core.l")

-- Make copy of old APIs
_G.orig = {
	bit        = bit,
	colors     = colors,
	coroutine  = coroutine,
	disk       = disk,
	fs         = fs,
	gps        = gps,
	help       = help,
	http       = http,
	io         = io,
	keys       = keys,
	math       = math,
	os         = os,
	paintutils = paintutils, -- See [1]
	parallel   = parallel,
	peripheral = peripheral,
	rednet     = rednet,
	redstone   = redstone,
	settings   = settings,
	string     = string,
	table      = table,
	term       = term,       -- See [1]
	textutils  = textutils,  -- See [1]
	vector     = vector,
	window     = window      -- See [1]
}

-- Cause the TLCO (/man/tlco.man)
local oPrintError = printError
function printError()
	local printError = oPrintError
	thread.new("/vit/sysload") -- Load the system lbs
end

