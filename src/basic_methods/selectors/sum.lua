
return function (t)
	local sum = 0
	local count = 0
	
	for i=1,#t do
		local val = t[i] 
		if type(val)=="number" then
			sum = sum + val
			count = count + 1
		end
	end
	
	return sum, count
end