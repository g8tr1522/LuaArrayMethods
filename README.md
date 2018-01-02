# LuaArrayMethods (aka, "lam")
My attempt at bringing Ruby-style array methods to lua.




## What is it?
Ever had an array of numbers, and you just needed to add a value to all of them? 
Or maybe you miss having the handy array methods that Ruby offers.
You could just write a loop, and `ipairs` should do the trick. 

What if your file has many of these kind of operations? 
You could write functions so that loops aren't cluttering everything. 

Or if you're clever (ie, stubborn) like me, then you'd write a library to handle all this!




## Installation
If "lam.lua" is in the root directory of your main file, then
simply require the `lam` module from "lam.lua" and you should be good to go.

Else, declare a global constant `_lamroot` in your main. 
This should be a string containing the path to "lam.lua" relative to your main file.

Eg, if your project folder was: 
	- > 'project/main.lua'
	- > 'project/src/LuaArrayMethods/lam.lua'
Then in your main file, you should add
	- `_lamroot = 'src/LuaArrayMethods/'`
	- `lam = require(_lamroot..'lam')`

	
	

# Basic usage

## Quick Overview
- creates vanilla lua arrays from 'maker' functions
	- `arr = lam.make.range(-0.5, 1, 2.5)`  -->  {-0.5, 0.5, 1.5, 2.5}
- modify a vanilla lua array:
	- `vla = lam.basic.foo(vla, ...)`
	- `arr = lam.basic.mult(arr, 1/0.5)`	 -->  {-1, 1, 3, 5}
- create a lam object
	- `o = lam.new( {...} )`
	- `o2 = lam.new("range", -0.5, 1, 2.5)`
- lam objects act like vanilla lua arrays
	- `#o2`         --> 4
	- `o2[3]`       --> 1.5
	- `o2[3]='n'`   --> o2 is now {-0.5, 0.5, 'n', 2.5}
	- `o2[3]=nil`   --> o2 is now {-0.5, 0.5, 2.5}  (this may change in the future)
	- `o:unpack()`  --  don't use `table.unpack(o)`
	- pass `o` to `ipairs`. No suprises!
- lam object methods act like the 'basic' methods:
	- `o2:shuffle()` 	 --> could be {-0.5, 2.5, 0.5}, but `o2` hasn't changed
	- `o2:shuffle_()`  --  use an underscore to change the table in place. 
- some methods can be 'chained' (like in Ruby) (must be underscored)
	- `o2:add_(1):add_(1)`  --> could be {1.5, 4.5, 2.5}
- some class-specific methods:
	- `o3 = o2:copy()`      -- `o3` is now a distinct copy (and NOT a reference to) `o2`
	- `vla_version = o2:gettable()`  -- `vla_version` is just a distinct, vanilla lua table.


	

## Terminology/Assumptions
- A "vanilla lua array" (or VLA) is just a contiguous table of other objects.
	- All elements should be indexed numerically.
	- Eg, the array made by `arr = {10,20,30,'a','b','c'}`
- You should try to keep arrays 'contiguous', ie, without `nil` elements.
	- `lam.basic.compact` can remove `nil` elements.
- Underscored/Destructive methods.
	- These are any methods which modifies the table in place. 
	- Eg, if `o` is a `lam` object,
	- `o:add(5)` returns a separate table that is o, but with 5 added to everything.
	`o` is still the same as before the call.
	- `o:add_(5)` modifies `o`, and returns it (ie, returns the new version of `o`).
- As of now, I have not provided encapsulation. 
	So be careful and try not to modify the `lam` module 
	or any properties of lam objects.
	
	
	
## Categorization of methods:
- lam class methods
	- The `lam` module has four basic uses:
		- make vanilla lua arrays with `lam.make` functions
		- work on VLAs with `lam.basic` functions
		- make a "lam object" with `lam.new(...)`
		- make a copy (and not a reference to) a vanilla lua array with `lam.copy_vla(t)`
- There are two type of objects you can call the basic methods on:
	- On a vanilla lua array (`lam.basic`) 
	- On a lam object (`lam.object_methods`)
- Basic functions
	- Accessed from `lam.basic` 
	- As of now, all are accessed by doing `lam.basic.foo(vla, ...)` which returns the new array (`vla` is unchanged)
		- That is, you should always pass your array as the first argument.
	- Come in two styles:
		- 'Manipulators' (or "manip"). 
			- These operate on all elements of an array
			- Usually return an array, which is a transformed copy of the original
		- 'Other'. 
			- These are methods that may only return a single element
			- Eg, select a random element, or progressively 'count' through the array.
			- They may also be 'meta' functions, like removing and inserting elements into an array, or special print functions.
			- These functions may also return multiple arguments.
			- I may add iterators to this category. (I don't have any right now).
- lam object functions
	- All lam objects have the basic methods. 
		- They are accessed with the colon syntax.
		- `lam_obj:basicfoo(...)`
	- Manipulators:
		- Come in two styles: "non-destructive", and "underscored"/"destructive"
		- Non-destructive manipulators:
			- These have a caveat: Doing `lam_obj:manip(...)` doesn't change the VLA in `lam_obj`
			- This would return the new result though.
			- More specifically, these return a VLA with the new result. (This may change in the future)
		- Underscored/Destructive manipulators:
			- If you want to change `lam_obj` with a manipulator, add an underscore to the end of the function call:
			- `lam_obj:basicfoo_(...)` Permanently changes the VLA inside `lam_obj`
			- These have a cool 'chaining' feature. 
			- Eg, you can do this: `lam_obj:add_(5):shuffle_():mult_(1/3)`
			- This is because all underscored methods return `self` as it's first return value.
	- 'Other' basic functions
		- These will never modify the VLA in a lam object.
		- If you need `insert`, or `remove`, then look inside the meta functions.
	- 'meta' or 'class' functions
		- These are methods that work specifically on lam objects.




# Why would you do this? Isn't lua supposed to be a simple language?
I wrote this to assist with music-making purposes. But fear not: lam is very generic 
and the only music-related function is 'notes2midi'.

I did this to try and emulate the handy Ruby array methods that I grew fond 
using from _SonicPi_ (a music-making 'IDE' of sorts which uses Ruby). 
I'm using this in the _Renoise_ DAW/music software - specifically, 
for a modification of the _xStream_ 'tool'. _Renoise_ has a lua scripting API.

So if you're craving Ruby-style array methods as much as I am, 
then this library may be useful to you.

	

