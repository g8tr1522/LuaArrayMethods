-- basic_selectors module
-- This module holds all the basic selectors that operate on VLAs
-- Selectors are methods that return single, or a few elements.
--
-- Note that some methods here have an underscore.
-- These are just like the non-underscored versions, except that they pick out unique elements.
--

basic_selectors = {}
local _root = _mainroot.."src/basic_methods/selectors/"




-- math related
basic_selectors.sum              = require(_root..'sum')
basic_selectors.min              = require(_root..'min')
basic_selectors.max              = require(_root..'max')

-- choosing values
basic_selectors.weighted         = require(_root..'weighted')
basic_selectors.sample           = require(_root..'sample')
basic_selectors.sample_          = require(_root..'sample_')
basic_selectors.at               = require(_root..'at')

-- comparisons
basic_selectors.table_compare    = require(_root..'table_compare')
basic_selectors.closest_to       = require(_root..'closest_to')
	basic_selectors.nearest          = basic_selectors.closest_to
basic_selectors.find_index       = require(_root..'find_index')
	basic_selectors.find             = basic_selectors.find_index
	basic_selectors.index            = basic_selectors.find_index
	basic_selectors.compare          = basic_selectors.find_index



return basic_selectors