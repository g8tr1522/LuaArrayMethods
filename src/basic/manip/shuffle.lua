-- use chance submodule to shuffle array
local rand = math.random


return function (t)
	local rt = lam.copy_vla(t)  -- copy input table into return table
	
	for i=#rt,2,-1 do
		local j = rand(1,i)
		local rti,rtj = rt[i],rt[j]
		rt[i] = rtj
		rt[j] = rti
	end
	
	return rt
end
