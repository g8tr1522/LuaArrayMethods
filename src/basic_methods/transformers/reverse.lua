return function (t)
	local rt = {}		-- return table
	
	for i=1,#t do
		rt[i] = t[#t - (i-1)] 
	end
	
	return rt
end
