-- returns `new_t` and `insert_index` 
-- `new_t` returns new VLA which is a sorted version of `t` with the new value inserted
-- `insert_index` returns index at which to insert `val` into `t` (if t was sorted)
--
--


local is_all_numbers = require(_mainroot..'src/basic_methods/selectors/is_all_numbers')
local tsort = table.sort
local tinsert = table.insert


return function (t, val, perform_insert)
	perform_insert = perform_insert or true
	local rt = lam.copy_vla(t)
	
-- get the sorted version of t
	if not is_all_numbers(t) then
		error("t must be a VLA entirely of numbers"
			,2)
	end
	tsort(rt)
	
-- find insertion point
	local index = 1
	while index<=#t and val>t[index] do
		index = index + 1
	end
	
-- insert if desired
	if perform_insert then
		tinsert(rt, index, val)
	end
	
	return rt, index
end
