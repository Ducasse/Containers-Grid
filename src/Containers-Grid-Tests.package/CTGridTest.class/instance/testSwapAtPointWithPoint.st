tests-modifying
testSwapAtPointWithPoint
	| p1 p2 |
	p1 := 1 @ 1.
	p2 := 2 @ 2.
	grid23 swapAtPoint: p1 withPoint: p2.
	self assert: (grid23 atRow: 1 atColumn: 1) equals: 22