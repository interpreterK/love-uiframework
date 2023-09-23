--NOT 1 based, on purpose :)
--[[
```lua
bytes("/src/")[0] --'/'
bytes("/src/")[0] = "" --"src/"
```
]]
local bytes=function(String)
	local charbytes=string.gmatch(String,'.')
	local charbytes_array={}
	for n in charbytes do
		table.insert(charbytes_array,n)
	end
	return setmetatable(charbytes_array,{
		__index=function(bytes_array, byte)
			return rawget(bytes_array, byte+byte==0 and 1 or 0)
		end,
		__newindex=function(bytes_array, byte, new)
			rawset(bytes_array, byte+byte==0 and 1 or 0, new)
		end
	})
end
local unix=function()
	return os.time(os.date("!*t"))
end
--Cache it
local dirpath=function()
	return io.popen("pwd", 'r'):read('l')
end
local path=dirpath()
--Starts at `love-uiframework`
local fopen=function(file_path, mode)
	print(bytes(file_path)[2])
	return io.open(path.."/"..file_path, mode and mode or 'r')
end
_G.bytes=bytes
_G.unix=unix
_G.dirpath=dirpath
_G.fopen=fopen

local grid=require('./ui/elements/grid')
local window=require('./ui/elements/window')
local ui=require('./ui/prioritystack')
local max=math.max
local floor=math.floor

local window_grid=grid.new()
local FPS=0
local FPS_font_size=18

function love.load()
	print("Using: ".._VERSION)
	love.window.setTitle("UI-Engine 0.1")
	--hack xd
	love.window.setMode(0,0)
	love.window.setMode(
		max(love.graphics.getWidth()/1.8,100),
		max(love.graphics.getHeight()/1.8,100),
		{
			resizable=true,
			minheight=100,
			minwidth=100
		}
	)
	love.graphics.setBackgroundColor(24/255,26/255,27/255)
	fopen("/src/shader/cube.glsl")
end

function love.update(dt)
	FPS=floor(1/dt)
end

function love.draw()
	love.graphics.setFont(love.graphics.newFont(FPS_font_size))
	love.graphics.setColor(1,1,0)
	window_grid:spawn()
	window.new()
	love.graphics.print("FPS: "..tostring(FPS),0,0)
end