-- math module

math  = nil
math  = {}
_root = "src/methods/do/math"


--=============================================================================

-- add functions 

function math.add (self, val)
	local t = self.class:gettable()
	
	for i=1,#t do
		t[i] = t[i] + val
	end
	
	return t
end -- add

function math.add_ (self, val)
	self.class:settable(self.math:add(val))
	return self
end



-- multiply functions 

function math.mult (self, val)
	local t = self.class:gettable()
	
	for i=1,#t do
		t[i] = t[i] * val
	end
	
	return t
end -- add

function math.mult_ (self, val)
	self.class:settable(self.math:mult(val))
	return self
end
	


return math
