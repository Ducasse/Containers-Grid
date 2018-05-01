tests-access
testIndexOfIfAbsent
		self assert: (grid23 indexOf: 12 ifAbsent: [ ^ false ] ) equals: 2 @ 1.
	self assert: (grid23 indexOf: 0 ifAbsent: [ ^ false ] ) equals: false