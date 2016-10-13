--[[
  moonux-corelib:color
  Replacement for colors API
  
  Made by thecrimulo
  ~ Moonux Project
]]--

dofile("/vit/vinit.old.l")
local colorslib = vinit.old.colors

color = {
  ['white'] = 1,
  ['orange'] = 2,
  ['magenta'] = 4,
  ['lightBlue'] = 8,
  ['yellow'] = 16,
  ['lime'] = 32,
  ['pink'] = 64,
  ['gray'] = 128,
  ['lightGray'] = 256,
  ['cyan'] = 512,
  ['purple'] = 1024,
  ['blue'] = 2048,
  ['brown'] = 4096,
  ['green'] = 8192,
  ['red'] = 16384,
  ['black'] = 32768,
  ['char'] = {
    ['white'] = "0",
    ['orange'] = "1",
    ['magenta'] = "2",
    ['lightBlue'] = "3",
    ['yellow'] = "4",
    ['lime'] = "5",
    ['pink'] = "6",
    ['gray'] = "7",
    ['lightGray'] = "8",
    ['cyan'] = "9",
    ['purple'] = "a",
    ['blue'] = "b",
    ['brown'] = "c",
    ['green'] = "d",
    ['red'] = "e",
    ['black'] = "f"
  },
  ['combine'] = colorslib.combine,
  ['subtract'] = colorslib.subtract,
  ['isColor'] = colorslib.test
}

_G['colors'] = color
_G['colours'] = color
_G['color'] = color
_G['colour'] = color
