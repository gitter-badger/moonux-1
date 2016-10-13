--[[
  mnx11: Moonux Satellite 11
  NAME:        /lib/bit.l
  CATEGORY:    corelib
  VERSION:     11:90816A
  DESCRIPTION: Bit library

  Made by thecrimulo
  ~ Moonux Project
]]--


local bitlib = _G.vold.bit
local lbit = {}

-- Returns a binary num-indexes table as the deprecated function
function lbit.toBinary(decimal)
  local bin = tostring(tonumber(tostring(decimal),2)) -- To binary
  local tab = {}
  for b in str:gmatch"." do
    tab[#tab+1] = tonumber(b)
  end
  return tab
end

-- Returns a decimal number
function lbit.toDecimal(binTable)
  local bin = tostring(table.concat(binTable))
  local dec = tonumber(bin, 10)
  return dec
end

lbit.lshift = bitlib.blshift
lbit.rshift = bitlib.brshift
lbit.lrshift = bitlib.blogic_brshift
lbit.bnot = bitlib.bnot
lbit.band = bitlib.band
lbit.bnand = function(n, m) return bitlib.bnot(bitlib.band(n, m)) end
lbit.bor = bitlib.bor
lbut.bxor = bitlib.bxor
lbit.bxnor = function(n, m) return bitlib.bnot(bitlib.bxor(n, m)) end

bit = lbit
