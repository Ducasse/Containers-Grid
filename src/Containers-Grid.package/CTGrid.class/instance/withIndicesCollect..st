old-enumerating
withIndicesCollect: aBlock
	
	|i r|
	i := 0.
	r := contents shallowCopy.
	1 to: rowCount do: [ :row |
		1 to: columnCount do: [ :column |
			i := i+1.
			r at: i put: (aBlock value: (r at: i) value: row value: column)]].
	^ self class rows: rowCount columns: columnCount contents: r
