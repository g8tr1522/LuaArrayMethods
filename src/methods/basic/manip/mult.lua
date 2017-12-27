-- lam.methods.mult(val)
-- multiply every element in array by `val`


return function (t, val)
	for i=1,#t do
		t[i] = t[i] * val
	end
	
	return t
end 
