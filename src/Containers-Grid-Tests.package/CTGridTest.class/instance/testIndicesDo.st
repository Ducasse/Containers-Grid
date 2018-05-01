tests - iterating
testIndicesDo
	| ord |
	ord := OrderedCollection new. 
	self grid22 indicesDo: [ :row :column | ord add: (row raisedTo: column) ].
	 "(
1 3
2 4
 )"
	self assert: ord first equals: 1.
	self assert: ord second equals: 1.
	self assert: ord third equals: 2.
	self assert: ord fourth equals: 4.