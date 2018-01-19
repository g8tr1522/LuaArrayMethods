-- limit values between the `lowest` and `highest` values
-- use `nil` if you only want to clamp to one or the other
--
--


local mini_clamp = function (val, lowest, highest)
	if val<lowest then
		return lowest
	elseif val>highest then
		return highest
	else 
		return val
	end
end


return function (t, lowest, highest)
	lowest = lowest or math.mininteger
	highest = highest or math.maxinteger
	local rt = lam.copy_vla(t)
	
	if type(rt)=="number" then
		return mini_clamp(rt, lowest, highest)
	elseif type(rt)=="table" then
		for i=1,#rt do
			local val = rt[i]
			if type(val)=="number" then
				val = mini_clamp(val, lowest, highest)
			end
			rt[i] = val
		end
	end
	
	return rt
end