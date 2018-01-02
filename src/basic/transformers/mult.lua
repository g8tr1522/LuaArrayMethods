-- lam.methods.mult(val)
-- multiply every element in array by `val`


return function (t, val)
	local rt = {}  -- return table
	val = val or 1
	
	for i=1,#t do
		rt[i] = t[i] * val
	end
	
	return rt
end 
