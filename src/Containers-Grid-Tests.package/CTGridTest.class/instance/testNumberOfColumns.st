tests-accessing - setters/getters
testNumberOfColumns
	| grid4 |
	
	grid4 := self gridClass new: 2.
	grid4 columnCount: 4.
	
	self assert: grid4 columnCount equals: 4