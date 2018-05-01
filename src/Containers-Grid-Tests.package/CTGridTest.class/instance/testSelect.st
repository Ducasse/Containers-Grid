tests - iterating
testSelect
	| ord | 
	ord := self grid22 select: [ :each | each even ].
	 "(
1 3
2 4
 )"
	self assert: ord size equals: 2.
	self assert: ord first equals: 2.
	self assert: ord second equals: 4.
