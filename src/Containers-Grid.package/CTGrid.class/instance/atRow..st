row/column operations
atRow: rowNumber
	(rowNumber between: 1 and: rowCount)
		ifFalse: [self error: '1st subscript out of range'].
	^ contents 
			copyFrom: (rowNumber - 1) * columnCount + 1 
			to: rowNumber*columnCount