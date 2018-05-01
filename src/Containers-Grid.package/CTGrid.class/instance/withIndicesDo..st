enumerating
withIndicesDo: aThreeArgumentBlock
	"Iterate over the grid and execute a block taking the element and its location row and column as arguments."
	
	| i |
	i := 0.
	1 to: rowCount do: [:row |
		1 to: columnCount do: [:column |
			aThreeArgumentBlock value: (contents at: (i := i+1)) value: row value: column]].
