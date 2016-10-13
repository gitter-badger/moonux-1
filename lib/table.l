--[[
  mnx11: Moonux Satellite 11
  NAME:        /lib/table.l
  CATEGORY:    corelib
  VERSION:     11:11016A
  DESCRIPTION: Table Utils

  Made by thecrimulo
  ~ Moonux Project
]]--

local tablei = {}
function tablei.inject(table1, table2, overwrite)
	overwrite = overwrite or false
	for key, value in pairs(table1) do
		if table2[key] == nil and not overwrite then table2[key] = value
		elseif overwrite then table2[key] = value
		else return false end
	end
	return true
end

function tablei.copy(table1)
	f = {}
	for k,v in pairs(table1) do f[k] = v end
	return f
end

tablei.inject(tablei, table)