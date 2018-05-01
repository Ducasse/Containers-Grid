printing
printOn: aStream

	aStream nextPutAll: '('.
	aStream cr.
	(1 to: self rowNumber) 
		do: [ :r | 
				(self atRow: r) 
					do: [ :each | aStream nextPutAll: each printString ] 
					separatedBy: [ aStream space ].
					 aStream cr 
					].
	aStream nextPutAll: ' )'.