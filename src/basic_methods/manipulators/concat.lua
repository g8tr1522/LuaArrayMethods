-- simple concatenation of two tables
-- if you need something more, see `glue`
--
--


return function (t1, t2)
	local rt = {}
	
	local t1_len = #t1
	for i=1,t1_len do
		rt[i]        = t1[i]
	end
	for i=1,#t2 do
		rt[i+t1_len] = t2[i]
	end
	
	return rt
end
