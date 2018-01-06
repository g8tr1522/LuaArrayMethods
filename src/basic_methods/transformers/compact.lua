-- removes 'nils' from array
-- 
-- future: add checks to make sure order of elements is preserved.
--		This could be done by making sure that each successive value of k 
--		is greater than the previous one.
--


return function (t)
	local rt = {}
	
	local i = 0
	for k,v in pairs(t) do
		i = i + 1
		rt[i] = v
	end
	
	return rt
end
