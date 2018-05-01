tests-row/column operations
testAtColumnPut
	grid23 atColumn: 2 put: #(0 0 0).
	1 to: grid23 rowNumber do: [ :x | self assert: (grid23 atRow: x atColumn: 2) equals: 0 ]