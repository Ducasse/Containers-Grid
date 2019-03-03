"
I represent  a two-dimensional grid. I provide methods for creating grids, operating on them. A grid origin is the left topmost corner, hence subsequent lines are located ""below"".

!! Examples 
Here is a typical grid: 6 columns, 2 rows, growing down.
[[[ 
 CTGrid grid6x2CreatedWithRowsColumns printString
>>> '(
11 21 31 41 51 61
12 22 32 42 52 62
 )'
]]]

[[[
CTGrid  grid3x2BooksCreatedWithRows  printString 
>>>
'(
''A Time to Kill'' ''John Grisham'' 1989
''Blood and Smoke'' ''Stephen King'' 2010
''Spin'' ''Robert Charles Wilson'' 2006
 )'
]]]

!! Structure:
The implementation of this grid is not optimised for lines manipulation in the sense that it uses an array where lines are placed one after the other. 

 - rowCount : a non-negative integer saying how many rows there are.
 - columnCount : a non-negative integer saying how many columns there are.
 - contents : an Array holding the elements in row-major order.  That is, for a 2x3 array the contents are (11 12 13 21 22 23).  


!! Todo:
	- should write tests for all the methods.
	- ordering lines based on sorted order of one element (should have a look at the shorting collection extension)
	- iterations on all elements starting from topleft
	- may be we should not inherit from Collection.
	- columnsDo:

		

"
Class {
	#name : #CTGrid,
	#superclass : #Object,
	#instVars : [
		'contents',
		'rowCount',
		'columnCount'
	],
	#category : 'Containers-Grid'
}

{ #category : #'new instance creation' }
CTGrid class >> columns: columnNumber rows: rowNumber [ 
	"Create a grid of rowNUmber rows and columnNumber columns."
	^ self 
		rows: rowNumber 
		columns: columnNumber 
		contents: (Array new: rowNumber*columnNumber)
]

{ #category : #'example instances' }
CTGrid class >> grid22 [
	<sampleInstance>
	"self grid22"
	| grid1 |
	grid1 := self new: 2.
	grid1 atRow: 1 atColumn: 1 put: 1.
	grid1 atRow: 1 atColumn: 2 put: 3.
	grid1 atRow: 2 atColumn: 1 put: 2.
	grid1 atRow: 2 atColumn: 2 put: 4.
	^ grid1 
]

{ #category : #'example instances' }
CTGrid class >> grid22WithPointLocationCreatedWithRows [
	<sampleInstance>
	"self grid22WithPointLocationCreatedWithRows"
	"> 
	((1@1) (2@1)
	(1@2) (2@2) )
	"
	| grid |
	grid := self withRows: 
		{  { 1@1 . 2@1 } . 
			{ 1@2 . 2@2 }
		   }.
	^ grid 
]

{ #category : #'example instances' }
CTGrid class >> grid3x2BooksCreatedWithRows [
	<sampleInstance>
	"self grid3x2BooksCreatedWithRows 
	
(
'A Time to Kill' 'John Grisham' 1989
'Blood and Smoke' 'Stephen King' 2010
'Spin' 'Robert Charles Wilson' 2006
 )"
	^ self withRows: 
			#( #('A Time to Kill' 'John Grisham' 1989) 
				#('Blood and Smoke' 'Stephen King' 2010) 
				#('Spin' 'Robert Charles Wilson' 2006)).
]

{ #category : #'example instances' }
CTGrid class >> grid6x2CreatedWithRowsColumns [
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
]

{ #category : #'new instance creation' }
CTGrid class >> new: dimension [
	"Answer a dimension*dimension grid."
	
	^ self rows: dimension columns: dimension
]

{ #category : #'new instance creation' }
CTGrid class >> new: dimemsion element: element [
	"Answer a dimemsion*dimemsion grid with all elements set to element."

	^ self rows: dimemsion columns: dimemsion element: element
]

{ #category : #'instance creation' }
CTGrid class >> new: dimension tabulate: aTwoArgumentBlock [
	"Answer a dimension*dimension grid where it at: i at: j is aBlock value: i value: j."
	^ self rows: dimension columns: dimension tabulate: aTwoArgumentBlock
]

{ #category : #'new instance creation' }
CTGrid class >> rows: rowNumber columns: columnNumber [
	"Create a grid of rowNUmber rows and columnNumber columns."
	^ self 
		rows: rowNumber 
		columns: columnNumber 
		contents: (Array new: rowNumber*columnNumber)
]

{ #category : #private }
CTGrid class >> rows: rowNumber columns: columnNumber contents: contents [
	"Private! Creates a grid of the given size with an adequate contents."
	^ self new rows: rowNumber columns: columnNumber contents: contents
]

{ #category : #'instance creation' }
CTGrid class >> rows: rowNumber columns: columnNumber element: element [
	"Create a grid of rowNUmber rows and columnNumber columns filled with element."
	^ self 
		rows: rowNumber 
		columns: columnNumber
		contents: ((Array new: rowNumber * columnNumber) atAllPut: element; yourself)
]

{ #category : #'instance creation' }
CTGrid class >> rows: rowNumber columns: columnNumber tabulate: aTwoArgumentBlock [
	"Answer a new grid of the given dimensions where result of element at row: i column j is given by aTwoArgumentBlock value: i value: j"
	|a i|
	a := Array new: rowNumber*columnNumber.
	i := 0.
	1 to: rowNumber do: [:row |
		1 to: columnNumber do: [:column |
			a at: (i := i + 1) put: (aTwoArgumentBlock value: row value: column)]].
	^ self rows: rowNumber columns: columnNumber contents: a

]

{ #category : #'instance creation' }
CTGrid class >> withColumns: anArrayOfColumns [
	"self withColumns: #( #('A Time to Kill' 'Blood and Smoke') ('John Grisham' 'Stephen King') ( '100' '1000') )"
	
	| numberOfRows numberOfColumns |
	numberOfColumns := anArrayOfColumns size.
	numberOfRows := anArrayOfColumns first size.
	^ self new rows: numberOfRows columns: numberOfColumns contents: (anArrayOfColumns flatCollect: #yourself).

]

{ #category : #'new instance creation' }
CTGrid class >> withRows: anArrayOfRows [
	"Create a grid based on an array of rows, where the rows have the same size, the first rows in on the op and other rows are going down."
	
	"self withRows: 
			#( #('A Time to Kill' 'John Grisham' 1989) 
			#('Blood and Smoke' 'Stephen King' 2010) 
			#('Spin' 'Robert Charles Wilson' 2006))."
	
	^ self new rows: anArrayOfRows size columns: anArrayOfRows first size contents: (anArrayOfRows flatCollect: #yourself).

]

{ #category : #copying }
CTGrid >> , aGrid [
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
]

{ #category : #comparing }
CTGrid >> = aGrid [
	^ aGrid class == self class
		and: [ aGrid rowNumber = rowCount
				and: [ aGrid columnCount = columnCount 
					and: [ aGrid privateContents = contents ] ] ]
]

{ #category : #access }
CTGrid >> anyOne [
	"Return one element from the receiver"
	^ contents anyOne
]

{ #category : #'accessing element' }
CTGrid >> atAllPut: value [
	"Put value as value of all the receiver elements."
	contents atAllPut: value
]

{ #category : #'row/column operations' }
CTGrid >> atColumn: column [
	| p |
	p := (self indexForRow: 1 andColumn: column) - columnCount.
	^ (1 to: rowCount) 
		collect: [ :row | contents at: (p := p + columnCount) ]
]

{ #category : #'row/column operations' }
CTGrid >> atColumn: column put: aCollection [
	| p |
	aCollection size = rowCount ifFalse: [ self error: 'wrong column size' ].
	p := (self indexForRow: 1 andColumn: column) - columnCount.
	aCollection do: [ :each | contents at: (p := p + columnCount) put: each ].
	^ aCollection

]

{ #category : #access }
CTGrid >> atRandom [
	"Return the contents of the receiver in a random order."
	^ contents atRandom

]

{ #category : #access }
CTGrid >> atRandom: aGenerator [
	"Return the contents of the receiver in a random order using the argument. aGenerator should be kept by the user in a variable and used every time. Use this instead of #atRandom for better uniformity of random numbers because only you use the generator."
	
	^ contents atRandom: aGenerator
]

{ #category : #'row/column operations' }
CTGrid >> atRow: rowNumber [
	(rowNumber between: 1 and: rowCount)
		ifFalse: [self error: '1st subscript out of range'].
	^ contents 
			copyFrom: (rowNumber - 1) * columnCount + 1 
			to: rowNumber*columnCount
]

{ #category : #'accessing element' }
CTGrid >> atRow: rowNumber atColumn: columnNumber [
	^ contents at: (self indexForRow: rowNumber andColumn: columnNumber)
]

{ #category : #'accessing element' }
CTGrid >> atRow: rowNumber atColumn: columnNumber put: value [
	"Put value at rowNumber,columnNumber"
	^ contents at: (self indexForRow: rowNumber andColumn: columnNumber) put: value
]

{ #category : #'row/column operations' }
CTGrid >> atRow: row put: aCollection [
	|p|

	aCollection size = columnCount ifFalse: [self error: 'wrong row size'].
	p := (self indexForRow: row andColumn: 1)-1.
	aCollection do: [:each | contents at: (p := p+1) put: each].
	^aCollection
]

{ #category : #'accessing subgrids' }
CTGrid >> atRows: rs columns: cs [
	"Answer a grid obtained by slicing the receiver. rs and cs should be sequenceable collections."

	^self class rows: rs size columns: cs size tabulate: [:r :c |
		self atRow: (rs at: r) atColumn: (cs at: c)]
]

{ #category : #'accessing subgrids' }
CTGrid >> atRows: r1 to: r2 columns: c1 to: c2 [
	"Answer a submatrix [r1..r2][c1..c2] of the receiver."
	|rd cd|

	rd := r1 - 1.
	cd := c1 - 1.
	^self class rows: r2-rd columns: c2-cd tabulate: [:r :c| self atRow: r+rd atColumn: c+cd]

]

{ #category : #'accessing subgrids' }
CTGrid >> atRows: r1 to: r2 columns: c1 to: c2 put: aMatrix [
	"Set the [r1..r2][c1..c2] submatrix of the receiver
	 from the [1..r2-r1+1][1..c2-c1+1] submatrix of aMatrix.
	 As long as aMatrix responds to at:at: and accepts arguments in the range shown,
	 we don't care if it is bigger or even if it is a Matrix at all."
	|rd cd|

	rd := r1 - 1.
	cd := c1 - 1.
	r1 to: r2 do: [:r |
		c1 to: c2 do: [:c |
			self atRow: r atColumn: c put: (aMatrix atRow: r-rd atColumn: c-cd)]].
	^aMatrix

]

{ #category : #enumerating }
CTGrid >> collect: aBlock [
	"Answer a new grid with transformed elements; transformations should be independent."
	
	^ self class 
		rows: rowCount 
		columns: columnCount 
		contents: (contents collect: aBlock)
]

{ #category : #'accessing - setters/getters' }
CTGrid >> columnCount [
	^ columnCount
]

{ #category : #'accessing - setters/getters' }
CTGrid >> columnCount: anObject [
	columnCount := anObject
]

{ #category : #'accessing - setters/getters' }
CTGrid >> contents [
	"Usually you may not want to get the raw internal data structure. But if you need it, contents returns the internal array used to represent the grid"
	^ contents
]

{ #category : #enumerating }
CTGrid >> do: aBlock [
	"Pass elements to aBlock one at a time in row-major order."
	contents do: aBlock
]

{ #category : #access }
CTGrid >> extent [
    "Answer the receiver's dimensions (x, y) or (columns, rows) as point."

    ^ self columnCount @ self rowNumber
]

{ #category : #comparing }
CTGrid >> hash [

	^ contents hash
]

{ #category : #testing }
CTGrid >> identityIncludes: anObject [
	^ contents identityIncludes: anObject
]

{ #category : #access }
CTGrid >> identityIndexOf: anElement [
	
	^ self identityIndexOf: anElement ifAbsent: [ 0@0 ]

]

{ #category : #access }
CTGrid >> identityIndexOf: anElement ifAbsent: anExceptionBlock [
	^self rowAndColumnForIndex:
		 (contents identityIndexOf: anElement ifAbsent: [^anExceptionBlock value])

]

{ #category : #testing }
CTGrid >> includes: anObject [
	^ contents includes: anObject
]

{ #category : #testing }
CTGrid >> includesAll: aCollection [
	^ contents includesAll: aCollection
]

{ #category : #testing }
CTGrid >> includesAny: aCollection [
	^ contents includesAny: aCollection
]

{ #category : #private }
CTGrid >> indexForRow: row andColumn: column [
	(row between: 1 and: rowCount)
		ifFalse: [self error: '1st subscript out of range'].
	(column between: 1 and: columnCount)
		ifFalse: [self error: '2nd subscript out of range'].
	^(row-1) * columnCount + column
]

{ #category : #access }
CTGrid >> indexOf: anElement [
	"If there are integers r, c such that (self at: r at: c) = anElement, answer some such r@c, otherwise answer 0@0. The order in which the receiver are searched is UNSPECIFIED except that it is the same as the order used by #indexOf:ifAbsent: and #readStream."

	^self indexOf: anElement ifAbsent: [0@0]

]

{ #category : #access }
CTGrid >> indexOf: anElement ifAbsent: anExceptionBlock [
	"If there are integers r, c such that (self at: r at: c) = anElement, answer some such r@c, otherwise answer the result of anExceptionBlock."

	^self rowAndColumnForIndex:
		 (contents indexOf: anElement ifAbsent: [^ anExceptionBlock value])

]

{ #category : #'old-enumerating' }
CTGrid >> indicesCollect: aBlock [
	"for each case of the grid, replace the value of the case by the block result at this indice"
	| r i |
	r := Array new: rowCount * columnCount.
	i := 0.
	1 to: rowCount do: [ :row | 1 to: columnCount do: [ :column | r at: (i := i + 1) put: (aBlock value: row value: column) ] ].
	^ self class rows: rowCount columns: columnCount contents: r
]

{ #category : #enumerating }
CTGrid >> indicesDo: aTwoArgumentBlock [
	"Iterate over the grid and execute a block taking row and column as arguments."
	
	1 to: rowCount do: [ :row |
		1 to: columnCount do: [ :column |
			aTwoArgumentBlock value: row value: column]].
]

{ #category : #'old-enumerating' }
CTGrid >> indicesInject: start into: aBlock [

	|current|
	current := start.
	1 to: rowCount do: [ :row |
		1 to: columnCount do: [ :column |
			current := aBlock value: current value: row value: column ] ].
	^ current
]

{ #category : #testing }
CTGrid >> occurrencesOf: anObject [
	^ contents occurrencesOf: anObject
]

{ #category : #copying }
CTGrid >> postCopy [
	super postCopy.
	contents := contents copy
]

{ #category : #printing }
CTGrid >> printOn: aStream [

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
]

{ #category : #private }
CTGrid >> privateContents [
	"Only used in #, #,, and #= so far.
	 It used to be called #contents, but that clashes with Collection>>contents."

	^ contents
]

{ #category : #modifying }
CTGrid >> replaceAll: oldObject with: newObject [
	"Replace all occurrences of oldObject with newObject in the receiver."
	contents replaceAll: oldObject with: newObject
]

{ #category : #private }
CTGrid >> rowAndColumnForIndex: index [
	|t|
	t := index - 1.
	^(t // columnCount + 1)@(t \\ columnCount + 1)
]

{ #category : #access }
CTGrid >> rowCount [
	^rowCount
]

{ #category : #'accessing - setters/getters' }
CTGrid >> rowNUmber: anObject [
	rowCount := anObject
]

{ #category : #'accessing - setters/getters' }
CTGrid >> rowNumber [
	^ rowCount
]

{ #category : #'accessing - rows' }
CTGrid >> rows [
	"Returns the list of items grouped by rows."
	
	| rows | 
	rows := Array new: rowCount.
	1 to: rowCount do:  
			[ :rowNumber | 
					rows 
						at: rowNumber 
						put: (contents copyFrom: 1 + ((rowNumber-1) * columnCount) to: columnCount * rowNumber )].
	^ rows
	
]

{ #category : #private }
CTGrid >> rows: rows columns: columns contents: anArray [
	[rows isInteger and: [rows >= 0]] assert.
	[columns isInteger and: [columns >= 0]] assert.
	[rows * columns = anArray size] assert.

	rowCount := rows.
	columnCount := columns.
	contents := anArray.
	^self
]

{ #category : #enumerating }
CTGrid >> rowsDo: aBlock [

	self rows do: [ :aRow | aBlock value: aRow ]
]

{ #category : #enumerating }
CTGrid >> select: aBlock [
	"Pass elements to aBlock one at a time in row-major order."
	^ contents select: aBlock
]

{ #category : #copying }
CTGrid >> shuffled [
	^ self class rows: rowCount columns: columnCount contents: (contents shuffled)
]

{ #category : #modifying }
CTGrid >> shuffledBy: aGenerator [
	"aGenerator should be kept by the user in a variable and used every time. Use this instead of #atRandom for better uniformity of random numbers because only you use the generator."
	^ self class rows: rowCount columns: columnCount contents: (contents copy shuffleBy: aGenerator)
]

{ #category : #access }
CTGrid >> size [
	^ contents size
]

{ #category : #printing }
CTGrid >> storeOn: aStream [
	aStream
		nextPut: $(;
		nextPutAll: self class name;
		nextPutAll: ' rows: ';
		store: rowCount;
		nextPutAll: ' columns: ';
		store: columnCount;
		nextPutAll: ' contents: ';
		store: contents;
		nextPut: $).
		

]

{ #category : #modifying }
CTGrid >> swapAtPoint: p1 withPoint: p2 [
	"Swap the contents of p1 (x1,y1) with the contents of p2 (x2,y2)"
	
	self swapAtRow: p1 y atColumn: p1 x  withAtRow: p2 y atColumn: p2 x 
]

{ #category : #modifying }
CTGrid >> swapAtRow: r1 atColumn: c1 withAtRow: r2 atColumn: c2 [
	"Swap the contents of element at row r1 and column c1 with the contents of element at row r2 and column c2."
	
	contents 
		swap: (self indexForRow: r1 andColumn: c1)
		with: (self indexForRow: r2 andColumn: c2)
]

{ #category : #'row/column operations' }
CTGrid >> swapColumn: anIndex withColumn: anotherIndex [
	|a b|
	a := self indexForRow: 1 andColumn: anIndex.
	b := self indexForRow: 1 andColumn: anotherIndex.
	rowCount timesRepeat: [
		contents swap: a with: b.
		a := a + columnCount.
		b := b + columnCount].

]

{ #category : #'row/column operations' }
CTGrid >> swapRow: anIndex withRow: anotherIndex [
	| a b |
	a := self indexForRow: anIndex andColumn: 1.
	b := self indexForRow: anotherIndex andColumn: 1.
	columnCount timesRepeat: [
		contents swap: a with: b.
		a := a + 1.
		b := b + 1].

]

{ #category : #'row/column operations' }
CTGrid >> transposed [
	[rowCount = columnCount] assert.
	^ self indicesCollect: [ :row :column | self atRow: column atColumn: row ]
]

{ #category : #'old-enumerating' }
CTGrid >> with: aGrid collect: aBlock [
	"aCollection must support #atRow:atColumn: and be at least as large as the receiver."

	^self withIndicesCollect: [:each :row :column |
		aBlock value: each value: (aGrid atRow: row atColumn: column)]

]

{ #category : #'old-enumerating' }
CTGrid >> with: aGrid do: aBlock [
	"aGrid must support #atRow:atColumn:  and be at least as large as the receiver."
	
	self withIndicesDo: [:each :row :column |
		aBlock value: each value: (aGrid atRow: row atColumn: column)].

]

{ #category : #'old-enumerating' }
CTGrid >> with: aCollection inject: startingValue into: aBlock [
	"aCollection must support #at:at: and be at least as large as the receiver."

	^ self withIndicesInject: startingValue into: [:value :each :row :column |
			aBlock value: value value: each value: (aCollection atRow: row atColumn: column)]
]

{ #category : #'old-enumerating' }
CTGrid >> withIndicesCollect: aBlock [
	
	|i r|
	i := 0.
	r := contents shallowCopy.
	1 to: rowCount do: [ :row |
		1 to: columnCount do: [ :column |
			i := i+1.
			r at: i put: (aBlock value: (r at: i) value: row value: column)]].
	^ self class rows: rowCount columns: columnCount contents: r

]

{ #category : #enumerating }
CTGrid >> withIndicesDo: aThreeArgumentBlock [
	"Iterate over the grid and execute a block taking the element and its location row and column as arguments."
	
	| i |
	i := 0.
	1 to: rowCount do: [:row |
		1 to: columnCount do: [:column |
			aThreeArgumentBlock value: (contents at: (i := i+1)) value: row value: column]].

]

{ #category : #'old-enumerating' }
CTGrid >> withIndicesInject: start into: aBlock [
	
	| i current |
	i := 0.
	current := start.
	1 to: rowCount do: [ :row |
		1 to: columnCount do: [ :column |
			current := aBlock 
								value: current 
								value: (contents at: (i := i+1)) 
								value: row value: column ] ].
	^ current
]
