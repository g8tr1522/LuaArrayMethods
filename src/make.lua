-- lam.make
-- submodule which holds the functions that make vanilla lua tables.

make = {}
local _root = _mainroot.."src/make/"

-- regular table (used for lam.new)
make["table"]						= require(_root..'table')
	make.vanilla						= make.table
	make.luatable						= make.table

-- functions used to create arrays that index other tables
make["idx"] 						= require(_root..'idx')
	make.indexer						= make.idx
make["idx_shuffled"]		=	require(_root..'idx_shuffled')
	make.shuffle_indices		= make.idx_shuffled
	make.shuffled_indices		= make.idx_shuffled
	make.random_indices 		= make.idx_shuffled
-- make["idx_reverse"]			=	require(_root..'idx_reverse')
	-- make.reverse_indices		= make.idx_reverse

-- other maker functions
make["repeat"]					= require(_root..'repeat')
	make.all								= make["repeat"]
make["range"]						= require(_root..'range')
make.linspace           = require(_root..'linspace')
make.booleans           = require(_root..'booleans')
	make.prob2bools       	= make.booleans
	make.prob2bool        	= make.booleans


return make
