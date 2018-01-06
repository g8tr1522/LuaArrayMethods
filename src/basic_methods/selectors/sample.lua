-- randomly return elements from an array
--
-- `amount` argument:
-- "nil" : return a single element
-- "number" : return that many elements
-- 
-- also see "sample_" to get unique elements
--


local rand = math.random


return function (t, amount)
	local len = #t
	
	if not amount then
		return t[ rand(len) ]
	elseif type(amount)=="number" then
		local rt = {} 	-- return table
		-- local idx = {}
		-- for i=1,len do
			-- idx[i] = i
		-- end
		
		for i=1,amount do
			rt[i] = t[ rand(len) ]
		end
		
		return rt
	end
end
	