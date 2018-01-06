-- basic_selectors module
-- This module holds all the basic selectors that operate on VLAs
-- Selectors are methods that return single, or a few elements.
--
-- Note that some methods here have an underscore.
-- These are just like the non-underscored versions, except that they pick out unique elements.
--

basic_selectors = {}
local _root = "src/basic_methods/selectors/"



basic_selectors.sample     = require(_root..'sample')
basic_selectors.sample_    = require(_root..'sample_')



return basic_selectors