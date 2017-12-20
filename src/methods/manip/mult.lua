-- lam.methods.mult(val)
-- multiply every element in array by `val`


return function (self, val)
	local t = self:gettable()
	
	for i=1,#t do
		t[i] = t[i] * val
	end
	
	return t
end 
