-- selects elements at `t[ t_of_i ]` where `t_of_i` may be beyond the bounds of t
-- if `t_of_i` is a table of indices, select elements from `t` at `t_of_i[i]`
-- eg, `lam.basic.select({10,20,30}, {1,4,3,0,-1,5})` returns {10,10,30,30,20,20}
--
--


local index_modulo = function (i, len_t)
	i = i % len_t
	if i==0 then i=len_t end
	return i
end


return function (t, t_of_i)
	local rt = {}
	local len_t = #t
	
	if type(t_of_i)=="number" then
		return t[index_modulo(t_of_i, len_t)]
	else
		if type(t_of_i)=="table" then
			for i=1,#t_of_i do
				rt[i] = t[index_modulo(t_of_i, len_t)]
			end
		end
		return rt
	end
end
