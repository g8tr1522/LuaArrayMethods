--lam.methods.remove(arg, arg2)
-- remove items from lam array
-- doesn't work exactly like table.remove
-- 
--
-- arg type handling:
--	- type(arg)
--			- descreption
--	- "nil"
--			- remove a random element from the array
--			- `re` won't be a table
--	- "number"
--			- remove `arg` elements, randomly chosen.
--			- `remove` then returns a third value, the indices that the removed values
--						belonged at before this function was called.
--	- "table"
--			- remove the elements in `self` whose indices correspond to the elements in `arg`
--			- the elements in `arg` MUST be ascending, else, there will be unexpected results!
--					- this is to avoid a call to a sort function, which would slow down this function
--					- use a loop and remove elements one at a time if you need an out-of-order remove
--	- "string"
--			- can be either 'r', 'f', 'l', or 'i'
--			- can also be "random", "first", "last", or "index"
--			- the return value `re` won't be a table, but a number
--			- 'r' removes a single random element
--			- 'f' removes the first element
--			- 'l' removes the last element
--			- 'i' removes element at index `arg2`
--	- if there are two args, and they are both numbers:
--			- remove elements from `arg` to `arg2`
--
--
-- about return values
--	- remove always returns two values, `re, rt`
--	- `re` is the table of removed elements.
--			- `re` won't be a table if `arg` is a string type, or if no arguments are called.
--	- `rt` is the new table, after removing the items
--
--

--			
-- future: 
--  - toi doesn't work at all. (when arg is a number)
--  - get pseudocode working (when arg is a table)
--


local vrem = table.remove -- vanilla remove
local rand = math.random
remove = nil

function remove (t, arg, arg2)
	local rt = lam.copy_vla(t)	-- copy input table into return table
	local re = {}		-- return elements
	
	
	if (not arg) and (not arg2) then
		re = vrem(rt, rand(#rt))
	
	elseif type(arg)=="number" and (not arg2) then
		local toi = {}	--table of indices for removed elements
		for i=1,arg do
			local j = rand(#rt)
			toi[i] = j + (i-1)	-- this preserves the actual index prior to the function call
			re [i] = vrem(rt,j)
		end
		return re, rt --, toi
		
	elseif type(arg)=="table" then
		-- future: `arg` can be out of order, but we must do the pseudocode:
		--		the pseudocode is all commented lines in this `elseif` block, that are beginning with "----"
		---- local skipped = 0
		for i=1,#arg do
			local current_idx = arg[i]+(i-1)
			---- if current_idx < prev_idx then
			----		skipped += 1
			---- end
			---- current_idx = current_idx + skipped
			re[i] = vrem(rt, current_idx)
			---- local prev_idx = current_index
		end
	
	elseif type(arg)=="string" then
		if arg=='i' or arg=="index" then
			re = vrem(rt, arg2)
		elseif arg=='f' or arg=="first" then
			re = vrem(rt, 1)
		elseif arg=='l' or arg=="last" then
			re = vrem(rt, #rt)
		elseif arg=='r' or arg=="random" then
			re = vrem(rt, rand(#rt))
		end
		
	elseif type(arg)=="number" and type(arg2)=="number" then
		for i=1,(arg2-arg+1) do
			re[i] = vrem(rt, arg+(i-1))
		end
	
	else
		error("=== Error in lam.methods.remove :"
			.."\n  = Input args are incompatible."
			.."\n  = Please check documentation."
			, 2)
		
	end
	
	return re, rt	
end


return remove
