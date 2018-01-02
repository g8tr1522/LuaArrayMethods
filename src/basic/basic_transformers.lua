-- transformers submodule which holds all the array transformersulators
-- at the end, we have a function which automatically creates 
--		the destructive underscore functions

transformers = {}
_root = _mainroot.."src/basic/transformers/"



--=============================================================================
-- require basic functions here:

---------------------------------------
-- substituting vanilla lua functions
transformers.insert     = require(_root..'insert')
transformers.remove     = require(_root..'remove')

---------------------------------------
-- math
transformers.add        = require(_root..'add')
transformers.mult       = require(_root..'mult')

---------------------------------------
-- porting from chance submodule
transformers.shuffle    = require(_root..'shuffle')

---------------------------------------
-- miscellaneous
transformers.compact    = require(_root..'compact')
transformers.reverse    = require(_root..'reverse')
transformers.notes2midi = require(_root..'notes2midi')



return transformers
