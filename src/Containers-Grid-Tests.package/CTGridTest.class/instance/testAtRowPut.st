tests-row/column operations
testAtRowPut
		grid23 atRow: 2 put: #(0 0).
	1 to: grid23 columnCount do: [ :x | self assert: (grid23 atRow: 2 atColumn: x) equals: 0 ]