--[[
  moonux-corelib:gps
  GPS API replacement
  
  Made by thecrimulo
  ~ Moonux Project
]]--

dofile("/vit/vinit.old.l")
local gpslib = vinit.old.gps

local gpsc = {
  ['locate'] = gpslib.locate,
  ['vectorLocate'] = function(timeout)
    local vl = vector.new(gps.locate(timeout))
  end,
  ['away'] = function(current, host)
    local ad = current - host
    return ad.x, ad.y, ad.z
  end
}

gps = gpsc
_G['gps'] = gpsc
