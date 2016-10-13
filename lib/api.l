--[[
  mnx11: Moonux Satellite 11
  NAME:        /lib/api.l
  CATEGORY:    corelib
  VERSION:     11:90816A
  DESCRIPTION: Library loader

  Made by thecrimulo
  ~ Moonux Project
]]--

apil = {}

local fslib = _G.vold.fs

apil.loaded = {}
apil.loading = {}
function apil.load(path)
  local apiName = fslib.getName(path)
  if apil.loading[apiName] == true then
  	error(apiName.." was already loading")
  	return false
  end
  apil.loading[apiName] = true
  local envt = {}
  setmetatable(envt, {__index = _G})
  local execApi, err = loadfile(path, envt)
  if execApi then
  	local ok, err = pcall(execApi)
  	if not ok then error(err);apil.loading[apiName]=nil
  	return false end
  else
  	error(err);apil.loading[apiName]=nil
  	return false
  end
  local apit = {}
  for k,v in pairs(envt) do
  	if k ~= "_ENV" then
  	  apit[k] = v
  	end
  end
  _G[apiName] = apit
  apil.loading[apiName] = nil
  apil.loaded[apiName] = true
  if SYSDEBUG then print("[api.l] Loaded API: "..apiName..":"..apit) end
  return true
end

function apil.unload(api)
  if api ~= "_G" and type(_G[api]) == "table" then
    if SYSDEBUG then print("[api.l] Unloading API: "..api..":".._G[api])
  	_G[api] = nil end
  end
end

_G['api'] = apil
_G['os']['loadAPI'] = nil
_G['os']['unloadAPI'] = nil