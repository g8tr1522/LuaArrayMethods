-- manip submodule which holds all the array manipulators
-- at the end, we have a function which automatically creates 
--		the destructive underscore functions

manip = {}
_root = _mainroot.."src/methods/basic/manip/"



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




return manip
