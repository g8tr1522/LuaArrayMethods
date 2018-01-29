-- shift positions of elements either forwards or backwards
-- 
-- 
-- argument types:
--	- `type(index)`, `type(shift_by)`
--			(description here)
--	- "number", "number"
--			Shift element `t[index]` forward by `shift_by`
--			If `shift_by` is negative, then shift left through the array.
--	- "table", "number"
--			Do repeated calls to `shift` for each element in `index`
-- 
--
-- future:
--	- table.insert is really slow. Maybe do individual swaps with adjacent elements instead of removing and inserting elements.
--
--


local insert = table.insert
local remove = table.remove

local mini_shift = function (rt, index, shift_by)
	local pop = remove(rt, index)
	local new_index = (shift_by - index) % #rt +1
	insert(rt, new_index, pop)
	return rt
end


return function (t, index, shift_by)
	local rt = lam.copy_vla(t)
	
	if type(index)=="number" then
		return mini_shift(rt, index, shift_by)
	elseif type(index)=="table" then
		for i=1,#index do
			rt = mini_shift(rt, index[i], shift_by)
		end
		return rt
	end
	
end
