--[[
  moonux-corelib:api
  API Loader for Moonux
  
  Made by thecrimulo
  ~ Moonux project
]]--

dofile("/vit/vinit.old.l")
local oslib = vinit.old.os
local iolib = vinit.old.io
local xstring = dofile("/lib/include/xstring.l")

api = {
  ['load'] = function(path)
    -- Is not library
    if not xstring.endsWith(path, ".l") then return nil end
    if not fs.exists(path) then return nil end
    pathr = shell.resolveProgram(path)
    local ftable = vinit.old.vdofile(path)
    _G[ftable] = ftable
  end,
  ['unload'] = function(api)
    for k, v in pairs(_G) do
      if k == api then
        _G[k] = nil
        return nil
      end
    end
    return nil
  end
}

_G['api'] = api
