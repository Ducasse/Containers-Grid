tests
testSwapColumnWithColumn
	self assert: (grid23 atRow: 1 atColumn: 1) equals: 11.
	self assert: (grid23 atRow: 1 atColumn: 2) equals: 21.
	self assert: (grid23 atRow: 2 atColumn: 1) equals: 12.
	self assert: (grid23 atRow: 2 atColumn: 2) equals: 22.
	self assert: (grid23 atRow: 3 atColumn: 1) equals: 13.
	self assert: (grid23 atRow: 3 atColumn: 2) equals: 23.
 "(
11 21
12 22
13 23
 )"		
	
	
	grid23 swapColumn: 1 withColumn: 2.

	self assert: (grid23 atRow: 1 atColumn: 1) equals: 21.
	self assert: (grid23 atRow: 1 atColumn: 2) equals: 11.
	self assert: (grid23 atRow: 2 atColumn: 1) equals: 22.
	self assert: (grid23 atRow: 2 atColumn: 2) equals: 12.
	self assert: (grid23 atRow: 3 atColumn: 1) equals: 23.
	self assert: (grid23 atRow: 3 atColumn: 2) equals: 13