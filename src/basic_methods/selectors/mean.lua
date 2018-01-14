local sumfunc = require('src/basic_methods/selectors/sum')

return function (t)
	local sum, count = sumfunc(t)
	return sum/count, count
end
	