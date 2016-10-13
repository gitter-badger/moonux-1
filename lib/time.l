--[[
  mnx11: Moonux Satellite eleven
  NAME:        /lib/time.l
  CATEGORY:    corelib
  VERSION:     11:11016A
  DESCRIPTION: Time library

  Made by thecrimulo
  ~ Moonux Project
]]--

-- UTC Timezones
utc = {['n'] = {}, ['p'] = {}}
local bn = "+hours+before+now"
local an = "+hours+after+now"
utc.n.twelve = "twelve"..bn  -- Baker islands
utc.n.eleven = "eleven"..bn
utc.n.ten = "ten"..bn		 -- Honolulu
utc.n.nine = "nine"..bn   	 -- Anchorage
utc.n.eight = "eight"..bn		 -- Los Ángeles, Vancouver, Tijuana
utc.n.seven = "seven"..bn    -- Phoenix, Ciudad Juárez
utc.n.six = "six"..bn			 -- Chicago, Mexico City
utc.n.five = "five"..bn     -- New York, Toronto, Bogotá
utc.n.four = "four"..bn     -- Santiago, La Paz
utc.n.three = "three"..bn    -- Buenos Aires, Sao Paulo
utc.n.two = "two"..bn      
utc.n.one = "one"..bn
utc.zero = "now"						 -- Casablanca, Dakar, Dublin, Lisbon, London
utc.p.one = "one"..an      -- Berlin, Paris, Madrid, Rome, Vienna, Warsaw
utc.p.two = "two"..an      -- Athens, Cairo, Helsinki, Istambul
utc.p.three = "three"..an    -- Moscow, Minsk
utc.p.four = "four"..an     -- Baku, Dubai
utc.p.five = "five"..an     -- Karachi
utc.p.six = "six"..an      -- Dhaka
utc.p.seven = "seven"..an    -- Bangkok, Hanoi
utc.p.eight = "eight"..an    -- Beijing, Singapore, Manila
utc.p.nine = "nine"..an     -- Seoul, Tokyo
utc.p.ten = "ten"..an     -- Sydney, Melbourne
utc.p.eleven = "eleven"..an  -- Noumea
utc.p.twelve = "twelve"..an  -- Auckland, Suva

time = {}
local timei = {}
function timei.request(utcv)
	local response = vold.http.get("http://www.timeapi.org/utc/"..utcv.."?\a%20\A%20\u%20\b%20\B%20\d%20\m%20\I:\M:\S%20\p%20\Y%20\W%20\D").readAll()
  print(response)
  return response
end
function timei.parse(response)
	local p = {}
  for x,y in pairs(string.gmatch(response, "%S+")) do p[x] = y end
  parsed = { p[1], p[2], p[3], p[4], p[5], p[6], p[7], p[8], p[9], p[10], p[11], p[12] }
	return parsed
end
function timei.rp(utcv)
	return timei.parse(timei.request(utcv))
end

g.add("_tz", utc.zero)
g.add("_ct", timei.rp(_tz))

time.weekday = {}
function time.weekday.short() return timei.rp(_tz)[1] end
function time.weekday.long() return timei.rp(_tz)[2] end
function time.weekday.num() return timei.rp(_tz)[3] end
time.month = {}
function time.month.short() return timei.rp(_tz)[4] end
function time.month.long() return timei.rp(_tz)[5] end
function time.month.num() return timei.rp(_tz)[7] end
time.generic = {}
function time.generic.day() return timei.rp(_tz)[6] end
function time.generic.clock() return timei.rp(_tz)[8] end
function time.generic.year() return timei.rp(_tz)[10] end
function time.generic.date() return timei.rp(_tz)[12] end
function time.generic.meridian() return timei.rp(_tz)[9] end
g.add("time", time)