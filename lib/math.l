--[[
  moonux-corelib:math
  Math API replacement
  
  Made by thecrimulo
  ~ Moonux Project
]]--

dofile("/vit/vinit.old.l")
local mathlib = vinit.old.math

local mathc = {
  ['round'] = function(num, idp) return tonumber(string.format("%." .. (idp or 0) .. "f", num)) end
}

for k,v in pairs(mathlib) do mathc[k] = v end
math = mathc
_G['math'] = mathc
