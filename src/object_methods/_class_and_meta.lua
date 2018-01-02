-- lam.methods.class_and_meta
-- This submodule requires functions that deal with handling lam objects
-- It also contains overridden metamethods for lam objects.
--


class_and_meta = {}
_root = _mainroot.."src/object_methods/class_and_meta/"


-------------------------------------------------------------------------------
-- lam object methods

class_and_meta.gettable   = require(_root..'gettable')
class_and_meta.settable   = require(_root..'settable')

class_and_meta.unpack     = require(_root..'unpack')

class_and_meta.copy       = require(_root..'copy')
--class_and_meta.gettype    = require(_root..'gettype')
--class_and_meta.printinfo  = require(_root..'printinfo')


-------------------------------------------------------------------------------
-- metamethods for lam objects

class_and_meta.__len			= require(_root..'__len')
class_and_meta.__concat   = require(_root..'__concat')
class_and_meta.__ipairs   = require(_root..'__ipairs')



return class_and_meta
