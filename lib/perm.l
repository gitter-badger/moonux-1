--[[
	MNX SR12b : Moonux Satellite Rewrite 12B
	Made by thecrimulo

	NAME: /lib/perm.l
	SET:  Boot RW12B
	TYPE: msti.code.lua
	DESCRIPTION
		Library that manages permissions, users, logins
		and other related functions.

		Check /man/permissions.man
]]--

perm          = {}
perm.user     = {}
perm.password = {}
perm.keychain = {}
perm.system   = {}

perm.password.hash