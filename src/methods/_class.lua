-- lam.methods.class
-- this submodule requires functions that deal with handling lam objects
--
-- future: maybe name this module 'meta'?
--


class = {}
_root = _mainroot.."src/methods/class/"


class.gettable   = require(_root..'gettable')
class.settable   = require(_root..'settable')

class.unpack     = require(_root..'unpack')

--class.copy       = require(_root..'copy')
--class.gettype    = require(_root..'gettype')
--class.printinfo  = require(_root..'printinfo')


return class
