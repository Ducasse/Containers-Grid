tests-access
testAnyOne
	| anInt |
	anInt := grid23 anyOne.
	
	self assert: (grid23 includes: anInt) equals: true