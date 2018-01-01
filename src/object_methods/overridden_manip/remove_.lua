--lam.methods.remove_(arg, arg2)
-- 
-- Destructive version of `lam.methods.remove`
-- Works exactly like `lam.methods.remove`, except it doesn't return the 
--		vanilla lua array (ie, `rt`).
--


local basic_remove = require(_mainroot..'src/basic/manip/remove')


function remove_ (self, arg, arg2)
	local rt = self:gettable()
	local re = {}
	
	rt,re = basic_remove(rt, arg, arg2)
	self:settable(rt)
	
	return self,re
end


return remove_
