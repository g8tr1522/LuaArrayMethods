-- copies the elements of a simple contiguous array

return function (t)
	local rt = {}
	
	for i=1,#t do
		rt[i] = t[i]
	end
	
	return rt
end