tests-copying
testPostCopy
	| g23 |
	g23 := grid23 postCopy.
	
	self assert: (g23 atRow: 1 atColumn: 1) equals: 11.
	self assert: (g23 atRow: 1 atColumn: 2) equals: 21.
	self assert: (g23 atRow: 2 atColumn: 1) equals: 12.
	self assert: (g23 atRow: 2 atColumn: 2) equals: 22.
	self assert: (g23 atRow: 3 atColumn: 1) equals: 13.
	self assert: (g23 atRow: 3 atColumn: 2) equals: 23.
