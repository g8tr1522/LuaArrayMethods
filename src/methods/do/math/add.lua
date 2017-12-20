-- lam.do.math.add(val)
-- add `val` to every element in array
-- preserves array, but returns result


function add (self, val)
	local t = {}
	if self.lamtype then
		t = self.table
	else
		t = self
	end
	
	
	