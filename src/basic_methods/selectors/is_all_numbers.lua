-- returns `true` or `false` depending on whether `t` is all numbers or not
--
-- Actually returns three values : `is_all`, `number_pos`, `non_num_pos`
-- `is_all` is `true` if all elements in `t` are numbers. `false` otherwise.
-- `number_pos`     is a sequence of indices corresponding to elements which are numbers.
-- `non_number_pos` is a sequence of indices corresponding to elements which are not numbers.
--
-- Provide a string to `return_type` to change what `is_all_numbers` returns.
-- (This only checks the first character)
--	- 'positions' (default)
--		return `is_all`, `number_pos`, `non_num_pos`
--  - 'count'
--		return `is_all`, `#number_pos`, `#non_num_pos`
--	- 'values' or 'elements'
--		return `is_all`, `number_vals`, `non_num_vals`
--		Here, `number_vals` will be a new VLA which only has the elements from `t` which are numbers.
--		And `non_num_vals` is likewise for elements which aren't numbers.
--
--


local slice = require('src/basic_methods/transformers/slice')
local ssub = string.sub


return function (t, return_type)
	local number_pos, non_num_pos = {},{}
	local np,nnp = 0,0	-- indexes above tables
	local is_all = true
	
	for i=1,#t do
		if type(t[i])=="number" then
			np = np + 1
			number_pos[np] = i
		else
			is_all = false
			nnp = nnp + 1
			non_num_pos[nnp] = i
		end
	end
	
	return_type = return_type or 'p'
	return_type = sub(return_type,1,1)
	if return_type=='p' then
		return is_all, number_pos, non_num_pos
	elseif return_type=='c' then
		return is_all, #number_pos, #non_num_pos
	elseif return_type=='v' or return_type=='e' then
		return is_all, slice(t,number_pos), slice(t,non_num_pos)
	end
end