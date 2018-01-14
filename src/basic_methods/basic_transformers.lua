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
transformers.div        = require(_root..'div')
transformers.round      = require(_root..'round')

---------------------------------------
-- order
transformers.reverse    = require(_root..'reverse')
transformers.shuffle    = require(_root..'shuffle')
transformers.sort       = require(_root..'sort')

---------------------------------------
-- boolean
transformers.bools2vals = require(_root..'bools2vals')
transformers.vals2bools = require(_root..'vals2bools')

---------------------------------------
-- miscellaneous
transformers.compact    = require(_root..'compact')
transformers.notes2midi = require(_root..'notes2midi')
transformers.dofunction = require(_root..'dofunction')


--_root = nil
return transformers
