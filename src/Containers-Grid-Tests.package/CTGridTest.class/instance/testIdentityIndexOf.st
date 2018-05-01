tests-access
testIdentityIndexOf
	| anInt1 anInt2 |
	anInt1 := grid23 atRow: 2 atColumn: 2.
	anInt2 := 123.
	self assert: (grid23 identityIndexOf: anInt1) equals: 2 @ 2.
	self assert: (grid23 identityIndexOf: anInt2) equals: 0@0