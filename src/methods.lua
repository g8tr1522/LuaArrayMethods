-- lam.methods
-- The module of functions that operate on lam tables.

methods = {}

local _root = "src/methods/"


-- general
--methods.iterate 	= require(_root..'iterate')
--methods.sample 		= require(_root..'sample')


local function insert_methods_from_submodule (submodule_name)
	local subm = require(_root..submodule_name)
	print("subm is ",tostring(subm))
	for k,v in pairs(subm) do
		methods[k] = v
	end
	subm = nil
end

-- `manip` submodule
--local manip = require(_root..'_manip')
insert_methods_from_submodule('_manip')
--manip = nil

-- `class` submodule
--local class = require(_root..'_class')
insert_methods_from_submodule('_class')
--class = nil

-- `override` submodule
--local override = require(_root..'_override')
insert_methods_from_submodule('_override')






return methods
