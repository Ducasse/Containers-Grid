row/column operations
swapColumn: anIndex withColumn: anotherIndex
	|a b|
	a := self indexForRow: 1 andColumn: anIndex.
	b := self indexForRow: 1 andColumn: anotherIndex.
	rowCount timesRepeat: [
		contents swap: a with: b.
		a := a + columnCount.
		b := b + columnCount].
