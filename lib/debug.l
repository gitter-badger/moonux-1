--[[
  mnx11: Moonux Satellite 11
  NAME:        /lib/debug.l
  CATEGORY:    corelib
  VERSION:     11:21016A
  DESCRIPTION: Logging library
  Made by thecrimulo
  ~ Moonux Project
]]--

g.add("debug", {})
debug.logfile = vold.fs.open("/log/"..os.clock()..".log", "w")
function debug.write(string) debug.logfile.write(string); debug.logfile.flush() end
function debug.line(string) debug.logfile.write(string.."\n"); debug.logfile.flush() end
function debug.print(suffix, string) print("["..suffix.."] "..string) end
function debug.shutdown() debug.logfile.close() end
function debug.error(file, line, error) term.setTextColor(color.red)
	print("["..file.."]:"..line..": "..error); term.setTextColor(color.white) end