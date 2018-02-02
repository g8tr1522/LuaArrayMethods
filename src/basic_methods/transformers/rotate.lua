-- rotate the array forwards and backwards
--
-- over-indexing is supported
-- see `lam.basic.shift` if you only want to 'rotate' specific elements
--
--


local split  = require(_mainroot..'src/basic_methods/manipulators/split')
local concat = require(_mainroot..'src/basic_methods/manipulators/concat')
--local abs = math.abs

local get_split_index = function (table_len, rotate_by)
	if rotate_by > 0 then
		return (table_len + 1) - (rotate_by % table_len)
	elseif rotate_by < 0 then
		return (-rotate_by % table_len) +1
	else
		return table_len + 1
	end
end


return function (t, rotate_by)
	--local rt = lam.copy_vla(t)
	local t1,t2 = split(t, get_split_index(#t, rotate_by))
	return concat(t2,t1)
end