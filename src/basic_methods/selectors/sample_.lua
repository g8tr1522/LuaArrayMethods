-- randomly return elements from an array
--
-- `amount` argument:
-- "nil" : return a single element
-- "number" : return that many elements
-- 
-- future: 
-- Build unique array with "inside-out" version of Fisher-Yates shuffle algorithm.
--		https://en.wikipedia.org/wiki/Fisher%E2%80%93Yates_shuffle#The_"inside-out"_algorithm
-- Allow `amount` to be greater than the length of `t`. 
--		Then build a table with each `#t` elements containing calls to `sample(t, #t)`.
--		See commented-out code.
--		This code uses recursion, which doesn't work as usual in lua. Can be fixed if we use above future improvement.
--


local rand = math.random
local rmv  = table.remove


local sample_ = function (t, amount)
	local len = #t
	
	if not amount then
		return t[ rand(len) ]
	elseif type(amount)=="number" then
		if 1<=amount and amount<=len then
			local indices = {}  -- used to get unique elements
			for i=1,len do
				indices[i] = i
			end
			
			local rt = {} 	    -- return table
			for i=1,amount do
				local idx = rmv(indices, rand(#indices))	-- removing guarantees unique elements
				rt[i] = t[ idx ]
			end
			return rt
			
		elseif amount>=len then
			error("Tried to build unique array with "..tonumber(amount).." elements. The original array has only "..tonumber(#t).." elements."
					,2)
			-- local rt = {}
			
			-- for i=1,amount//len do
				-- local this_rt = sample_(t, len)
				-- rt = table.insert(rt, this_rt)
			-- end
			
			-- rt = table.insert(rt, sample_(t, amount%len))
			-- return rt
			
		end
	end
end


return sample_
	