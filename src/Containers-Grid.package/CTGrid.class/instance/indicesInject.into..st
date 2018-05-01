old-enumerating
indicesInject: start into: aBlock

	|current|
	current := start.
	1 to: rowCount do: [ :row |
		1 to: columnCount do: [ :column |
			current := aBlock value: current value: row value: column ] ].
	^ current