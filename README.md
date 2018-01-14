# **LuaArrayMethods** (aka, "lam")
My attempt at bringing Ruby-style array methods to lua.

Documentation here :
https://github.com/g8tr1522/LuaArrayMethods/wiki/Documentation


### What is it?
Ever had an array of numbers, and you just needed to add a value to all of them? 
Or maybe you miss having the handy array methods that Ruby offers.
You could just write a loop, and `ipairs` should do the trick. 

What if your file has many of these kind of operations? 
You could write functions so that your loops aren't cluttering everything. 
Or if you're clever (ie, stubborn) like me, then you'd write a library to handle all this!


### This is an incomplete project!
This project is in the alpha stage. There are several implementation improvements I haven't gotten around to, and I still have plenty of more functions to add.

I don't have much documentation. 

	- See the section "How to use the lam module" in this README. 
	- There are brief function explanations in the [wiki](https://github.com/g8tr1522/LuaArrayMethods/wiki). 
	- [Click here](https://github.com/g8tr1522/LuaArrayMethods/wiki/docs-:-methods) to see explanations of the various array methods.
	- If you need more detailed explanations for a function, some have explanations in their respective source files, escpecially the less obvious ones. 
	- I eventually plan on adding a full documentation either on this repo's GitHub wiki, or as an Ldoc.

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




# **How to use the lam module**

## Quick Overview
- creates vanilla lua arrays from 'maker' functions
    - `arr = lam.make.range(-0.5, 1, 2.5)`  -->  {-0.5, 0.5, 1.5, 2.5}
- operate on vanilla lua arrays (VLAs) with the 'Basic methods'
	- `lam.basic.copy(vla)`
    - `lam.basic.foo(vla, ...)` 
    - `lam.basic.mult(arr, 1/0.5)`	 -->  {-1, 1, 3, 5}
	- in the above two examples, `vla` and `arr` are left unchanged
	- modify VLAs with assignment:
    - `vla = lam.basic.foo(vla, ...)`
    - `arr = lam.basic.mult(arr, 1/0.5)`	 -->  {-1, 1, 3, 5}
- create a 'lamarray' (an object from `lam.new`)
    - `o = lam.new( {...} )`
    - `o2 = lam.new("range", -0.5, 1, 2.5)`
- lamarrays act like vanilla lua arrays in some ways
    - `#o2`         --> 4
    - `o2[3]`       --> 1.5
    - `o2[3]='n'`   --> o2 is now {-0.5, 0.5, 'n', 2.5}
    - pass `o` to `ipairs`. No suprises!
- but there are exceptions:
    - `o2[3]=nil`   --> o2 is now {-0.5, 0.5, 2.5}  (this may change in the future)
    - `o:unpack()`  --  don't use `table.unpack(o)`
	- don't pass `o` to `pairs` unless you want to access its object properties!
	- you can access indices beyond the bounds of a lamarray
		- `o2` has a length of three, but you can index beyond three!
		- `o2[4]`, `o2[-1]`, and `o2[0]` return `-0.5`, `0.5`, and `2.5` respectively
- lamarray methods have all the 'basic' methods. Access them with the colon syntax :
    - `o2:sample()`
	- `o2:add(1)` -- `o2` is still {-0.5, 0.5, 2.5} (see below)
- lamarray manipulator methods can be 'chained' (like in Ruby)
	- Use underscores to change the lamarray in place (like the `!` in Ruby)
    - `o2:add_(1):add_(1)`  --> `o2` should now be {1.5, 2.5, 4.5}
	- no underscores preserves the original lamarray, but returns a new lamarray with the result
	- `o2:add(-2)`  --> this returns a new lamarray with {-0.5, 0.5, 2.5}
- some lamarray-specific methods:
    - `o3 = o2:copy()`       -- `o3` is now a distinct copy (and NOT a reference to) `o2`
    - `vla = o2:gettable()`  -- `vla` is just a distinct vanilla lua table, with the values from `o2`


	

## Terminology/Assumptions
- A "vanilla lua array" (or VLA) is just a contiguous table of other objects.
	- All elements should be indexed numerically.
	- Eg, the array made by `arr = {10,20,30,'a','b','c'}`
	- this is formally known as a "sequence" in lua. I will need to update the documentation to reflect this.
- A "lamarray" is an object declared from `lam.new(...)`
- An "array" means either a VLA or a lamarray
- You should try to keep arrays 'contiguous', ie, without `nil` elements.
	- The `compact` manipulator function can remove `nil` elements.
- Underscored methods.
	- Some functions have 'underscored' versions of themselves.
	- selector functions have underscored versions which are the 'unique' versions of themselves.
        - eg, `sample(t, 3)` returns 3 random elements from `t`.
        - but `sample_(t, 3)` returns 3 unique random elements from `t`.
		- if you want the `shuffle` manipulator to return a unique array, use `sattolo` (not implemented yet)
	- For lamarray manipulators, the underscored versions will replace the lamarray with the new one. There are no underscored _basic_ manipulators.
        - eg, `obj:add(3)` returns a new lamarray which is a copy of `obj`, but with `3` added to every element.
        - but `obj:add_(3)` returns `obj`, but `obj` now permanently has `3` added to every element.
- As of now, I have not provided encapsulation. 
	So be careful and try not to modify the `lam` module or any properties of lam objects. (unless you're modifying the source of course).
	
	
	
## Categorization of methods:
**lam module methods**

- The `lam` module has three basic uses:
	- make vanilla lua arrays (VLAs) with `lam.make` functions
	- make a lamarray with `lam.new(...)`
	- work on VLAs and lamarrays with the `lam.basic` functions
- There are two type of objects you can call the basic methods on:
	- On a vanilla lua array (accessed from `lam.basic`) 
        - As of now, all are accessed by doing `lam.basic.foo(vla, ...)`. That is, you should always pass your array as the first argument.
		- This style of calling will never modify the original array - it only returns the result (which may be a new array).
	- On a lamarray (accessed with colon syntax on lamarray objects)
		- using basic methods on lamarrays will never modify the lamarray unless it's an "underscored" manipulator (see below)

**Basic functions**

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
		
**lamarray methods**

- lam objects have the all the Basic functions as class methods. 
	- They are accessed with the colon syntax.
	- `lam_obj:basicfoo(...)` -- (don't ever pass the object when using the colon syntax).
- Manipulators:
	- Come in two styles: "non-destructive", and "underscored"/"destructive"
	- always returns a lamarray 
	- Non-destructive manipulators:
		- These have a caveat: Doing `lam_obj:manip(...)` doesn't change the VLA in `lam_obj`
		- This would return the new result though. 
		- These always return a new copy of the original lamarray.
	- Underscored/Destructive manipulators:
		- If you want to change `lam_obj` with a manipulator, add an underscore to the end of the function call:
		- `lam_obj:basicfoo_(...)` Permanently changes the VLA inside `lam_obj`
		- These have a cool 'chaining' feature. 
		- Eg, you can do this: `lam_obj:add_(5):shuffle_():mult_(1/3)`
		- This is because all underscored methods return a reference to the original (but modified) lamarray.
- 'meta' or 'object' functions
	- These are methods that work specifically on lam objects.
	- They include the overridden metamethods, but also include `gettable` and `settable`.

	


# **Why did you do this?**
I wrote this to assist with music-making purposes. But fear not: lam is very generic and the only music-related function is 'notes2midi'.

I did this to try and emulate the handy Ruby array methods that I grew fond of using from _SonicPi_ (a music-making 'IDE' of sorts which uses Ruby). 
Currently, I'm using this in the _Renoise_ DAW/music software. More specifically, for a modification of the _xStream_ 'tool'. _Renoise_ has a lua scripting API. There is no user library support in _xStream_, which can make user scripts dense and cluttered. This library helps me avoid that.

So if you're craving Ruby-style array methods as much as I am, 
or if you're using my _xStream_ mod (more likely), 
then this library may be useful to you!

	

