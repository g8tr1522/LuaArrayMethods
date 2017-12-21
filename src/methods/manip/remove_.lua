--lam.methods.remove_(arg, arg2)
-- 
-- Destructive version of `lam.methods.remove`
-- Works exactly like `lam.methods.remove`, except returns a third value, `oldt`
-- `oldt` is the table prior to the `remove` call
--


function remove_ (self, arg, arg2)
	local oldt = self:gettable() or self
	
	local re,t = self:remove(arg, arg2)
	self:settable(t)
	
	return re, t, oldt
end


return remove_
