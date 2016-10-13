--[[
  mnx11: Moonux Satellite 11
  NAME:        /vit/vinit.d
  CATEGORY:    vital
  VERSION:     11:90816A
  DESCRIPTION: Init script for MS11

  Made by thecrimulo
  ~ Moonux Project
]]--

-- Checking if MOONUX_INIT, else close
if not MOONUX_INIT then return end

function printd(...) sleep(0.05); print(...) end

-- Creating table for the old libraries
vold = {}
if SYSDEBUG then printd("[vinit.d] Creating vold") end

vold.bit = bit
if SYSDEBUG then printd("[vinit.d] bit -> vold.bit"); printd("[vinit.d] Signature: "..tostring(vold.bit)) end
vold.colors = colors
if SYSDEBUG then printd("[vinit.d] colors -> vold.colors"); printd("[vinit.d] Signature: "..tostring(vold.colors)) end
vold.coroutine = couroutine
if SYSDEBUG then printd("[vinit.d] coroutine -> vold.coroutine"); printd("[vinit.d] Signature: "..tostring(vold.coroutine)) end
vold.disk = disk
if SYSDEBUG then printd("[vinit.d] disk -> vold.disk"); printd("[vinit.d] Signature: "..tostring(vold.disk)) end
vold.gps = gps
if SYSDEBUG then printd("[vinit.d] gps -> vold.gps"); printd("[vinit.d] Signature: "..tostring(vold.gps)) end
vold.help = help
if SYSDEBUG then printd("[vinit.d] help -> vold.help"); printd("[vinit.d] Signature: "..tostring(vold.help)) end
vold.http = http
if SYSDEBUG then printd("[vinit.d] http -> vold.http"); printd("[vinit.d] Signature: "..tostring(vold.http)) end
vold.io = io
if SYSDEBUG then printd("[vinit.d] io -> vold.io"); printd("[vinit.d] Signature: "..tostring(vold.io)) end
vold.fs = fs
if SYSDEBUG then printd("[vinit.d] fs -> vold.fs"); printd("[vinit.d] Signature: "..tostring(vold.fs)) end
vold.math = math
if SYSDEBUG then printd("[vinit.d] math -> vold.math"); printd("[vinit.d] Signature: "..tostring(vold.math)) end
-- Multishell can't be covered yet
vold.os = os
if SYSDEBUG then printd("[vinit.d] os -> vold.os"); printd("[vinit.d] Signature: "..tostring(vold.os)) end
vold.paintutils = paintutils
if SYSDEBUG then printd("[vinit.d] paintutils -> vold.paintutils"); printd("[vinit.d] Signature: "..tostring(vold.paintutils)) end
vold.parallel = parallel
if SYSDEBUG then printd("[vinit.d] parallel -> vold.parallel"); printd("[vinit.d] Signature: "..tostring(vold.parallel)) end
vold.peripheral = peripheral
if SYSDEBUG then printd("[vinit.d] peripheral -> vold.peripheral"); printd("[vinit.d] Signature: "..tostring(vold.peripheral)) end
vold.rednet = rednet
if SYSDEBUG then printd("[vinit.d] rednet -> vold.rednet"); printd("[vinit.d] Signature: "..tostring(vold.rednet)) end
vold.redstone = redstone
if SYSDEBUG then printd("[vinit.d] redstone -> vold.redstone"); printd("[vinit.d] Signature: "..tostring(vold.redstone)) end
vold.settings = settings
if SYSDEBUG then printd("[vinit.d] settings -> vold.settings"); printd("[vinit.d] Signature: "..tostring(vold.settings)) end
-- Shell cannot be covered either
vold.string = string
if SYSDEBUG then printd("[vinit.d] string -> vold.string"); printd("[vinit.d] Signature: "..tostring(vold.string)) end
vold.table = tabl
if SYSDEBUG then printd("[vinit.d] table -> vold.table"); printd("[vinit.d] Signature: "..tostring(vold.table)) end
vold.term = term
if SYSDEBUG then printd("[vinit.d] term -> vold.term"); printd("[vinit.d] Signature: "..tostring(vold.term)) end
vold.textutils = textutils
if SYSDEBUG then printd("[vinit.d] textutils -> vold.textutils"); printd("[vinit.d] Signature: "..tostring(vold.textutils)) end
vold.vector = vector
if SYSDEBUG then printd("[vinit.d] vector -> vold.vector"); printd("[vinit.d] Signature: "..tostring(vold.vector)) end
vold.window = window
if SYSDEBUG then printd("[vinit.d] window -> vold.window"); printd("[vinit.d] Signature: "..tostring(vold.window)) end

-- Moving vold to _G.vold
_G['vold'] = vold
if SYSDEBUG then printd("[vinit.d] Globalizing vold") end

--[[
	API LOAD QUEUE
	os.loadAPI()
	-> g.l
	-> debug.l
	-> api.l
	api.load()
	-- Timing --
	-> time.l
	-- Keyboard --
	-> key.l
	-- Encryption and hashing --
	-> aes.l
	-> sha.l
	-- HTTP and JSON --
	-> json.l
	-> http.l
	-- Table and String --
	-> table.l
	-> string.l
	-- Operating System --
	-> os.l
	-> color.l
	-> disk.l
	-> settings.l
	<> debug.l Should be here, but needs to be loaded before api.l
	-> perm.l - First perm to make fs load correctly
	-> fs.l
	-> io.l
	-> gps.l
	-> bit.l
	<> END OF LIBRARY LOADING SEQUENCE
]]--

os.loadAPI("/lib/g.l")
printd("[vinit.d] Loaded g.l")

os.loadAPI("/lib/debug.l")
debug.print("vinit.d", "Loaded debug.l")

os.loadAPI("/lib/api.l")
debug.print("vinit.d", "Loaded api.l")

api.load("/lib/time.l")
debug.print("vinit.d", "Loaded time.l")

api.load("/lib/key.l")
debug.print("vinit.d", "Loaded key.l")

api.load("/lib/aes.l")
debug.print("vinit.d", "Loaded aes.l")
api.load("/lib/sha.l")
debug.print("vinit.d", "Loaded sha.l")

api.load("/lib/json.l")
debug.print("vinit.d", "Loaded json.l")
api.load("/lib/http.l")
debug.print("vinit.d", "Loaded http.l")

api.load("/lib/table.l")
debug.print("vinit.d", "Loaded table.l")
api.load("/lib/string.l")
debug.print("vinit.d", "Loaded string.l")

api.load("/lib/os.l")
debug.print("vinit.d", "Loaded os.l")
api.load("/lib/color.l")
debug.print("vinit.d", "Loaded color.l")
api.load("/lib/disk.l")
debug.print("vinit.d", "Loaded disk.l")
api.load("/lib/settings.l")
debug.print("vinit.d", "Loaded settings.l")
api.load("/lib/perm.l")
debug.print("vinit.d", "Loaded perm.l")
api.load("/lib/fs.l")
debug.print("vinit.d", "Loaded fs.l")
api.load("/lib/io.l")
debug.print("vinit.d", "Loaded io.l")
api.load("/lib/gps.l")
debug.print("vinit.d", "Loaded gps.l")
api.load("/lib/bit.l")
debug.print("vinit.d", "Loaded bit.l")
if RESCUE then thread.new