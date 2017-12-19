-- lam.methods
-- The module of functions that operate on lam tables.

methods = {}

-- set `__index` for 
--methods.__index = methods


local __root = "methods."

-- general
--methods.iterate 	= require(__root..'iterate')
--methods.sample 		= require(__root..'sample')

-- `do` submodule
methods.do = require(__root..'_do')


return methods
