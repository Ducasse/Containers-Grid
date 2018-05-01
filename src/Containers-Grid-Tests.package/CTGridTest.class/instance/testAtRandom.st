tests-access
testAtRandom
	| anInt |
	anInt := grid23 atRandom.
	
	self assert: (grid23 includes: anInt) equals: true