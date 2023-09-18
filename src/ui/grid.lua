local grid={}
grid.__index=grid

local mouseX,mouseY=0,0

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
	if self.pointer_location then
		mouseX,mouseY=love.mouse.getPosition()

	end
	if self.axis_text then
		love.graphics.setFont(love.graphics.newFont(25))
		love.graphics.setColor(1,0,0)
		love.graphics.print("X",5,y2+5)
		love.graphics.setColor(0,1,0)
		love.graphics.print("Y",x2+5,0)
		love.graphics.setFont(love.graphics.newFont(15))
		love.graphics.setColor(0,1,1)
		local cord_display="("..tostring(x2-mouseX)..", "..tostring(y2-mouseY)..")"
		local xx10=(window.x-mouseX)/10
		local yy10=(window.y-mouseY)/10
		local bounds_offset={
			x=xx10<=#cord_display and window.x-#cord_display or mouseX+20,
			y=yy10<=#cord_display and #cord_display or mouseY+20
		}
		love.graphics.print(cord_display, bounds_offset.x, bounds_offset.y)
	end
end

function grid.new(show_axis_text, show_pointer_location)
	local self={
		axis_text=show_axis_text or true,
		pointer_location=show_pointer_location or true,
		showing=true
	}
	return setmetatable(self,grid)
end

function grid:spawn()
	render_grid(self)
end

return grid