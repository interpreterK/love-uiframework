local window={}
window.__index=window

--[[
local topbar = window.new("Topbar")
topbar.css = ""
]]

function window.new(name, size)
	size=size or 4
	love.graphics.polygon("fill", {-100,100, -100,100, 100,100,-100,100})
end


return window