--[[
  moonux-corelib:disk
  Disk API replacement
  
  Made by thecrimulo
  ~ Moonux Project
]]--

dofile("/vit/vinit.old.l")
local disklib = vinit.old.disk

local diskc = {
  ['isInside'] = disklib.isPresent,
  ['isDrive'] = disklib.hasData,
  ['getMountPoint'] = disklib.getMountPath,
  ['label'] = {
    ['set'] = disklib.setLabel,
    ['get'] = disklib.getLabel
  },
  ['uid'] = disklib.getID,
  ['isAudio'] = disklib.hasAudio,
  ['audio'] = {
    ['play'] = disklib.playAudio,
    ['stop'] = disklib.stopAudio
  },
  ['eject'] = disklib.eject
}

disk = diskc
_G['disk'] = diskc
