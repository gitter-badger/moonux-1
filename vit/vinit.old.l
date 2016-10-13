--[[
  moonux-boot:vinit-old
  Sets vinit.old for every file
  
  Made by thecrimulo
  ~ Moonux Project
]]--

vinit = {['old'] = {}}

vinit.old['bit'] = bit
vinit.old['colors'] = colors
vinit.old['coroutine'] = coroutine
vinit.old['disk'] = disk
vinit.old['fs'] = fs
vinit.old['gps'] = gps
vinit.old['help'] = help
vinit.old['http'] = http
vinit.old['io'] = io
vinit.old['keys'] = keys
vinit.old['math'] = math
vinit.old['os'] = os
vinit.old['paintutils'] = paintutils
vinit.old['parallel'] = parallel
vinit.old['peripheral'] = peripheral
vinit.old['rednet'] = rednet
vinit.old['redstone'] = redstone
-- Below not in _G
vinit.old['shell'] = shell
vinit.old['string'] = string
vinit.old['table'] = table
vinit.old['textutils'] = textutils
vinit.old['vector'] = vector
vinit.old['window'] = window
-- Below EXCLUSIVELY on _G
vinit.old['vdofile'] = _G['dofile']
vinit.old['vprint'] = _G['print']

