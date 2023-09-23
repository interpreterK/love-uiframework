local grid={}
grid.__index=grid

local cartesian=require("src/ui/_modules/cartesian")
local mouseX,mouseY=0,0

local function render_grid(self)
	local x=cartesian.gridX()
	local y=cartesian.gridY()
	local ox=cartesian.originX()
	local oy=cartesian.originY()
	--x
	love.graphics.setColor(1,1,1)
	love.graphics.line(
		-x, oy,
		x, oy
	)
	--y
	love.graphics.setColor(1,1,1)
	love.graphics.line(
		ox, -y,
		ox, y
	)
	if self.pointer_location then
		mouseX,mouseY=love.mouse.getPosition()
	end
	if self.axis_text then
		love.graphics.setFont(love.graphics.newFont(25))
		love.graphics.setColor(1,1,1)
		love.graphics.print("X",5,oy+5)
		love.graphics.setColor(1,1,1)
		love.graphics.print("Y",ox+5,0)
		love.graphics.setFont(love.graphics.newFont(15))
		love.graphics.setColor(1,1,1)
		love.graphics.print("0",ox-20,oy+5)
		-- for n=2,ox*cartesian.scale do
			love.graphics.line(
				ox+2, oy+2,
				ox+2, -oy-2
			)
		-- end
		--cursor position on cartesian space
		local cord_display="("..tostring(mouseX-ox)..", "..tostring(oy-mouseY)..")"
		local cord_display_l=#cord_display
		local arbitrary_offset_x=8.5
		love.graphics.print(cord_display,
			(x-mouseX)/10<=cord_display_l and x-cord_display_l*arbitrary_offset_x or mouseX+20,
			(y-mouseY)/10*3<=cord_display_l and y-cord_display_l*2 or mouseY+20
		)
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