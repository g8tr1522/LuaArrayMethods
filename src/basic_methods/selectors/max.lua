-- lam.basic.max(t, N, but_less_than)
-- just like `lam.basic.min` except finds the largest values
--
--


local algo = function (t, but_less_than)
	local largest = math.mininteger
	local pos = 0
	for j=1,#t do
		if largest<t[j] and t[j]<but_less_than then
			largest = t[j]
			pos = j
		end			
	end
	
	return largest, pos
end


return function ( t, N, but_less_than )
	but_less_than = but_less_than or math.mininteger
	
	if not N then
		return algo(t, but_less_than)
	else
		local vals, pos = {},{}
		local tempBLT = but_less_than
		
		for i=1,N do
			local tempV, tempP = algo(t, tempBLT)
			tempBLT = tempV
			vals[i], pos[i] = tempV, tempP
		end
		
		return vals,pos
	end
end
