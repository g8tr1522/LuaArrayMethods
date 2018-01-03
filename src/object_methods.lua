-- lam.obejct_methods
-- This module contains all methods that lam objects can use. 

object_methods = {}
local _root = _mainroot.."src/object_methods/"


-- general
--object_methods.iterate 	= require(_root..'iterate')
--object_methods.sample 		= require(_root..'sample')


local function insert_methods_from_submodule (submodule_name)
	local subm = require(_root..submodule_name)
	for k,v in pairs(subm) do
		object_methods[k] = v
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



return object_methods
