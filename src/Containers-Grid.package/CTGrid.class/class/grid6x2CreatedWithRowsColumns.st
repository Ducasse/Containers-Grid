example instances
grid6x2CreatedWithRowsColumns
	<sampleInstance>
	"self grid6x2CreatedWithRowsColumns"
	| grid62 |
	grid62 := self rows: 2 columns: 6.
	
	grid62 atRow: 1 atColumn: 1 put: 11.
	grid62 atRow: 1 atColumn: 2 put: 21.
	grid62 atRow: 1 atColumn: 3 put: 31.
	grid62 atRow: 1 atColumn: 4 put: 41.
	grid62 atRow: 1 atColumn: 5 put: 51.
	grid62 atRow: 1 atColumn: 6 put: 61.
	
	grid62 atRow: 2 atColumn: 1 put: 12.
	grid62 atRow: 2 atColumn: 2 put: 22.
	grid62 atRow: 2 atColumn: 3 put: 32.
	grid62 atRow: 2 atColumn: 4 put: 42.
	grid62 atRow: 2 atColumn: 5 put: 52.
	grid62 atRow: 2 atColumn: 6 put: 62.
	
	^ grid62