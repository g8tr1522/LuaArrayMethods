-- copies the elements of a simple contiguous array

return function (vanilla_lua_array)
	local rt = {}
	for i= 1,#vanilla_lua_array do
		rt[i] = vanilla_lua_array[i]
	end
	return rt
end