-- lam.methods.class
-- this submodule requires functions that deal with handling lam objects
--
-- future: maybe name this module 'meta'?
--


class = {}
_root = "src/methods/class/"


--class.copy       = require(_root..'copy')
class.gettable   = require(_root..'gettable')
--class.gettype    = require(_root..'gettype')
--class.printinfo  = require(_root..'printinfo')
class.settable   = require(_root..'settable')


return class
