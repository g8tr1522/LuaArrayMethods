


local rand     = math.random
local slice    = require(_mainroot..'src/basic_methods/transformers/slice')
local replace  = require(_mainroot..'src/basic_methods/transformers/replace')

local mini_shuffle = function (rt, how_many)
	local how_many = how_many or #rt
	for i=how_many,2,-1 do
		local j = rand(1,i)
		local rti,rtj = rt[i],rt[j]
		rt[i] = rtj
		rt[j] = rti
	end
	return rt
end


return function (t, choose)
	local rt = lam.copy_vla(t)  -- copy input table into return table
	
	if not choose then
		rt = mini_shuffle(rt)
	elseif type(choose)=="number" then
		if choose<2 then
			choose = 2
			print("=== Warning! lam.basic.shuffle : you must always shuffle at least two elements!")
		end
		rt = mini_shuffle(rt, choose)
	elseif type(choose)=="table" then
		local elements = slice(t, choose)
		elements = mini_shuffle(elements)
		rt = replace(rt, choose, elements)
	end
	
	return rt
end
