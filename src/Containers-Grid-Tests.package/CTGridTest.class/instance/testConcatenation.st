tests - instance creation
testConcatenation
	| newGrid aGrid |
	aGrid := self gridClass rows: 3 columns: 3.
	aGrid atAllPut: 0.
	newGrid := grid23 , aGrid.
	1 to: grid23 rowNumber do: [ :y | 1 to: grid23 columnCount do: [ :x | self assert: (newGrid atRow: y atColumn: x) equals: (grid23 atRow: y atColumn: x) ] ].
	1 to: aGrid rowNumber do:
		[ :y | grid23 columnCount + 1 to: aGrid columnCount + grid23 columnCount do: [ :x | self assert: (newGrid atRow: y atColumn: x) equals: (aGrid atRow: y atColumn: (x - grid23 columnCount)) ] ]