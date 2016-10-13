--[[
  mnx11: Moonux Satellite 11
  NAME:        /lib/aes.l
  CATEGORY:    corelib
  VERSION:     11:90816A
  DESCRIPTION: AES Encryption library

  Made by thecrimulo
  ~ Moonux Project
]]-- NOTE: /lib/include/aeslua is slightly minified

aesl = {}
os.loadAPI("/lib/include/aeslua")

-- It does automatic salt
function aesl.encrypt(key, message)
  math.randomseed(math.random())
  local salt = {}
  for i = 1, 16 do salt[i] = math.random(1, 255) end
  emessage = aeslua.encrypt(key, message, aeslua.AES128, aeslua.CBCMODE, salt)
  return salt, emessage
end

function aesl.decrypt(key, salt, message)
  decrypte = aeslua.encrypt(key, message, aeslua.AES128, aeslua.CBCMODE, salt)
  return decrypte
end

_G['aes'] = aesl