I represent  a two-dimensional grid. I provide methods for creating grids, operating on them. A grid origin is the left topmost corner, hence subsequent lines are located "below".

!! Examples 
Here is a typical grid: 6 columns, 2 rows, growing down.
[[[ 
 CTGrid grid6x2CreatedWithRowsColumns printString
>>> '(
11 21 31 41 51 61
12 22 32 42 52 62
 )'
]]]

[[[
CTGrid  grid3x2BooksCreatedWithRows  printString 
>>>
'(
''A Time to Kill'' ''John Grisham'' 1989
''Blood and Smoke'' ''Stephen King'' 2010
''Spin'' ''Robert Charles Wilson'' 2006
 )'
]]]

!! Structure:
The implementation of this grid is not optimised for lines manipulation in the sense that it uses an array where lines are placed one after the other. 

 - rowCount : a non-negative integer saying how many rows there are.
 - columnCount : a non-negative integer saying how many columns there are.
 - contents : an Array holding the elements in row-major order.  That is, for a 2x3 array the contents are (11 12 13 21 22 23).  


!! Todo:
	- should write tests for all the methods.
	- ordering lines based on sorted order of one element (should have a look at the shorting collection extension)
	- iterations on all elements starting from topleft
	- may be we should not inherit from Collection.
	- columnsDo:

		
