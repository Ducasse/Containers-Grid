tests-accessing element
testAtRowAtColumnPut
	grid23 atRow: 2 atColumn: 2 put: 0.
	self assert: (grid23 atRow: 2 atColumn: 2) equals: 0