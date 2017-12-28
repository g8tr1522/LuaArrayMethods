return function (t, ...)	
	local rt = lam.copy_vla(t)  -- copy input table into return table
	return table.insert(rt, ...)
end
