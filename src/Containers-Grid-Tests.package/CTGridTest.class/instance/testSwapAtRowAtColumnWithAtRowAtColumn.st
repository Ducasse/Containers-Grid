tests-modifying
testSwapAtRowAtColumnWithAtRowAtColumn
	grid23
		swapAtRow: 1
		atColumn: 1
		withAtRow: 2
		atColumn: 2.
	self assert: (grid23 atRow: 1 atColumn: 1) equals: 22.
	self assert: (grid23 atRow: 2 atColumn: 2) equals: 11