enumerating
collect: aBlock
	"Answer a new grid with transformed elements; transformations should be independent."
	
	^ self class 
		rows: rowCount 
		columns: columnCount 
		contents: (contents collect: aBlock)