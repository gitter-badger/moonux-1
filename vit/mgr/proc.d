--[[
  mnx11: Moonux Satellite 11
  NAME:        /vit/mgr/proc.d
  CATEGORY:    manager
  VERSION:     11:11016A
  DESCRIPTION: Thread manager

  Made by thecrimulo, based on CCDelta and Cubix
  ~ Moonux Project
]]--

local thread = {}

local toRun = {}
local running = {}
local lastuid = 000

function thread.new(file, ...)
	parent = parent or ''
	local self = {}

	self.uid = lastuid + 1
	self.file = file

	local ethr = coroutine.create(loadfile(file))
	local filter = nil
	local first, ok, err

	ok, err = coroutine.resume(ethr, ...)
	if ok then filter = err else return false, err end

	self.resume = function(...)
		first = ...
			if filter == nil or first == filter then
				ok, err = coroutine.resume(ethr,...)
				if ok then
					filter = err
				else
					return err
				end
			end
	end
	toRun[file] = {self.uid, file, ethr}
	return self
end

local killprocs = {}
local killall = false

function thread.runAll(toRun)
	local event = {}
	while true do
		event = {os.pullEvent()}
		for i,v in pairs(toRun) do
			v.resume(unpack(event))
			for _,killuid in pairs(killprocs) do
				if v.uid == killuid then v = nil; killuid[uid] = nil end end
			if killall == true then v = nil end
		end
	end
end

function thread.kill(uid)
	killprocs[uid] = uid
end

function thread.killAll()
	if not MOONUX_SHUTDOWN then return false
	else killall = true; debug.shutdown() end

toRun.
thread.runAll() -- Run this forever, the actual thing that keeps it living
