old-enumerating
indicesCollect: aBlock
	"for each case of the grid, replace the value of the case by the block result at this indice"
	| r i |
	r := Array new: rowCount * columnCount.
	i := 0.
	1 to: rowCount do: [ :row | 1 to: columnCount do: [ :column | r at: (i := i + 1) put: (aBlock value: row value: column) ] ].
	^ self class rows: rowCount columns: columnCount contents: r