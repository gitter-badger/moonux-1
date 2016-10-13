--[[
  mnx11: Moonux Satellite 11
  NAME:        /lib/settings.l
  CATEGORY:    corelib
  VERSION:     11:21016A
  DESCRIPTION: Settings API

  Made by thecrimulo
  ~ Moonux Project
]]--

local lsettings = {}
function lsettings.set(key, value) vold.settings.set(key, value); vold.settings.save("/cfg/all")
if SYSDEBUG then print("[settings.l] Modified setting "..key.." with value "..value) end end
function lsettings.get(key) vold.settings.get(key) end
function lsettings.list()
	local curSettings = settings.getNames()
	for i = 1, #curSettings do
  textutils.pagedPrint( curSettings[i] .. ": " .. tostring( settings.get( curSettings[i] ) ) ) end
end
_G['settings'] = lsettings