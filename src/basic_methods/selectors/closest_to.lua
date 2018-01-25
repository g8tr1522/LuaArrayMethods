-- finds positions of elements that are closest to the passed value
--
-- Return values:  `val, pos, matching, count`
--  - 
--
--


local find_index = require('src/basic_methods/selectors/find_index')
local remove     = table.remove
local add        = require('src/basic_methods/transformers/add')
local abs        = require('src/basic_methods/transformers/abs')
local min        = require('src/basic_methods/selectors/min')
--local concat     = require('src/basic_methods/manipulators/concat')

return function (t, val, N, return_as_table)
	return_as_table = return_as_table or false
	local rt = lam.copy_vla(t)
	
-- -- first, find all equal values, and remove them
	-- local eq_pos = find_index(t, val)
	-- for _,v in ipairs(eq_pos) do
		-- remove(rt, v)
	-- end
	
-- find positions of 'close' values (that may be equal)
	rt = add(rt, -val)
	rt = abs(rt)
	local _, closest_pos = min(rt, N)
	
-- find positions of equal values (which will be 0's in `rt`)
	local equal_pos, _, equal_count = find_index(rt, 0)
	
-- get a table of the closest values
	local closest_vals = {}
	for i=1,#closest_pos do
		closest_vals[i] = t[ closest_pos[i] ]
	end
	
-- handle matching vals info request
	if not return_as_table then
		return closest_pos, closest_vals, equal_pos, equal_count
	else
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
