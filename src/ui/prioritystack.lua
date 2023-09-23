local pstack={}
pstack.__index=pstack

local uistack={}

function pstack.new(name, type, style, id, classtype)
	if not uistack[name] then
		uistack[name]={
			type=type,
			styles={},
			id=tostring(id),--!required
			classtype=classtype
		}
	end
	return setmetatable({},pstack)
end

function pstack:remove()
	
end

return pstack