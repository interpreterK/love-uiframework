local scale=2
local function setscale(n)
	scale=tonumber(n)
	return scale
end
local function gridX()
	return love.graphics.getWidth()
end
local function gridY()
	return love.graphics.getHeight()
end
local function originX()
	return gridX()/2
end
local function originY()
	return gridY()/2
end
local function x(n)
	return n+originX()
end
local function y(n)
	return originY()-n
end
local function xy(nx,ny)
	return x(nx)+y(ny)
end
local function yx(ny,nx)
	return y(ny)-x(nx)
end

return {
	scale=scale,
	setscale=setscale,
	gridX=gridX,
	gridY=gridY,
	originX=originX,
	originY=originY,
	plotX=x,
	plotY=y,
	plotXY=xy,
	plotYX=yx
}