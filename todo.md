# Things to do in the future

This is my to do list.

Note: many files have comments with the word "future" or "Future improvements".
	Search for these comments to find things which may not be included here.

I put the sections in order of highest priority to lowest.



-------------------------------------------------------------------------------
## Known bugs
(none, afaik)



-------------------------------------------------------------------------------
## Encapsulation

As of now, everything is visible and accessible to the user.
This really needs to change.

- The only thing the user can't do is add keys to a lam object.
- I want the lam module to be _totally_ unmodifiable. 
- function `insert_methods_from_submodule` should be invisible to the user.
- a lam object should only be modified by using it's methods. 
	- ie, the methods in `lam.object_methods`
	- all properties of a lam object MUST be inaccessible.
	- a lam object can also be modified with assignments to numerical indices
	
	
	