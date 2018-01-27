-- finds positions of elements that are equal to passed value
-- 
-- `val_or_func` can also be a function
--	- This function should have a single argument, 
--		which represents the extracted value from the array
--	- The function should return `true` when we want to select that element
--	- Example: get all even numbers
--			a = {1,2,3,4,5,0,'str'}
--			lam.basic.find_index(a, function(v) return a%2==0 end)
--			-- the above returns 
--			-- {2,4,6}, 3, {2,4,0}
-- 
-- Return values:  `pos, count, vals`
-- 
-- 
-- future: implement without using `table.unpack`
-- 
-- 


return function (t, val_or_func, unpacked)
	local pos, vals, count = {}, {}, 0
	
	if type(val_or_func)~="function" then
		vals = nil
		for j=1,#t do
			if t[j]==val_or_func then
				count = count + 1
				pos[count] = j
			end
		end
	else
		for j=1,#t do
			local v = t[j]
			if val_or_func(v) then
				count = count + 1
				pos[count] = j
				vals[count] = v
			end
		end
	end
	
	if unpacked then
		return unpack(pos), unpack(vals), count
	else
		return pos, vals, count
	end
end
