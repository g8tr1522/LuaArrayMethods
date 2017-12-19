-- lam.methods
-- The module of functions that operate on lam tables.

methods = {}

local _root = "methods."



-- `do` submodule
--methods.do    = require(_root..'_do')
-- `class` submodule
methods.class = require(_root..'_class')



-- general
--methods.iterate 	= require(_root..'iterate')
--methods.sample 		= require(_root..'sample')





return methods
