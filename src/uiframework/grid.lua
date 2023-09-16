local grid={}
grid.__index=grid

local mouseX,mouseY=0,0
local axis_text_offset=20

local function render_grid(self)
	local window={
		x=love.graphics.getWidth(),
		y=love.graphics.getHeight(),
	}
	local x2=window.x/2
	local y2=window.y/2
	--x
	love.graphics.setColor(1,0,0)
	love.graphics.line(
		-window.x,y2,
		window.x,y2
	)
	--y
	love.graphics.setColor(0,1,0)
	love.graphics.line(
		x2,-window.y,
		x2,window.y
	)
	if self.show_pointer_location then
		mouseX,mouseY=love.mouse.getPosition()

	end
	if self.show_axis_text then
		love.graphics.setFont(love.graphics.newFont(25))
		love.graphics.setColor(1,0,0)
		love.graphics.print("X",5,y2+5)
		love.graphics.setColor(0,1,0)
		love.graphics.print("Y",x2+5,0)
		love.graphics.setFont(love.graphics.newFont(15))
		love.graphics.setColor(0,1,1)
		love.graphics.print("("..tostring(mouseX)..", "..tostring(mouseY)..")", mouseX+axis_text_offset, mouseY+axis_text_offset)
	end
end

function grid.new(show_axis_text, show_pointer_location)
	local self={
		axis_text=show_axis_text or true,
		pointer_location=show_pointer_location or true,
		showing=true
	}
	return setmetatable(grid,self)
end

function grid:spawn()
	render_grid(self)
end

return grid