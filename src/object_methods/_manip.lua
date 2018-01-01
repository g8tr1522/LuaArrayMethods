-- manip submodule which holds all the array manipulators for lam objects
--
-- We use the functions in 'src/basic/basic_manip.lua' to create these functions
-- The 'manip' (for lam objects) are created automatically
--		by making them 'wrappers' for the already loaded basic versions.
-- This is done by using a loop to make the lam class methods (that are just
--		wrapper functions from each basic function).
-- Some methods must be overridden because they would not operate as expected 
--		when made by these loops. These are kept in the folder 'overridden_manip'.
--

manip = {}

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

_root = 'src/object_methods/overridden_manip/'

manip.remove_ = require(_root..'remove_')


--basic_manip = nil
return manip
