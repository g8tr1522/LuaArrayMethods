-- do passed function on every element in array
--
-- The passed function should always have just one parameter. 
-- Each element is passed as that argument.
-- So your functions should look like :
--	function(v) ... end
--

return function (t, anonfunc)
	if type(t)=="table" and type(anonfunc)=="function" then
		local rt = lam.copy_vla(t)
		for i=1,#rt do
			rt[i] = anonfunc(rt[i])
		end
		return rt
	end
end
