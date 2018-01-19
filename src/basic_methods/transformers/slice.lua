-- selects elements at `t[ selected ]`
-- if `selected` is a table of elements, select elements from `t` at `selected[i]`
-- eg, `lam.basic.select({10,20,30}, {1,3})` returns {10, 30}
--
--


-- local mini_slice = function (t, 


return function (t, selected)
	local rt = {}
	
	if type(selected)=="number" then
		return t[selected]
	elseif type(selected)=="table" then
		for i=1,#selected do
			rt[i] = t[ selected[i] ]
		end
	end
	
	return rt
end
