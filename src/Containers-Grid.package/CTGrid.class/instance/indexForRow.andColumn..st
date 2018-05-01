private
indexForRow: row andColumn: column
	(row between: 1 and: rowCount)
		ifFalse: [self error: '1st subscript out of range'].
	(column between: 1 and: columnCount)
		ifFalse: [self error: '2nd subscript out of range'].
	^(row-1) * columnCount + column