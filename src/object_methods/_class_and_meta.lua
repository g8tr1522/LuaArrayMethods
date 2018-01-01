-- lam.methods.lamclass
-- This submodule requires functions that deal with handling lam objects
-- It also contains overridden metamethods for lam objects.
--


lamclass = {}
_root = _mainroot.."src/object_methods/class_and_meta/"


-------------------------------------------------------------------------------
-- lam object methods

lamclass.gettable   = require(_root..'gettable')
lamclass.settable   = require(_root..'settable')

lamclass.unpack     = require(_root..'unpack')

--lamclass.copy       = require(_root..'copy')
--lamclass.gettype    = require(_root..'gettype')
--lamclass.printinfo  = require(_root..'printinfo')


-------------------------------------------------------------------------------
-- metamethods for lam objects

lamclass.__len			= require(_root..'__len')


return lamclass
