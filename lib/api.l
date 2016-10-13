--[[
	MNX SR12b : Moonux Satellite Rewrite 12B
	Made by thecrimulo

	NAME: /lib/lib.l
	SET:  Boot RW12B
	TYPE: msti.code.lua
	DESCRIPTION
		This library replaces os.loadAPI() and manages
		all the process differently.

		To see how this library works, see
		man/libformat.man
]]--

dofile("/lib/xstring.l")

lib        = {}
lib.loaded = {}

function lib.load(file)
	local tEnv = _ENV
	-- NOTE:
	-- _ENV depends on how this api is loaded and the
	-- context. If this library is loaded to the SU
	-- environment instead of the normal user one, it
	-- will use the one it will be called with. So it
	-- needs to be loaded (this library) when any of
	-- the users logs in. Remember to completely
	-- remove the API functions in OS.
	local self = {}
	self.file = file
	self.name = function()
		local a = old.fs.getName(path)
		local t = xstring.split(a, '.')
		return t[1] end
	self.name = self.name()
	self.