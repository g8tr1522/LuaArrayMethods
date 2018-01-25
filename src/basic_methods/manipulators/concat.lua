
return function (...)
	local arguments = {...}
	local rt = {}
	local count = 0
	
	for i=1,#arguments do
		local arg = arguments[i]
		if type(arg)=="table" then
			for i=1,#arg do
				count = count + 1
				rt[count] = arg[i]
			end
		else
			count = count + 1
			rt[count] = arg
		end
	end
	
	return rt
end
