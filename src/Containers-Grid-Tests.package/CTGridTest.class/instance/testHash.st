tests-comparing
testHash
	| ord |
	ord := OrderedCollection new.
	self grid22 hash.
	ord := self grid22 contents.
	self assert: (ord includes: 1) equals: true.
	self assert: (ord includes: 2) equals: true.
	self assert: (ord includes: 3) equals: true.
	self assert: (ord includes: 4) equals: true