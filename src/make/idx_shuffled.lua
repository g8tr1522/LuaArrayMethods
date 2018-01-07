
--------------------------------------------------------------------------------
-- tabler.
--
----
--

local idx = require(_mainroot..'src/make/idx')
--require('Chance/chance')

idx_shuffle = function (last)
	local t = idx(last)
	t = lam.methods.shuffle(t)
	
	return t
end


return idx_shuffle
