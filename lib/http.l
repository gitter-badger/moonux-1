--[[
  moonux-corelib:io
  Replacement for the fs/io CCAPI
  
  Made by thecrimulo
  ~ Moonux Project, KernlORG
]]--

dofile("/vit/vinit.old.l")
local httplib = vinit.old.http

local httpc = {
  ['request'] = httplib.request,
  ['get'] = httplib.get,
  ['post'] = httplib.post,
  ['check'] = httplib.checkURL,
  ['toQuery'] = function(kvtable)
    query = ""
    for k, v in pairs(kvtable) do
      if k == nil or v == nil then
        util.printLog(k..":"..v.."is nil, returning error string... (Starts with '#')")
        return "#"..k..":"..v.."is nil"
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
}

http = httpc
_G['http'] = httpc
