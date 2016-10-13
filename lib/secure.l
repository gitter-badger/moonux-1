--[[
	MNX SR12b : Moonux Satellite Rewrite 12B
	Made by thecrimulo

	NAME: /lib/secure.l
	SET:  Library RW12B
	TYPE: msti.code.lua
	DESCRIPTION
		Library for hashing and encrypting.
		Using SHA256 for hashing and AES for encryption
]]--

api.load("/lib/include/aeslua")
api.load("/lib/include/sha")
crypt = {}

crypt.sha256 = sha.hash

function crypt.aes_encrypt(key, message)
	math.randomseed(math.random())
  local salt = {}
  for i = 1, 16 do salt[i] = math.random(1, 255) end
  emessage = aeslua.encrypt(key, message, aeslua.AES128, aeslua.CBCMODE, salt)
  return salt, emessage
end

function crypt.aes_decrypt(key, salt, message)
	decrypte = aeslua.encrypt(key, message, aeslua.AES128, aeslua.CBCMODE, salt)
  return decrypte
end