-- require this file to use in other projects

-------------------------------------------------------------------------------
-- module and other globals used for loading
lam = {}

local _old_mainroot = ''
if _mainroot then _old_mainroot = _mainroot end  -- stash old mainroot and reload it at the end of this file
_mainroot = _lamroot or ''	--folder that lam.lua is kept in 


unpack = unpack or table.unpack  -- Renoise API does not have table.unpack


-- This is a global function that other submodules will use to insert methods
--	from other submodules.
local function insert_methods_from_submodule (receiver_submodule, submodule_name)
	local subm = require(_mainroot..submodule_name)
	for k,v in pairs(subm) do
		receiver_submodule[k] = v
	end
	subm = nil
end



-------------------------------------------------------------------------------
-- requires

-- require chance repo/submodule
-- chance = require(_mainroot..'chance/chance')


-- make methods
-- used for making vanilla lua tables
lam.make = require(_mainroot..'src/make')


-- basic methods
-- used for manipulating ordinary lua tables
lam.basic = require(_mainroot..'src/basic_methods')


-- lam class methods
-- (a lam object accesses these methods)
--		(see call to setmetatable in lam.new)
lam.lamarray_methods = require(_mainroot..'src/lamarray_methods')
lam.lamarray_methods.__index = function (t,k)
	if type(k)=="number" then
		k = k % #t.table
		if k==0 then k=k+#t.table end
		return t.table[k]
	elseif type(k)=="string" then
		return lam.lamarray_methods[k]
	end
end



-------------------------------------------------------------------------------
-- other methods


---------------------------------------
-- lam.new(table_or_type, make_args)
-- returns a new lam table
-- a lam table can use the above class methods
function lam.new (table_or_type, ...)
	local o = {}
	if type(table_or_type)=="table" then
		o.table   = table_or_type or {}
		o.lamtype = "undeclared"
	elseif type(table_or_type)=="string" then
		o.table   = lam.make[table_or_type](...)
		o.lamtype = table_or_type
	end
	
	setmetatable(o, lam.lamarray_methods)
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




_mainroot = _old_mainroot	-- in case this variable is used in other libraries, etc.
return lam
