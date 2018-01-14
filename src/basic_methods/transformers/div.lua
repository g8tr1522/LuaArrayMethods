-- lam.methods.div(val)
-- divide every element in array by `val`


return function (t, val)
	local rt = {}
	val = val or 1
	
	for i=1,#t do
		rt[i] = t[i] / val
	end
	
	return rt
end 
