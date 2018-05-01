accessing - rows
rows
	"Returns the list of items grouped by rows."
	
	| rows | 
	rows := Array new: rowCount.
	1 to: rowCount do:  
			[ :rowNumber | 
					rows 
						at: rowNumber 
						put: (contents copyFrom: 1 + ((rowNumber-1) * columnCount) to: columnCount * rowNumber )].
	^ rows
	