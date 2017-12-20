-- lam.class.gettable(object)
-- returns the vanilla lua table if self is a lam table
-- raises an error if object is not a table


return function (self, err_level)
	if type(self)=="table" then
		if self.lamtype then
			return self.table
		else
			return self
		end
	else
		error("Error in lam.class.gettable :
			.."\n 	self is not a table"
			, err_level or 3)
	end
end
