-- transformers submodule which holds all the array transformersulators
-- at the end, we have a function which automatically creates 
--		the destructive underscore functions

transformers = {}
local _root = _mainroot.."src/basic_methods/transformers/"



--=============================================================================
-- require basic functions here:

---------------------------------------
-- math
transformers.add        = require(_root..'add')
transformers.mult       = require(_root..'mult')

---------------------------------------
-- utility
transformers.compact    = require(_root..'compact')
transformers.sort       = require(_root..'sort')

---------------------------------------
-- miscellaneous
transformers.reverse    = require(_root..'reverse')
transformers.notes2midi = require(_root..'notes2midi')
transformers.shuffle    = require(_root..'shuffle')


--_root = nil
return transformers
