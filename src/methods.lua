-- lam.methods
-- The module of functions that operate on lam tables.

methods = {}
local _root = _mainroot.."src/methods/"


-- general
--methods.iterate 	= require(_root..'iterate')
--methods.sample 		= require(_root..'sample')


local function insert_methods_from_submodule (submodule_name)
	local subm = require(_root..submodule_name)
	for k,v in pairs(subm) do
		methods[k] = v
	end
	subm = nil
end


-- `lamclass` submodule
insert_methods_from_submodule('_lamclass')

-- `manip` submodule
insert_methods_from_submodule('_manip_class')

-- `override` submodule
insert_methods_from_submodule('_override')



return methods
