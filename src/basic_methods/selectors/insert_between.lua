-- returns `new_t` and `insert_index` 
-- `new_t` returns new VLA which is a sorted version of `t` with the new value inserted
-- `insert_index` returns index at which to insert `val` into `t` (if t was sorted)
--
--


local is_all_numbers = require('src/basic_methods/selectors/is_all_numbers')
local sort = table.sort
local insert = table.insert


return function (t, val)
	local rt = lam.copy_vla(t)
	if 
	sort(rt)
	
	local index = 1
	while index<=#t and val>t[index] do
		index = index + 1
	end
	
	insert(rt, index, val)
	
	return rt, index
end
