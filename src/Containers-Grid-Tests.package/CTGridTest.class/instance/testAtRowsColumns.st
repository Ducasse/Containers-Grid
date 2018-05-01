tests-accessing subgrids
testAtRowsColumns
	| aGrid |
	aGrid := grid23 atRows: #(1 2) columns: #(1).
	
	self assert: aGrid columnCount equals: 1.
	self assert: aGrid rowNumber equals: 2.
	self assert: (aGrid atRow: 1 atColumn: 1) equals: 11.
	self assert: (aGrid atRow: 2 atColumn: 1) equals: 12.
	 