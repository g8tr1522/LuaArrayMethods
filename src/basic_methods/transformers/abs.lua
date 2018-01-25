-- lam.methods.abs(t)
-- finds the absolute values of all elements in array


return function (t)
	local rt = {}
	
	for i=1,#t do
		if t[i]<0 then
			rt[i] = -t[i]
		else
			rt[i] = t[i]
		end
	end
	
	return rt
end 
