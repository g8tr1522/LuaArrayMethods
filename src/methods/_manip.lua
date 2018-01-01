-- manip submodule which holds all the array manipulators
-- at the end, we have a function which automatically creates 
--		the destructive underscore functions

manip = {}
_root = _mainroot.."src/methods/manip/"



--=============================================================================
-- require basic functions here:

--insert_methods_from_submodule(manip, 'src/methods/basic/manip')
--local basic = require(_mainroot.."src/methods/_basic")
local basic_manip = require(_mainroot.."src/basic/basic_manip")

--=============================================================================
-- add underscored and lam class methods here:

local init_keys = {}
local i = 0
for k,_ in pairs(basic_manip) do
	i = i+1
	init_keys[i] = k
end

-- non-destructive functions
for i,v in ipairs(init_keys) do
	manip[v] = function (self, ...)
		local t = self:gettable()
		local basic_func = basic_manip[v]
		return basic_func(t, ...)
	end
end

-- destructive functions (aka, underscored)
for i,v in ipairs(init_keys) do
	manip[v..'_'] = function (self, ...)
		local t = self:gettable()
		local basic_func = basic_manip[v]
		local result = basic_func(t, ...)
		self:settable( result )
		return self
	end
end



--=============================================================================
-- overridden lam class methods
-- These methods require special care.
-- 		ie, they can't use the default underscored method made in the above two loops.
-- Usually, these just have multiple return arguments
--
-- future: get the above loops to handle multiple return args with `...` 
--		Then, we won't need to have this section.

manip.remove_ = require(_root..'remove_')


--basic_manip = nil
return manip
