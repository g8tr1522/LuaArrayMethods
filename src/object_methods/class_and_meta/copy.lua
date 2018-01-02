-- returns a copy to the lam object (and not a reference)
--
-- future: how do I handle 'lamtype'?

return function (self)
	local new_o = lam.new(self:gettable())
	new_o.lamtype = "copy"
	
	return new_o
end