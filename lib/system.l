--[[
  moonux-corelib:system
  System information API
  
  Made by thecrimulo
  ~ Moonux Project
]]--
sysc = {
  ['version'] = function() return "Moonux Satellite 10" end
  ['luaVersion'] = function() return _G['_VERSION'] end
  ['shortVersion'] = function() return "sat10" end
}

_G['system'] = sysc