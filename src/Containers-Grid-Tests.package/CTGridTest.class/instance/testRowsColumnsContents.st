tests-private
testRowsColumnsContents
	grid23 rows: 3 columns: 3 contents: #(1 1 1 1 1 1 1 1 1).
	
	self assert: grid23 columnCount equals: 3.
	self assert: grid23 rowNumber equals: 3.
	1 to: grid23 columnCount do: [ :x | 1 to: grid23 rowNumber do: [ :y | self assert: (grid23 atRow: y atColumn: x ) equals: 1 ] ]