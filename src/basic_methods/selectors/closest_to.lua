-- finds positions of elements that are closest to the passed value
--
-- Return values:  `val, pos, matching, count`
--  - 
--
--


local find_index = require(_mainroot..'src/basic_methods/selectors/find_index')
local remove     = table.remove
local add        = require(_mainroot..'src/basic_methods/transformers/add')
local abs        = require(_mainroot..'src/basic_methods/transformers/abs')
local min        = require(_mainroot..'src/basic_methods/selectors/min')


return function (t, val, N, return_type)
	local rt = lam.copy_vla(t)
	
-- find positions of 'close' values (that may be equal)
	rt = add(rt, -val)
	rt = abs(rt)
	local _, closest_pos = min(rt, N)
	
-- find positions of equal values (which will be 0's in `rt`)
	local equal_pos, _, equal_count = find_index(rt, 0)
	
-- get a table of the closest values
	local closest_vals = {}
	if not N then
		closest_vals = t[closest_pos]
	else		
		for i=1,#closest_pos do
			closest_vals[i] = t[ closest_pos[i] ]
		end
	end
	
-- handle matching vals info request
	return_type = return_type or false
	if not N then
		return closest_vals[1], closest_pos
	elseif not return_type then
		return closest_vals, closest_pos, equal_pos, equal_count
	elseif return_type=="table" then
		return {
			closest_vals = closest_vals,
			closest_pos = closest_pos,
			closest_count = N,
			equal_val = val,
			equal_pos = equal_pos,
			equal_count = equal_count,
		}
	end
end
