-- lam.methods
-- The module of functions that operate on lam tables.

methods = {}

local _root = "src/methods/"


-- general
--methods.iterate 	= require(_root..'iterate')
--methods.sample 		= require(_root..'sample')


local function insert_methods_from_submodule (submodule)
	for k,v in pairs(submodule) do
		methods[k] = v
		methods[k..'_'] = function (self, ...)
			self:settable(self:add(...))
			return self
		end
	end
end

-- `manip` submodule
local manip = require('src/methods/_manip')
insert_methods_from_submodule(manip)
--table.insert(methods, require('src/methods/_manip'))

-- `class` submodule
local class = require('src/methods/_class')
insert_methods_from_submodule(class)
--table.insert(methods, require('src/methods/_class'))








return methods
