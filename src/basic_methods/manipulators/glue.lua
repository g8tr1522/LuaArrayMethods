-- works kinda like concat
-- you can simply toss whatever you want into the arguments, and `glue` will take each and make a table with them.
-- if you pass a table, `glue` will unpack it automatically.
--
--


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
