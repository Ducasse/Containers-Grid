tests - copying
testCopy
	| copy |
	grid62 atRow: 1 atColumn: 6 put: 666.
	copy := grid62 copy.
	self assert:  grid62 equals: copy.
	self assert: (copy  atRow: 1 atColumn: 6) equals: 666