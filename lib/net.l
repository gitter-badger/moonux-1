--[[
  mnx11: Moonux Satellite 11
  NAME:        /lib/net.l
  CATEGORY:    corelib
  VERSION:     11:060916A
  DESCRIPTION: Rednet replacement

  Made by thecrimulo
  ~ Moonux Project
]]--

--[[ EXPLICIT USAGE
local netobj = netcl.init(side) 																		 -- Initializes and returns a new net object
local devices, computers, monitors, drives, printers = netobj:scan() -- Scans and filters all connected peripherals
netobj:open(65534)
if netobj:isOpen(65534) then ... end
netobj:close(65534)
netobj:broadcast("Test", "korg.netcl.tutorial")
netobj:send("Test", "korg.netcl.privateQEDC", 54)
local data, protocol, destiny = netobj:recieve("korg.netcl.privateQEDC", 10)
local data = _NETCLBUFFER[n][1]
_NETCLBUFFER[n].read = true

]]--


g.add("_NETCLBUFFER", {})

function explode(str, divider)  --Separates @str on @divider
	if not divider then return nil end
	str = tostring(str)
	local start = {}
	local endS = {}
	local n=1
	repeat
		if n==1 then
			start[n], endS[n] = find(str, divider)
		else
			start[n], endS[n] = find(str, divider, endS[n-1]+1)
        end
		n=n+1
	until start[n-1]==nil
	local subs = {}
	for n=1, #start+1 do
		if n==1 then
			subs[n] = str:sub(1, start[n]-1)
		elseif n==#start+1 then
			subs[n] = str:sub(endS[n-1]+1)
		else
			subs[n] = str:sub(endS[n-1]+1, start[n]-1)
        end
	end
	return subs
end

local netcl = {}
netcl.__index = netcl
setmetatable(netCl, {
  __call = function (cls, ...)
    return cls.new(...)
  end,
})
local sides = {"top", "bottom", "back", "front", "left", "right"}
local modem = {}

function netcl.init(sideOp)
	local self = setmetatable({}, MyClass)
	for _,side in sides do if sideOp == side then
		self.side = sideOp
	else return false end end
	return self
end

function netcl:scan()
	local modem = peripheral.wrap(self.side)
	local printers = {}
	local computers = {}
	local monitors = {}
	local drives = {}
	local devices = modem.getNamesRemote()
	for _,device in devices do
		local typeis = modem.getTypeRemote(device)
		if typeis == "computer" then computers[#computers+1] = device
		elseif typeis == "drive" then drives[#drives+1] = device
		elseif typeis == "monitor" then monitors[#monitors+1] = device
		elseif typeis == "printer" then printers[#printers+1] = device
		else return false end
	end
	return devices, computers, monitors, printers, drives
end

function netcl:open(channel)
	local modem = peripheral.wrap(self.side)
	if channel > 0 and channel < 65534 then
		modem.open(channel)
		return true
	else
		return false
	end
end

function netcl:isOpen(channel)
	local modem = peripheral.wrap(self.side)
	if channel > 0 and channel < 65534 then
		modem.isOpen(channel)
		return true
	else
		return false
	end
end

function netcl:close(channel)
	local modem = peripheral.wrap(self.side)
	if channel > 0 and channel < 65534 and modem.isOpen(channel) then
		modem.close(channel)
		return true
	else
		return false
	end
end

function netcl:closeAll()
	local modem = peripheral.wrap(self.side)
	modem.closeAll()
end

function netcl.serialize(data)
	local final = ""
	for tag, value in pairs(data) do
		final = final..tag..":"..value..";"
	end
	return final
end

function netcl.unserialize(data)
	local final = {}
	local tvpairs = explode(data, ";")
	local tmptv = {}
	for _, v in pairs(tvpairs) do
		tmptv = explode(v, ":")
		final[tmptv[1]] = tmptv[2]
	end
	return final
end

function netcl:broadcast(data, protocol)
	local modem = peripheral.wrap(self.side)
	local snd = {
	['data'] = data,
	['protocol'] = protocol
	}
	modem.open(65535)
	modem.transmit(65535, os.uid(), netcl.serialize(snd))
	modem.close(65535)
end

function netcl:send(data, protocol, uid)
	local modem = peripheral.wrap(self.side)
	local snd = {
	['data'] = data,
	['protocol'] = protocol,
	['recieve'] = uid
	}
	if uid == os.uid() then
		os.queueEvent("netcl_data", data, protocol, uid) return true end
	modem.open(65535)
	modem.transmit(65535, os.uid(), netcl.serialize(snd))
	modem.close(65535)
	return true
end

function netcl:recieve(protocol, timeout)
	local modem = peripheral.wrap(self.side)
	local timer = {}
	local filter = nil
	timeout = timeout or 100
	os.timer.start(timeout)
	while true do local event, a, b, c = os.pullEvent(filter)
		if event == "netcl_data" then
			if b ~= protocol then return nil end
			_NETCLBUFFER[#_NETCLBUFFER+1] = {[1]=a,[2]=b,[3]=c,['read']=false}
			return a,b,c
		elseif event == "timer" then
			return nil
		end
	end
end