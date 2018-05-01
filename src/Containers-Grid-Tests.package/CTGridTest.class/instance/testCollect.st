tests - iterating
testCollect
	| newGrid |
	newGrid := self grid22 collect: [ :each | each * each ].
	 "(
1 3
2 4
 )"
	
	self assert: (newGrid atRow: 1 atColumn: 1) equals: 1.
	self assert: (newGrid atRow: 1 atColumn: 2) equals: 9.
	self assert: (newGrid atRow: 2 atColumn: 1) equals: 4.
	self assert: (newGrid atRow: 2 atColumn: 2) equals: 16.
