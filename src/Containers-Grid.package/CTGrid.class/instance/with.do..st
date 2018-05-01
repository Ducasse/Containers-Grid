old-enumerating
with: aGrid do: aBlock
	"aGrid must support #atRow:atColumn:  and be at least as large as the receiver."
	
	self withIndicesDo: [:each :row :column |
		aBlock value: each value: (aGrid atRow: row atColumn: column)].
