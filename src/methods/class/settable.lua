-- lam.methods.class:settable(new_table)
-- set the vanilla lua table in an lam table

return function (self, new_table)
	if self.lamtype then
		self.table = new_table
	end
end