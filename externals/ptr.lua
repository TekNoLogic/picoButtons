
local myname, ns = ...

local version, build, date, toc = GetBuildInfo()
ns.is_six_one = toc >= 60100
