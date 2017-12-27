return function (t)
	local new = {}
	for i=1,#t do
		new[i] = t[#t - (i-1)] 
	end
	
	return new
end
