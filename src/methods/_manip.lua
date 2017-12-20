-- manip submodule which holds all the array manipulators

manip = {}


_root = "src/methods/manip/"


manip.add      = require(_root..'add')
--manip.add_     = require(_root..'add_')
--manip.mult     = require(_root..'mult')
--manip.mult_    = require(_root..'mult_')


return manip
