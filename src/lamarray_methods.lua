-- lam.obejct_methods
-- This module contains all methods that lam objects can use. 

lamarray_methods = {}
local _root = _mainroot.."src/lamarray_methods/"


-- general
--lamarray_methods.iterate 	= require(_root..'iterate')
--lamarray_methods.sample 		= require(_root..'sample')


local function insert_methods_from_submodule (submodule_name)
	local subm = require(_root..submodule_name)
	for k,v in pairs(subm) do
		lamarray_methods[k] = v
	end
	subm = nil
end


-- `class_and_meta` submodule
insert_methods_from_submodule('_class_and_meta')

-- `transformers` submodule
insert_methods_from_submodule('_transformers')

-- `manip` submodule
insert_methods_from_submodule('_manip')

-- `override` submodule
--insert_methods_from_submodule('_override') -- now in '_class_and_meta' submodule



return lamarray_methods
