-- lam.methods.add(val)
-- add `val` to every element in array


return function (t, val)
	local rt = {}
	val = val or 0
	
	for i=1,#t do
		rt[i] = t[i] + val
	end
	
	return rt
end 
