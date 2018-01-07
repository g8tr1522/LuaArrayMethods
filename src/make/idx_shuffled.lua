
--------------------------------------------------------------------------------
-- tabler.
--
----
--

local idx = require(_mainroot..'src/make/idx')
local shuffle = require(_mainroot..'src/basic_methods/transformers/shuffle')
--require('Chance/chance')

idx_shuffle = function (last)
	local t = idx(last)
	--t = lam.basic.shuffle(t)
	t = shuffle(t)
	
	return t
end


return idx_shuffle
