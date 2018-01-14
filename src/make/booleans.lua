
--------------------------------------------------------------------------------
-- lam.make.booleans(length, prob)
--
----returns a table of `length` booleans with a `prob` probability of being true
--	
-- if `nil` is passed to length, then return a boolean with a `prob` chance of being true.
-- if `prob` is `nil`, then is it `0.5` by default.
-- if nothing is passed, has a 50/50 chance of returning `true` or `false`
--
--


local rand = math.random

local prob2bool = function (prob)
	if 0 <= prob and prob <= 1 then
		if prob >= rand() then
			return true
		else
			return false
		end
	else
		error("Error in lam.make.booleans(length, prob) : `prob` must be a value between 0 and 1"
		,2)
	end
end


return function (length, prob)
	prob = prob or 0.5
	
	if not length then
		return prob2bool(prob)
	else
		local rt = {}
		for i=1,length do
			rt[i] = prob2bool(prob)
		end
		return rt
	end
end


