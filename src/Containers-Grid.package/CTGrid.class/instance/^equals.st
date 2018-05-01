comparing
= aGrid
	^ aGrid class == self class
		and: [ aGrid rowNumber = rowCount
				and: [ aGrid columnCount = columnCount 
					and: [ aGrid privateContents = contents ] ] ]