--[[
	MNX SR12b : Moonux Satellite Rewrite 12B
	Made by thecrimulo

	NAME: /lib/thread.l
	SET:  Library RW12B
	TYPE: msti.code.lua
	DESCRIPTION
		Thread manager as a library, used to start the  
		Top Level Coroutine Override.

    Read /man/tlco.man on the subject
]]--

thread = {}

local last_uid = 0

function thread.new( ioFile, env )
	local self = {}

	function self.uid()
		return last_uid + 1 end
	self.uid = self.uid()
	self.env = env
	self.file = file
	self.isFile = fs.exists(self.file)
	self.task = loadfile(self.file, self.env)
	self.thread = coroutine.new(self.task)
	self.filter = nil
	self.error = nil
	self.queue = {}
	self.dead = false
	self.status = self.thread.status
	self.resume = function(...)
		local ft = ...
		if self.filter == nil or ft == self.filter then
			ok, err = coroutine.resume(self.thread, ...)
			if ok then
				self.filter = err
				self.status = coroutine.status(self.thread)
				if self.status == "dead" then 
					self.dead = true end
			else
				self.status = coroutine.status(self.thread)
				if self.status == "dead" then 
					self.dead = true end
				return err
			end
		end
	end
	started[self.uid] = self
	return self end

function thread.queue( thProcess, eName, tA )
	table.insert(thProcess.queue, {eName, unpack(tA)}
end

function thread.kill( thProcess )
	thProcess.status = "dead" end

function thread.run( thProcess )
	started[thProcess.uid] = thProcess end

function thread.runAll()
	evt = {}
	while true do
		evt = {os.pullEvent()}
		for uid, task in pairs(started) do
			if task.dead then table.remove(tasklist, uid)
			else task.resume(unpack(evt)) end end end end