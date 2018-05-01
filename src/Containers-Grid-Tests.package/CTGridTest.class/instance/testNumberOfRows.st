tests-accessing - setters/getters
testNumberOfRows
		| grid4 |
	grid4 := self gridClass new: 2.
	grid4 rowNUmber: 4.
	self assert: grid4 rowNumber equals: 4