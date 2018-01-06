

return function(a,b)
	if a.lamtype and b.lamtype then
		local A,B = a:gettable(), b:gettable()
		local lenA = #A
		for i=1,#B do
			A[lenA + i] = B[i]
		end
		
		local new_obj = lam.new(A)
		new_obj.lamtype = "concat"
		return new_obj
	end	
end