tests-old-enumerating
testIndicesCollect
	| newGrid |
	newGrid := self grid22 indicesCollect: [ :x :y | x == y ].
	"(
1 3
2 4
 )"
	self assert: (newGrid atRow: 1 atColumn: 1) equals: true.
	self assert: (newGrid atRow: 1 atColumn: 2) equals: false.
	self assert: (newGrid atRow: 2 atColumn: 1) equals: false.
	self assert: (newGrid atRow: 2 atColumn: 2) equals: true