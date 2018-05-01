tests-enumerating
testRowsDo
	| ord |
	ord := OrderedCollection new.
	self grid22 rowsDo: [ :y | ord add: y ].
	self assert: ord first equals: #(1 3).
	self assert: ord second equals: #(2 4)