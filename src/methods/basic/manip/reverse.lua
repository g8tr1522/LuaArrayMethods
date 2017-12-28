return function (t)
	local rt = {}
	
	for i=1,#t do
		rt[i] = t[#t - (i-1)] 
	end
	
	return rt
end
