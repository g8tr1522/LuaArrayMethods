-- require this file to use in other projects

-- module
lam = {}

-- require chance repo/submodule
chance = require('chance/chance')


-- make method
lam.make = require('src/make')


-- lam class methods
lam.methods = require('src/methods')
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



return lam
