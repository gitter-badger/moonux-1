--[[
  mnx11: Moonux Satellite 11
  NAME:        /lib/osl.l
  CATEGORY:    corelib
  VERSION:     11:11016A
  DESCRIPTION: Operating System library

  Made by thecrimulo
  ~ Moonux Project
]]--

local osl = {}
function osl.version() return "Moonux Satellite 11.0" end
function osl.luaVersion() return _VERSION end
function osl.ccVersion() return vold.osl.version() end
function osl.uid() return vold.osl.id() end
osl.label = {}
function osl.label.get() return vold.osl.getLabel() end
function osl.label.set(l) vold.osl.setLabel(l) end
function osl.pullEvent() vold.osl.pullEventRaw end
function osl.queueEvent(...) vold.osl.queueEvent(...) end
osl.power = {}
function osl.power.shutdown(w) w = w or 0; vold.osl.sleep(w); MOONUX_SHUTDOWN = true end
function osl.power.forceoff(w) w = w or 0; vold.osl.sleep(w); os.shutdown() end
function osl.power.reboot(w) w = w or 0; vold.osl.sleep(w); osl.reboot() end
os.timer = {}
function osl.timer.start(t) vold.osl.startTimer(t) end
function osl.timer.stop(t) vold.osl.stopTimer(t) end
function osl.run(file, ...) thread.run(file, ...); if SYSDEBUG then print("[os.l] Executed "..file) end end
_G['os'] = osl
g.add("_dopt", {})