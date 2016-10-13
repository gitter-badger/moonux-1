--[[
  mnx11: Moonux Satellite 11
  NAME:        /lib/gps.l
  CATEGORY:    corelib
  VERSION:     11:90816A
  DESCRIPTION: GPS Library, OMPS alternative.
               Please, do not load omps.l

  Made by thecrimulo
  ~ Moonux Project
]]--

local gpslib = _G.vold.gps
local vectorlib = _G.vold.vector

gpsl = {}
gpsl.locate = gpslib.locate
function gpsl.vectorLocate(timeout)
  local rVector = vectorlib.new(gpslib.locate(timeout))
  return rVector
end
function gpsl.away(a, b)
  local ab = a - b
  return ab.x, ab.y, ab.z(current, host)
    local ad = current - host
    return ad.x, ad.y, ad.z
end

_G.gps = gpsl