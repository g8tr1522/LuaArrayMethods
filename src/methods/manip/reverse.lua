return function (self)
	local t = self:gettable()
	
	local new = {}
	for i=1,#t do
		new[i] = t[#t - (i-1)] 
	end
	
	return t
end
