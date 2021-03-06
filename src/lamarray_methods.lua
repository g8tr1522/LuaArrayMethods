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



-- `transformers` submodule
insert_methods_from_submodule('_transformers')

-- `manipulators` submodule
insert_methods_from_submodule('_manipulators')

-- `selectors` submodule
insert_methods_from_submodule('_selectors')

-- `object_and_meta` submodule
-- this module should go last since some methods here override others
insert_methods_from_submodule('_object_and_meta')




return lamarray_methods
