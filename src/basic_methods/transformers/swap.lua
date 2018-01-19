-- swap elements at `a` and `b`
--
-- argument types:
--	- `type(a)`, `type(b)`
--			(description here)
--	- "number", "number" 
--			swap `t[a]` and `t[b]`
--	- "table" (of numbers), "table" (of numbers)
--			do swaps for all `i` in swapping `t[a[i]]` and `t[b[i]]`
--	- "number", "nil"
--			do `a` swaps with randomly picked pairs of elements
--	- "table" (of numbers), "nil"
--			swap each element `t[a[i]]` with a randomly picked one
--
--
--


local shuffle = require(_mainroot..'src/basic_methods/transformers/shuffle')
local rand = math.random
local mini_swap = function(t, len_t, c, d)
	if c<len_t and d<len_t then
		t[c], t[d] = t[d], t[c]
	end
end


return function (t, a, b)
	local rt = lam.copy_vla(t)
	local len_rt = #rt
	
	if type(a)=="number" then
		if b then
			mini_swap(rt, len_rt, a, b)
		else
			mini_swap(rt, len_rt, a, b)
		end
	elseif type(a)=="table" then
		if b then
			if #a==#b then
				for i=1,#a do
					mini_swap(rt, len_rt, a[i], b[i])
				end
			else
				error("=== In `swap(t, a, b)`, #a doesn't equal #b")
			end
		else
			for i=1,#a do
				mini_swap(rt, len_rt, a[i], rand(len_rt) )
			end
		end
	end
	
	return rt
end
