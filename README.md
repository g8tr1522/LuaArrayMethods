# **LuaArrayMethods** (aka, "lam")
My attempt at bringing Ruby-style array methods to lua.
Initial release coming soon! The master branch will always have the lastest stable release.



### What is it?
Ever had an array of numbers, and you just needed to add a value to all of them? 
Or maybe you miss having the handy array methods that Ruby offers.
You could just write a loop, and `ipairs` should do the trick. 

What if your file has many of these kind of operations? 
You could write functions so that your loops aren't cluttering everything. 
Or if you're clever (ie, stubborn) like me, then you'd write a library to handle all this!




### Installation
_If "lam.lua" is in the root directory of your main file_, 
then simply require the `lam` module from "lam.lua" and you should be good to go.

_Else,_ 
declare a global constant `_lamroot` in your main. 
This should be a string containing the path to "lam.lua" relative to your main file.

Eg, if your project folder was: 
    - 'project/main.lua' 
    - 'project/src/LuaArrayMethods/lam.lua'
Then in your main file, you should add two statements:
    - `_lamroot = 'src/LuaArrayMethods/'`
    - `lam = require(_lamroot..'lam')`

	
	

# **Basic usage**

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
- A "lamarray" is an object declared from `lam.new(...)`
- You should try to keep arrays 'contiguous', ie, without `nil` elements.
	- The `compact` manipulator function can remove `nil` elements.
- Underscored methods.
	- Some functions have 'underscored' versions of themselves.
	- selector functions have underscored versions which are the 'unique' versions of themselves.
        - eg, `sample(t, 3)` returns 3 random elements from `t`.
        - but `sample_(t, 3)` returns 3 unique random elements from `t`.
	- For lamarray manipulators, the underscored versions will replace the lamarray with the new one. There are no underscored _basic_ manipulators.
        - eg, `obj:add(3)` returns a new lamarray which is a copy of `obj`, but with `3` added to every element.
        - but `obj:add_(3)` returns `obj`, but `obj` now permanently has `3` added to every element.
- As of now, I have not provided encapsulation. 
	So be careful and try not to modify the `lam` module or any properties of lam objects.
	
	
	
## Categorization of methods:
- lam class methods
	- The `lam` module has four basic uses:
		- make vanilla lua arrays (VLAs) with `lam.make` functions
		- work on VLAs with `lam.basic` functions
		- make a "lam object" with `lam.new(...)`
		- get an iterator from `lam.iters` (coming soon...)
- There are two type of objects you can call the basic methods on:
	- On a vanilla lua array (accessed from `lam.basic`) 
        - As of now, all are accessed by doing `lam.basic.foo(vla, ...)`. That is, you should always pass your array as the first argument.
		- This style of calling will never modify the original array - it only returns the result (which may be a new array).
	- On a lamarray (accessed with colon syntax on lamarray objects)
- Basic functions
	- Comes in three styles:
		- 'Transformers'
			- These operate on all elements of an array
			- Always returns a new array, which is a transformed copy of the original
		- 'Manipulators'
            - These are sort of 'meta' functions. 
            - These can destroy or add elements from the original array, or they may return several arrays.
		- 'Selectors'
			- These are methods that may only return a single element
			- Eg, select a random element, or progressively 'count' through the array.
			- Some selectors have an 'underscored' version of themselves. These are the 'unique' versions of the original. 
                - eg, `sample(t, 3)` returns 3 random elements from `t`.
                - but `sample_(t, 3)` returns 3 unique random elements from `t`.
			- These functions may also return multiple values.
			- Some selectors work only on lamarrays.
- lam object functions
	- lam objects have the all the basic methods. 
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
	- 'meta' or 'object' functions
		- These are methods that work specifically on lam objects.




# Why did you do this?
I wrote this to assist with music-making purposes. But fear not: lam is very generic and the only music-related function is 'notes2midi'.

I did this to try and emulate the handy Ruby array methods that I grew fond of using from _SonicPi_ (a music-making 'IDE' of sorts which uses Ruby). 
Currently, I'm using this in the _Renoise_ DAW/music software. More specifically, for a modification of the _xStream_ 'tool'. _Renoise_ has a lua scripting API. There is no user library support in _xStream_, which can make user scripts dense and cluttered. This library helps me avoid that.

So if you're craving Ruby-style array methods as much as I am, 
or if you're using my _xStream_ mod (more likely), 
then this library may be useful to you!

	

