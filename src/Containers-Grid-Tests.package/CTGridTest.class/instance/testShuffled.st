tests-copying
testShuffled
		| gri |
	gri := self gridClass new.
	gri := self grid22 shuffled.

	self assert: (gri includes: 1) equals: true.
	self assert: (gri  includes: 2) equals: true.
	self assert: (gri includes: 3) equals: true.
	self assert: (gri includes: 4) equals: true