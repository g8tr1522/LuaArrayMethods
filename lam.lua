-- require this file to use in other projects

-- module
lam = {}
_mainroot = _lamroot or ''	--folder that lam.lua is kept in 

-- require chance repo/submodule
chance = require(_mainroot..'chance/chance')


-- make methods
-- used for making vanilla lua tables
lam.make = require(_mainroot..'src/make')


-- lam class methods
-- (a lam object accesses these methods)
--		(see call to setmetatable in lam.new)
lam.methods = require(_mainroot..'src/methods')
lam.methods.__index = function (t,k)
	return lam.methods[k]
end


-------------------------------------------------------------------------------
-- lam.new(table_or_type, make_args)
-- returns a new lam table
-- a lam table can use the above class methods
function lam.new (table_or_type, ...)
	local o = {}
	if type(table_or_type)=="table" then
		o.table   = table_or_type or {}
		o.lamtype = "table"
	elseif type(table_or_type)=="string" then
		o.table   = lam.make[table_or_type](...)
		o.lamtype = table_or_type
	end
	
	setmetatable(o, lam.methods)
	return o
end


_mainroot = nil	-- in case this variable is used in other libraries, etc.
return lam
