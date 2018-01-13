-- just a shell for the vanilla table.sort function
--

local vsort = table.sort

return function (t, sf)
	local rt = lam.vla_copy(t)
	
	vsort(rt, sf)
	
	return rt
end