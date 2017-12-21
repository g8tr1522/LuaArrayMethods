-- manip submodule which holds all the array manipulators
-- at the end, we have a function which automatically creates 
--		the destructive underscore functions

manip = {}
_root = "src/methods/manip/"



--=============================================================================
-- require basic functions here:

---------------------------------------
-- substituting vanilla lua functions
manip.insert   = require(_root..'insert')
manip.remove   = require(_root..'remove')

---------------------------------------
-- math
manip.add      = require(_root..'add')
manip.mult     = require(_root..'mult')

---------------------------------------
-- porting from chance submodule
manip.shuffle  = require(_root..'shuffle')

---------------------------------------
-- miscellaneous
manip.reverse  = require(_root..'reverse')



--=============================================================================
-- add underscored methods here:

local init_keys = {}
local i = 0
for k,_ in pairs(manip) do
	i = i+1
	init_keys[i] = k
end


for i,v in ipairs(init_keys) do
	manip[v..'_'] = function (self, ...)
		self:settable( self[v](self, ...) )
		return self
	end
end



--=============================================================================
-- overridden underscored methods
-- these methods require special care.
-- 	ie, they can't use the default underscored method made in the above two loops.

manip.remove_ = require(_root..'remove_')



return manip
