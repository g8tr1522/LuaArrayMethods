-- reuturns true if a and b are identical on an element-by-element basis
-- else, returns false
--


return function (a,b)
	
	if #a==#b then
		for i=1,#a do
			if a[i] ~= b[i] then 
				return false
			end
		end
		
		return true
	end
	
end