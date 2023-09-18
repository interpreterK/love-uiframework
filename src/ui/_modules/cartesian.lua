return {
	x=function(n)
		return n+love.graphics.getWidth()/2
	end,
	y=function(n)
		return love.graphics.getHeight()/2-n
	end
}