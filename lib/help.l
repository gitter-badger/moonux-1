--[[
  moonux-corelib:moon
  Help API replacement
  
  Made by thecrimulo
  ~ Moonux Project
]]--

dofile("/vit/vinit.old.l")
local helplib = vinit.old.help

local moonc = {
  ['moonpath'] = helplib.path,
  ['lookup'] = helplib.lookup,
  ['pages'] = helplib.topics,
  ['complete'] = helplib.completeTopic
}

helplib.setPath("/moon")

moon = moonc
_G['help'] = nil
_G['moon'] = moonc
