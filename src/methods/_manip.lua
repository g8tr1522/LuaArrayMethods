-- manip submodule which holds all the array manipulators

manip = {}


_root = "src/methods/manip/"


manip.add      = require(_root..'add')
--manip.add_     = require(_root..'add_')
--manip.mult     = require(_root..'mult')
--manip.mult_    = require(_root..'mult_')


local function underscore_methods (manip_here)
	for k,v in pairs(manip_here) do
		manip_here[k..'_'] = function (self, ...)
			self:settable( self[k](self, ...) )
			return self
		end
	end
end

underscore_methods(manip)

return manip
