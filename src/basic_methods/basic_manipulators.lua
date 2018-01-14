-- manipulators submodule which holds all the array manipulators
-- at the end, we have a function which automatically creates 
--		the destructive underscore functions

manipulators = {}
local _root = _mainroot.."src/basic_methods/manipulators/"



--=============================================================================
-- require basic functions here:

---------------------------------------
-- functions that modify the copy of the VLA
manipulators.insert     = require(_root..'insert')
manipulators.remove     = require(_root..'remove')

---------------------------------------
-- functions which create new VLAs
manipulators.copy       = require(_root..'copy')
manipulators.split      = require(_root..'split')


--_root = nil
return manipulators
