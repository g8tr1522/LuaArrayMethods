-- manip submodule which holds all the array manipulators
-- at the end, we have a function which automatically creates 
--		the destructive underscore functions

manip = {}
local _root = _mainroot.."src/basic/manip/"



--=============================================================================
-- require basic functions here:

---------------------------------------
-- functions that modify the copy of the VLA
manip.insert     = require(_root..'insert')
manip.remove     = require(_root..'remove')

---------------------------------------
-- functions which create new VLAs
--manip.copy       = require(_root..'copy')
--manip.split      = require(_root..'split')


--_root = nil
return manip
