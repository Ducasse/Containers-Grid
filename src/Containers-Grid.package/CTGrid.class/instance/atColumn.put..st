row/column operations
atColumn: column put: aCollection
	| p |
	aCollection size = rowCount ifFalse: [ self error: 'wrong column size' ].
	p := (self indexForRow: 1 andColumn: column) - columnCount.
	aCollection do: [ :each | contents at: (p := p + columnCount) put: each ].
	^ aCollection
