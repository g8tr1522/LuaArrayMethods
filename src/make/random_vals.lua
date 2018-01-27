-- returns an array of values


local rand = math.random
local mult = require(_mainroot..'src/basic_methods/transformers/mult')
local add  = require(_mainroot..'src/basic_methods/transformers/add')


return function (length, low, high, as_integers)
-- handle input args
	if not high then
		high = low
		low = 0
		if as_integers then low = 1 end
	end
	if high<low then
		low, high = high, low
	end
	
-- create table
	local rt = {}
	if not as_integers then
		for i=1,length do
			rt[i] = rand()
		end
		rt = mult(rt, high-low )
		rt = add (rt, low )
	else
		for i=1,length do
			rt[i] = rand(low, high)
		end
	end

	return rt
end
