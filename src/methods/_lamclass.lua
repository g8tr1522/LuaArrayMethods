-- lam.methods.lamclass
-- this submodule requires functions that deal with handling lam objects
--
-- future: maybe name this module 'meta'?
--


lamclass = {}
_root = _mainroot.."src/methods/lamclass/"


lamclass.gettable   = require(_root..'gettable')
lamclass.settable   = require(_root..'settable')

lamclass.unpack     = require(_root..'unpack')

--lamclass.copy       = require(_root..'copy')
--lamclass.gettype    = require(_root..'gettype')
--lamclass.printinfo  = require(_root..'printinfo')


return lamclass
