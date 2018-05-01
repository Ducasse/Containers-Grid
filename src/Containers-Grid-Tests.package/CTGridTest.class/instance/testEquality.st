tests - instance creation
testEquality
	| aGrid |
	aGrid := self gridClass rows: 3 columns: 3.
	aGrid atAllPut: 0.
	
	self assert: (grid23 = aGrid) equals: false.
	
	aGrid := grid23 postCopy.
	
	
	self assert: (grid23 = aGrid) equals: true.