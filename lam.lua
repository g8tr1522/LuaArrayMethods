-- require this file to use in other projects

-- module
lam = {}
_mainroot = _lamroot or ''	--folder that lam.lua is kept in 


-------------------------------------------------------------------------------
-- requires

-- require chance repo/submodule
chance = require(_mainroot..'chance/chance')


-- make methods
-- used for making vanilla lua tables
lam.make = require(_mainroot..'src/make')


-- basic methods
-- used for manipulating ordinary lua tables
lam.basic = require(_mainroot..'src/methods/_basic')


-- lam class methods
-- (a lam object accesses these methods)
--		(see call to setmetatable in lam.new)
lam.methods = require(_mainroot..'src/methods')
lam.methods.__index = function (t,k)
	return lam.methods[k]
end


-------------------------------------------------------------------------------
-- basic methods


---------------------------------------
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


---------------------------------------
-- lam.copy_vla(vanilla_lua_array)
-- copies the elements of a simple contiguous array
function lam.copy_vla (vanilla_lua_array)
	local rt = {}
	for i=1,#vanilla_lua_array do
		rt[i] = vanilla_lua_array[i]
	end
	return rt
end




_mainroot = nil	-- in case this variable is used in other libraries, etc.
return lam
