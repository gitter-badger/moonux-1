--[[
  mnx11: Moonux Satellite 11
  NAME:        /lib/disk.l
  CATEGORY:    corelib
  VERSION:     11:90816A
  DESCRIPTION: Disk manager

  Made by thecrimulo
  ~ Moonux Project
]]--

local disklib = _G.vold.disk

diskl = {}

diskl.isPresent = disklib.isPresent
diskl.hasData = disklib.hasData
diskl.getMountPoint = disklib.getMountPath
diskl.label = {}
diskl.label.get = disklib.getLabel
diskl.label.set = disklib.setLabel
diskl.id = disklib.getID
diskl.isAudio = disklib.hasAudio
diskl.audio = {}
diskl.audio.play = disklib.playAudio
diskl.audio.stop = disklib.stopAudio
diskl.eject = disklib.eject

_G['disk'] = diskl