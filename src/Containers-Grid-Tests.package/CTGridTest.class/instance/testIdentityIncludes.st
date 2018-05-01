tests-testing
testIdentityIncludes
	| anInt |
	anInt := grid23 atRow: 2 atColumn: 2.
	
	self assert: (grid23 identityIncludes: anInt) equals: true 