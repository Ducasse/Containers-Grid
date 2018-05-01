row/column operations
transposed
	[rowCount = columnCount] assert.
	^ self indicesCollect: [ :row :column | self atRow: column atColumn: row ]