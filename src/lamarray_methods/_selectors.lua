-- selectors module 
-- this module has functions which returns single values from an array

selectors = {}
local _root = _mainroot.."src/object_methods/selectors/"


--=============================================================================
-- require basic selectors here:

basic_selectors = require('src/basic_methods/basic_selectors')



--=============================================================================
-- add lamarray methods here:

for k,v in pairs(basic_selectors) do
	selectors[k] = function(self, ...)
		local basic_foo = basic_selectors[k]
		local t = self:gettable()
		
		return basic_foo(t, ...)
	end
end




return selectors
