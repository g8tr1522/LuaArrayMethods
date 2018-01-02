-- as of now, this simply allows assignment with numerical indexing. 
-- 
-- Example:
--	`t = lam.new{ 10, 0.2, 'three'}`
--	We want to change 'three' to `3`
--	`t[3] = 3`
--	The above expression _actually_ sets `t.table[3]`
--
--
-- future:
--	- If assigning a table to an index, then just insert the table at that index
--	- If assigning nil, then 'flatten' `lam_obj.table` so that it isn't non-contiguous
--

return function (lam_obj, k, v)
	local t = lam_obj.table
	
	if type(k)=="number" then
		if 0<k and k<(#t+2) then
			t[k] = v
		else
			error("\nAssignment to invalid index."
					.."\nlam object "..tostring(lam_obj).." only has "..tostring(#lam_obj).." elements."
					,2)
		end
	else
		error("\nTried to create new, non-numerical index in lam object."
				.."\nAssignments to keys in lam object "..tostring(lam_obj).." can only be assignments to numerical indices"
				,2)
	end
end