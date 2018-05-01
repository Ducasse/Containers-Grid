enumerating
indicesDo: aTwoArgumentBlock
	"Iterate over the grid and execute a block taking row and column as arguments."
	
	1 to: rowCount do: [ :row |
		1 to: columnCount do: [ :column |
			aTwoArgumentBlock value: row value: column]].