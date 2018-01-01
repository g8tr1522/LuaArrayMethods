-- lam.class.gettable(object)
-- returns the vanilla lua table if self is a lam table
-- raises an error if object is not a table


return function (self, err_level)
	local t = {}
	
	for i=1,#self.table do
		t[i] = self.table[i]
	end
	
	return t
end
