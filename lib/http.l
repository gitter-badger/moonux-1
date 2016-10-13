--[[
  mnx11: Moonux Satellite 11
  NAME:        /lib/http.l
  CATEGORY:    corelib
  VERSION:     11:90816A
  DESCRIPTION: HTTP Library

  Made by thecrimulo
  ~ Moonux Project
]]--

local httplib = _G.vold.http

httpl = {}
httpl.request = httplib.request
httpl.get = httplib.get
httpl.post = httplib.post
httpl.check = httplib.checkURL
function httpl.toQuery(kvtable)
  query = ""
  for k, v in pairs(kvtable) do
    if k == nil or v == nil then
      return nil
    end
    if k == "cmd" then
      query = query..k.."="..v.."&"
    else
      query = query..k.."="..textutils.urlEncode(tostring(v)).."&"
    end
  end
    query = string.sub(query,1,-2)
  return query
end