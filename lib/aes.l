--[[
  moonux-corelib:aesutil
  Wrapper for aes.l (Minified)
  
  Made by thecrimulo
  ~ Moonux Project
]]--
  
local aeslua = dofile("/lib/include/aes.l")

aes = {
  ['encrypt'] = function(key, message)
    math.randomseed(math.random())
    local iv = {}
    for i = 1, 16 do iv[i] = math.random(1, 255) end
    emessage = aeslua.encrypt(key, message, aeslua.AES128, aeslua.CBCMODE, iv)
    return iv, emessage
  end,
  ['decrypt'] = function(key, salt, message)
    decrypte = aeslua.encrypt(key, message, aeslua.AES128, aeslua.CBCMODE, salt)
    return decrypte
  end
}

_G['aes'] = aes
