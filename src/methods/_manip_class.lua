-- manip submodule which holds all the array manipulators
-- at the end, we have a function which automatically creates 
--		the destructive underscore functions

manip = {}
_root = _mainroot.."src/methods/manip/"



--=============================================================================
-- require basic functions here:

--insert_methods_from_submodule(manip, 'src/methods/basic/manip')
--local basic = require(_mainroot.."src/methods/_basic")


--=============================================================================
-- add underscored and lam class methods here:

local init_keys = {}
local i = 0
for k,_ in pairs(lam.basic) do
	i = i+1
	init_keys[i] = k
end

-- non-destructive functions
for i,v in ipairs(init_keys) do
	manip[v] = function (self, ...)
		local t = self:gettable()
		local basic_func = lam.basic[v]
		return basic_func(t, ...)
	end
end

-- destructive functions (aka, underscored)
for i,v in ipairs(init_keys) do
	manip[v..'_'] = function (self, ...)
		local t = self:gettable()
		local basic_func = lam.basic[v]
		local result = basic_func(t, ...)
		self:settable( result )
		return self
	end
end



--=============================================================================
-- overridden underscored methods
-- these methods require special care.
-- 	ie, they can't use the default underscored method made in the above two loops.

manip.remove_ = require(_root..'remove_')


basic = nil
return manip
