
return function (t)
	local sum = 0
	for i=1,#t do
		sum = sum + t[i]
	end
	
	return sum
end