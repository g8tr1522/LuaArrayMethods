-- lam.methods.add(val)
-- add `val` to every element in array


return function (self, val)
	local t = self:gettable()
	
	for i=1,#t do
		t[i] = t[i] + val
	end
	
	return t
end 
