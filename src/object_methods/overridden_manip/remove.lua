--lam.methods.remove(arg, arg2)
-- overridden wrapper for lam.basic.remove
--
--


local basic_remove = require(_mainroot..'src/basic/manip/remove')


function remove (self, arg, arg2)
	local rt = self:gettable()
	local re = {}
	
	rt,re = basic_remove(rt, arg, arg2)
	
	return rt,re
end


return remove
