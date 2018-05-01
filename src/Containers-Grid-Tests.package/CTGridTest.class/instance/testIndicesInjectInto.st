tests-old-enumerating
testIndicesInjectInto
	| newGrid aBool |
	newGrid := self gridClass new: 2.
	newGrid atAllPut: 0.
	aBool := newGrid indicesInject: 1 into: [ :each :x :y | (newGrid atRow: x atColumn: y) == each ].

	self assert: aBool equals: false 