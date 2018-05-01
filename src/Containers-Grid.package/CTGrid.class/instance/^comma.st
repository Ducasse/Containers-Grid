copying
, aGrid
	"Answer a new grid having the same number of rows as the receiver and aGrid,
	 its columns being the columns of the receiver followed by the columns of aGrid."

	| newCont newCols anArray oldCols a b c |
	[ rowCount = aGrid rowNumber ] assert.
	newCont := Array new: self size + aGrid size.
	anArray := aGrid privateContents.
	oldCols := aGrid columnCount.
	newCols := columnCount + oldCols.
	a := b := c := 1.
	1 to: rowCount do:
		[ :r | 
		newCont
			replaceFrom: a
			to: a + columnCount - 1
			with: contents
			startingAt: b.
		newCont
			replaceFrom: a + columnCount
			to: a + newCols - 1
			with: anArray
			startingAt: c.
		a := a + newCols.
		b := b + columnCount.
		c := c + oldCols ].
	^ self class rows: rowCount columns: newCols contents: newCont