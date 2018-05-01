tests-accessing subgrids
testAtRowsToColumnsToPut
	| aGrid grid12 |
	grid12 := self gridClass rows: 2 columns: 1.
	grid12 atRow: 1 atColumn: 1 put: 0.
	grid12 atRow: 2 atColumn: 1 put: 1.
	aGrid := grid23
		atRows: 1
		to: 2
		columns: 1
		to: 1
		put: grid12.
	self assert: aGrid columnCount equals: 1.
	self assert: aGrid rowNumber equals: 2.
	self assert: (aGrid atRow: 1 atColumn: 1) equals: 0.
	self assert: (aGrid atRow: 2 atColumn: 1) equals: 1