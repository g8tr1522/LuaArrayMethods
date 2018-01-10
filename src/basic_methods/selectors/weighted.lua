--local sum = require(_mainroot..'src/basic_methods/selectors/sum')

local rand = math.random

return function (t, weights)
	if #t ~= #weights then
		error("Size of array ("..tostring(#t)..") and weights ("..tostring(#weights)..") must be the same."
			,1)
	end
	
-- get sum of `weights`, and get a modified copy of `weights` (`w`)
	local w = {}
	local sum = 0
	
	for i=1,#weights do
		sum = sum + weights[i]
		w[i] = sum	-- this creates a table of sums of ( weights[i] + <the previous weights> )
	end
	
-- now perform algo
	local randval = sum * rand()
	local chosen_index = 0
	
	for i=1,#w do
		if randval <= w[i] then
			chosen_index = i
			break
		end
	end
	
	return t[chosen_index]
end