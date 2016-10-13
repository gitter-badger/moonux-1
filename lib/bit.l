--[[
  moonux-corelib:bit
  Bit API replacement
  
  Made by thecrimulo
  ~ Moonux Project
]]--

dofile("/vit/vinit.old.l")
local bitlib = vinit.old.bit

local bitc = {
  ['blshift'] = bitlib.blshift,
  ['brshift'] = bitlib.brshift,
  ['blrshift'] = bitlib.blogic_rshift,
  ['bnot'] = bitlib.bnot,
  ['band'] = bitlib.band,
  ['bnand'] = function(n, m) return bitlib.bnot(bitlib.band(n, m)) end,
  ['bor'] = bitlib.bor,
  ['bxor'] = bitlib.bxor,
  ['bxnor'] = function(n, m) return birlib.bnot(bitlib.bxor(n, m)) end
}

bit = bitc
_G['bit'] = bitc
