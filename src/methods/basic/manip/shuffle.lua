-- use chance submodule to shuffle array
local rand = math.random


return function (t)
	for i=#t,2,-1 do
		local j = rand(1,i)
		local ti,tj = t[i],t[j]
		t[i] = tj
		t[j] = ti
	end
	
	return t
end
