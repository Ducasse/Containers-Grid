row/column operations
atColumn: column
	| p |
	p := (self indexForRow: 1 andColumn: column) - columnCount.
	^ (1 to: rowCount) 
		collect: [ :row | contents at: (p := p + columnCount) ]