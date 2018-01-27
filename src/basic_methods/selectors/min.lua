-- lam.basic.min(t, N, but_greater_than)
-- finds smallest value in array, returns it and its position
-- returns two tables of the N smallest values and their positions if a number is passed to N
-- if `but_greater_than` is specified, then find smallest value(s) that is greater than `but_greater_than`
--
--
-- future: 
--	- allow search for minimum absolute value (and make an `abs` transformer)
--	- turn this into a transformer (new array becomes `val` table)
--  - return positions of N smallest elements.
--			- this is a challenge, since removing smallest elements means that 
--
--


local algo = function (t, but_greater_than)
	local smallest = math.maxinteger
	local pos = 0
	for j=1,#t do
		if but_greater_than<t[j] and t[j]<smallest then
			smallest = t[j]
			pos = j
		end	
	end
	
	return smallest, pos
end


return function ( t, N, but_greater_than )
	but_greater_than = but_greater_than or math.mininteger
	
	if not N then
		return algo(t, but_greater_than)
	else
		local vals, pos = {},{}
		local tempBGT = but_greater_than
		
		for i=1,N do
			local tempV, tempP = algo(t, tempBGT)
			tempBGT = tempV
			vals[i], pos[i] = tempV, tempP
		end
		
		return vals,pos
	end
end
