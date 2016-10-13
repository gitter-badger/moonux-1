--[[
  mnx11: Moonux Satellite 11
  NAME:        /lib/object.l
  CATEGORY:    corelib
  VERSION:     11:080916A
  DESCRIPTION: Object creation and managing

  Made by thecrimulo
  ~ Moonux Project
]]--


local obj = {}
obj.p = {}
function obj.require(t_name, t_types, t_defaults)
	for _,name in pairs(t_name) do
		
