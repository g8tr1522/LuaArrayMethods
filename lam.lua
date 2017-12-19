-- require this file to use in other projects

-- module
lam = {}


-- make method
lam.make = require('src/make')


-- lam table methods
lam.methods = require('src/methods')
lam.methods.__index = function (t,k)
	return lam.methods[k]
end

--=============================================================================
--OOP

lam.new = {}

-------------------------------------------------------------------------------
-- Class methods
local __root = "src/class/"


-------------------------------------------------------------------------------
-- lam.new(t)
-- makes a new lam table
-- a lam table can use the above class methods


-- function lam.new.__call (t)
	-- setmetatable(t, lam.methods)
	-- return t
-- end


-------------------------------------------------------------------------------
-- lam.new.<make type function>(args)
-- make new lam table
-- makes a new lam table, but with a 'make' method

local mt = {}
mt.__index = {}
mt.__index.__call = function (...)
	

setmetatable(lam.new, {__index = 
	function (t,k)
		local o = {}
		o = lam.make[k]
	
	
	
	



return lam
