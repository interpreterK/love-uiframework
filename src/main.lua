local unix=function()
	return os.time(os.date("!*t"))
end
_G.unix=unix

local grid=require('./ui/grid')
local window=require('./ui/window')
local client_screen={x=0,y=0}
local max=math.max
local floor=math.floor

function love.load()
	--hack xd
	love.window.setTitle("UI-Engine 0.1")
	love.window.setMode(0,0)
	client_screen.x=love.graphics.getWidth()
	client_screen.y=love.graphics.getHeight()
	love.window.setMode(
		max(client_screen.x/1.8,100),
		max(client_screen.y/1.8,100),{
		resizable=true,
		minheight=100,
		minwidth=100
	})
end

local FPS=0
local FPS_font_size=18
function love.update(dt)
	FPS=floor(1/dt)
end

local window_grid=grid.new()

function love.draw()
	love.graphics.setFont(love.graphics.newFont(FPS_font_size))
	love.graphics.setColor(1,1,0)
	love.graphics.print("FPS: "..tostring(FPS),0,0)
	window_grid:spawn()
	window.new()
end