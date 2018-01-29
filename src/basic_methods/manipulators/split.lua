-- splits an array and returns two copies of each portion
-- the first  copy has elements `t[1] .. t[index-1]`
-- the second copy has elements `t[index] .. t[#t]`
--
-- For example, if `t` has 5 elements, 
--
--
-- future: allow `index` to be a vararg so that multiple splits can be performed
--
--


return function (t, index)
	local rt1, rt2 = {}, {}
	
	if t[index] then
		for i=1,(index-1) do
			rt1[i] = t[i]
		end
		for i=index,#t do
			rt2[i+1-index] = t[i]
		end
		
		return rt1,rt2
	elseif index > #t then
		return lam.copy_vla(t), {}
	elseif index <= 0 then
		return {}, lam.copy_vla(t)
	end
end
