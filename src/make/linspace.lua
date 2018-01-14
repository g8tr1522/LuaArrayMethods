
--------------------------------------------------------------------------------
-- lam.make.linspace(start, stop, size)
--
--	

local abs = math.abs

return function (start, stop, size)
	if type(size)=="number" then
		if size==2 then
			return {start, stop}
		elseif size > 2 then
			size = size - 1
		end
	end
	local step = abs( (start-stop)/size )
	local rt = {}
	
	if start < stop then
		for i=1,size do
			rt[i] = start + (i-1)*step
		end
	elseif start > stop then
		for i=1,size do
			rt[i] = start - (i-1)*step
		end
	end
	
	rt[#rt + 1] = stop
	return rt	
end


