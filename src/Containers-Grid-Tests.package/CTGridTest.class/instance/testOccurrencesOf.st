tests-testing
testOccurrencesOf
		| grid4 |
	grid4 := self gridClass new: 2.
	grid4 atRow: 1 atColumn: 1 put: 1.
	grid4 atRow: 1 atColumn: 2 put: 1.
	grid4 atRow: 2  atColumn: 1 put: 1.
	grid4 atRow: 2 atColumn: 2 put: 0.
	self assert: (grid4 occurrencesOf: 1) equals: 3 