-- returns `true` if the `t` is all numbers and ascending
-- Actually returns two values : `ascending` and `descending`.
-- 
-- If `get_break_pos` is true, then replace `ascending` and `descending` with numbers
--		These numbers correspond to the index of the first element which violates the order
--
-- This only works on numerical sequences
--
--


return function (t, get_break_pos)
	get_break_pos = get_break_pos or false
	
	local t_len = #t
	local ascending, descending = true, true
	local aBP, dBP = false, false		-- ascending and descending break positions
	
-- test for ascending
	local prev = t[1]
	for i=2,t_len do
		local present = t[i]
		if prev <= present then
			prev = present
		else
			ascending = false
			aBP = i
			break
		end
	end
-- test for descension
	prev = t[t_len]
	for i=(t_len-1),1 do
		local present = t[i]
		if prev >= present then
			prev = present
		else
			descending = false
			dBP = i
			break
		end
	end
	
	if not get_break_pos then
		return ascending, descending
	else
		return aBP, dBP
	end
end
