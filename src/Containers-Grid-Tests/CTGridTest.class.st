"
A simple test class.
"
Class {
	#name : #CTGridTest,
	#superclass : #TestCase,
	#instVars : [
		'grid1',
		'grid2',
		'grid3',
		'grid23',
		'grid62',
		'grid22WithPointLocationCreatedWithRows',
		'grid3x2FilmsCreatedWithRows',
		'grid3x2BooksCreatedWithRows'
	],
	#category : #'Containers-Grid-Tests'
}

{ #category : #'local setup' }
CTGridTest >> grid22 [
	"self new grid22"
	grid1 := self gridClass new: 2.
	grid1 atRow: 1 atColumn: 1 put: 1.
	grid1 atRow: 1 atColumn: 2 put: 3.
	grid1 atRow: 2 atColumn: 1 put: 2.
	grid1 atRow: 2 atColumn: 2 put: 4.
	^ grid1 
]

{ #category : #'local setup' }
CTGridTest >> grid228 [
	grid2 := self gridClass new: 2.
	grid2 atRow: 1 atColumn: 1 put: 3.
	grid2 atRow: 1 atColumn: 2 put: 7.
	grid2 atRow: 2 atColumn: 1 put: 4.
	grid2 atRow: 2 atColumn: 2 put: 8
]

{ #category : #setup }
CTGridTest >> grid22WithPointLocationCreatedWithRows [

	grid22WithPointLocationCreatedWithRows := CTGrid grid22WithPointLocationCreatedWithRows
]

{ #category : #'local setup' }
CTGridTest >> grid2x3 [
	grid23 := self gridClass rows: 3 columns: 2.
	grid23 atRow: 1 atColumn: 1 put: 11.
	grid23 atRow: 1 atColumn: 2 put: 21.
	grid23 atRow: 2 atColumn: 1 put: 12.
	grid23 atRow: 2 atColumn: 2 put: 22.
	grid23 atRow: 3 atColumn: 1 put: 13.
	grid23 atRow: 3 atColumn: 2 put: 23
]

{ #category : #setup }
CTGridTest >> grid3x2BooksCreatedWithRows [

	grid3x2BooksCreatedWithRows := CTGrid grid3x2BooksCreatedWithRows
]

{ #category : #setup }
CTGridTest >> grid6x2 [

	grid62 := CTGrid grid6x2CreatedWithRowsColumns
]

{ #category : #setup }
CTGridTest >> gridClass [

	^ CTGrid
]

{ #category : #setup }
CTGridTest >> setUp [
	self grid22.
	self grid228.
	self grid2x3.

	"new setup creation"
	self grid6x2.
	self grid22WithPointLocationCreatedWithRows.
	self grid3x2BooksCreatedWithRows
]

{ #category : #'tests - instance creation' }
CTGridTest >> testAnotherCreationWithRows [

	self assert: (grid3x2BooksCreatedWithRows atRow: 1 atColumn: 1) equals: 'A Time to Kill'.
	self assert: (grid3x2BooksCreatedWithRows atRow: 2 atColumn: 2) equals: 'Stephen King'.
	self assert: (grid3x2BooksCreatedWithRows atRow: 1 atColumn: 2) equals: 'John Grisham'.
	self assert: (grid3x2BooksCreatedWithRows atRow: 2 atColumn: 1) equals: 'Blood and Smoke'.
	
]

{ #category : #'tests-access' }
CTGridTest >> testAnyOne [

	| anInt |
	anInt := grid23 anyOne.	
	self assert: (grid23 includes: anInt)
]

{ #category : #'torevisit- tests - accessing' }
CTGridTest >> testAtAllPut [

	| m |
	m := self gridClass new: 3.
	m do: [ :each | self assert: each equals: nil ].
	m atAllPut: 1.
	m do: [ :each | self assert: each equals: 1 ]
]

{ #category : #'torevisit- tests - accessing' }
CTGridTest >> testAtAt [

	self should:[grid1 atRow: 2 atColumn: 3] raise: Error.
	self should:[grid1 atRow: 3 atColumn: 2] raise: Error.
	self should:[grid1 atRow: 3 atColumn: 3] raise: Error.
	self should:[grid1 atRow: 0 atColumn: 1] raise: Error.
	self should:[grid1 atRow: 1 atColumn: 0] raise: Error.
	self should:[grid1 atRow: 0 atColumn: 0] raise: Error.
	
	self assert: (grid1 atRow: 1 atColumn: 1) equals: 1.
	self assert: (grid23 atRow: 1 atColumn: 1) equals: 11.
	self assert: (grid23 atRow: 1 atColumn: 2) equals: 21.
	self assert: (grid23 atRow: 2 atColumn: 1) equals: 12.
	self assert: (grid23 atRow: 2 atColumn: 2) equals: 22.
	self assert: (grid23 atRow: 3 atColumn: 1) equals: 13.
	self assert: (grid23 atRow: 3 atColumn: 2) equals: 23.
]

{ #category : #'torevisit- tests - accessing' }
CTGridTest >> testAtColumn [

	self assert: (grid23 atColumn: 1) equals: #(11 12 13).
	self assert: (grid23 atColumn: 2) equals: #(21 22 23).
	
]

{ #category : #'tests-row/column operations' }
CTGridTest >> testAtColumnPut [
	grid23 atColumn: 2 put: #(0 0 0).
	1 to: grid23 rowNumber do: [ :x | self assert: (grid23 atRow: x atColumn: 2) equals: 0 ]
]

{ #category : #'tests-access' }
CTGridTest >> testAtRandom [

	| anInt |
	anInt := grid23 atRandom.	
	self assert: (grid23 includes: anInt)
]

{ #category : #'torevisit- tests - accessing' }
CTGridTest >> testAtRow [

	self assert: (grid23 atRow: 1) equals: #(11 21).
	self assert: (grid23 atRow: 2) equals: #(12 22).
	self assert: (grid23 atRow: 3) equals: #(13 23).
]

{ #category : #'tests-accessing element' }
CTGridTest >> testAtRowAtColumn [

	| anInt |
	anInt := grid23 atRow: 2 atColumn: 2.
	self assert: anInt equals: 22 
]

{ #category : #'tests-accessing element' }
CTGridTest >> testAtRowAtColumnPut [

	grid23 atRow: 2 atColumn: 2 put: 0.
	self assert: (grid23 atRow: 2 atColumn: 2) equals: 0
]

{ #category : #'tests-row/column operations' }
CTGridTest >> testAtRowPut [

	grid23 atRow: 2 put: #(0 0).
	1 	
		to: grid23 columnCount 
		do: [ :x | self 
						assert: (grid23 atRow: 2 atColumn: x) 
						equals: 0 ]
]

{ #category : #'tests-accessing subgrids' }
CTGridTest >> testAtRowsColumns [

	| aGrid |
	aGrid := grid23 atRows: #(1 2) columns: #(1).	
	self assert: aGrid columnCount equals: 1.
	self assert: aGrid rowNumber equals: 2.
	self assert: (aGrid atRow: 1 atColumn: 1) equals: 11.
	self assert: (aGrid atRow: 2 atColumn: 1) equals: 12.
	 
]

{ #category : #'tests-accessing subgrids' }
CTGridTest >> testAtRowsToColumnsTo [
	
	| aGrid |
	aGrid := grid23 atRows: 1 to: 2 columns: 1 to: 1.
	self assert: aGrid columnCount equals: 1.
	self assert: aGrid rowNumber equals: 2.
	self assert: (aGrid atRow: 1 atColumn: 1) equals: 11.
	self assert: (aGrid atRow: 2 atColumn: 1) equals: 12
]

{ #category : #'tests-accessing subgrids' }
CTGridTest >> testAtRowsToColumnsToPut [
	| aGrid grid12 |
	grid12 := self gridClass rows: 2 columns: 1.
	grid12 atRow: 1 atColumn: 1 put: 0.
	grid12 atRow: 2 atColumn: 1 put: 1.
	aGrid := grid23
		atRows: 1
		to: 2
		columns: 1
		to: 1
		put: grid12.
	self assert: aGrid columnCount equals: 1.
	self assert: aGrid rowNumber equals: 2.
	self assert: (aGrid atRow: 1 atColumn: 1) equals: 0.
	self assert: (aGrid atRow: 2 atColumn: 1) equals: 1
]

{ #category : #'tests - iterating' }
CTGridTest >> testCollect [
	| newGrid |
	newGrid := self grid22 collect: [ :each | each * each ].
	 "(
1 3
2 4
 )"
	
	self assert: (newGrid atRow: 1 atColumn: 1) equals: 1.
	self assert: (newGrid atRow: 1 atColumn: 2) equals: 9.
	self assert: (newGrid atRow: 2 atColumn: 1) equals: 4.
	self assert: (newGrid atRow: 2 atColumn: 2) equals: 16.

]

{ #category : #'torevisit- tests - accessing' }
CTGridTest >> testCollectCreatesANewGrid [

	| m m2 |
	m := self gridClass new: 3.
	m atAllPut: -1.
	self assert: (m occurrencesOf: -1) equals: 9.
	m2 := m collect: [ :each | each abs ].
	m2 collect: [ :each | self assert: each equals: 1 ].
	self assert: (m2 occurrencesOf: 1) equals: 9
]

{ #category : #'tests - accessing' }
CTGridTest >> testColumnCount [

	self assert: grid62 columnCount equals: 6
]

{ #category : #'tests - instance creation' }
CTGridTest >> testConcatenation [

	| newGrid aGrid |
	aGrid := self gridClass rows: 3 columns: 3.
	aGrid atAllPut: 0.
	newGrid := grid23 , aGrid.
	1 
		to: grid23 rowNumber 
		do: [ :y | 1 
						to: grid23 columnCount 
						do: [ :x | self 
										assert: (newGrid atRow: y atColumn: x) 
										equals: (grid23 atRow: y atColumn: x) ] ].
	1 to: aGrid rowNumber do:
		[ :y | 
		grid23 columnCount + 1 
			to: aGrid columnCount + grid23 columnCount 
			do: [ :x | self 
					assert: (newGrid atRow: y atColumn: x) 
					equals: (aGrid atRow: y atColumn: (x - grid23 columnCount)) ] ]
]

{ #category : #'tests-accessing - setters/getters' }
CTGridTest >> testContents [

	| ord |
	ord := OrderedCollection new.
	ord := self grid22 contents.
	self assert: ord equals: #(1 3 2 4)
]

{ #category : #'torevisit- tests - accessing' }
CTGridTest >> testContentsEncodings [

	self assert: grid23 privateContents equals: #(11 21 12 22 13 23)
]

{ #category : #'tests - copying' }
CTGridTest >> testCopy [

	| copy |
	grid62 atRow: 1 atColumn: 6 put: 666.
	copy := grid62 copy.
	self assert:  grid62 equals: copy.
	self assert: (copy  atRow: 1 atColumn: 6) equals: 666
]

{ #category : #'tests - instance creation' }
CTGridTest >> testCreationGridCreationWithColumnsRows [

	self assert: (grid62 atRow: 2 atColumn: 6) equals: 62.
	self assert: (grid62 atRow: 1 atColumn: 6) equals: 61.
	
]

{ #category : #'tests - instance creation' }
CTGridTest >> testCreationGridCreationWithRowsColumns [

	self assert: (CTGrid grid6x2CreatedWithRowsColumns atRow: 2 atColumn: 6) equals: 62.
	self assert: (CTGrid grid6x2CreatedWithRowsColumns atRow: 1 atColumn: 6) equals: 61.
	
]

{ #category : #'tests - instance creation' }
CTGridTest >> testCreationWithRows [

	"
	> grid22WithPointLocationCreatedWithRows
	(
	(1@1) (2@1)
	(1@2) (2@2)
	)
	"
	self assert: (grid22WithPointLocationCreatedWithRows atRow: 1 atColumn: 1) equals: 1@1.
	self assert: (grid22WithPointLocationCreatedWithRows atRow: 2 atColumn: 2) equals: 2@2.
	self assert: (grid22WithPointLocationCreatedWithRows atRow: 2 atColumn: 1) equals: 1@2.
	self assert: (grid22WithPointLocationCreatedWithRows atRow: 1 atColumn: 2) equals: 2@1.
	
]

{ #category : #'tests - instance creation' }
CTGridTest >> testDifferentCreationGridAreEqual [
	self 
		assert: CTGrid grid6x2CreatedWithRowsColumns
		equals: CTGrid grid6x2CreatedWithRowsColumns
	
]

{ #category : #'tests - iterating' }
CTGridTest >> testDo [

	| ord |
	ord := OrderedCollection new. 
	self grid22 do: [ :each | ord add: each ].
	 "(
1 3
2 4
 )"
	self assert: ord first equals: 1.
	self assert: ord second equals: 3.
	self assert: ord third equals: 2.
	self assert: ord fourth equals: 4.
]

{ #category : #'tests - instance creation' }
CTGridTest >> testEquality [

	| aGrid |
	aGrid := self gridClass rows: 3 columns: 3.
	aGrid atAllPut: 0.
	self deny: (grid23 = aGrid).
	aGrid := grid23 postCopy.
	self assert: (grid23 = aGrid).
]

{ #category : #'tests - testing' }
CTGridTest >> testExtent [

	self assert: grid62 extent equals: (6@2).
	self assert: grid62 columnCount equals: 6.
	self assert: grid62 rowNumber equals: 2.
]

{ #category : #'tests-testing' }
CTGridTest >> testIdentityIncludes [

	| anInt |
	anInt := grid23 atRow: 2 atColumn: 2.	
	self assert: (grid23 identityIncludes: anInt) 
]

{ #category : #'tests-access' }
CTGridTest >> testIdentityIndexOf [

	| anInt1 anInt2 |
	anInt1 := grid23 atRow: 2 atColumn: 2.
	self assert: (grid23 identityIndexOf: anInt1) equals: 2 @ 2.
	self assert: (grid23 identityIndexOf: 123) equals: 0@0
]

{ #category : #'tests-access' }
CTGridTest >> testIdentityIndexOfIfAbsent [

	| anInt1 anInt2 |
	anInt1 := grid23 atRow: 2 atColumn: 2.
	self assert: (grid23 identityIndexOf: anInt1 ifAbsent: [ false] ) equals: 2 @ 2.
	self deny: (grid23 identityIndexOf: 123 ifAbsent: [  false] )
]

{ #category : #'torevisit- tests - accessing' }
CTGridTest >> testIncludes [
	self assert:
			((1 to: 4)
				allSatisfy: [:i | grid1 includes: i])

]

{ #category : #'tests-testing' }
CTGridTest >> testIncludesAll [
	self assert: (grid23 includesAll: #(11 21 12 22 13 23))
]

{ #category : #'tests-testing' }
CTGridTest >> testIncludesAny [
	self assert: (grid23 includesAll: #(11 23)).
	self deny: (grid23 includesAll: #(1 405))
]

{ #category : #'tests-private' }
CTGridTest >> testIndexForRowAndColumn [
	self assert: (grid23 indexForRow: 2 andColumn: 2) equals: (2 - 1) * 2 + 2
]

{ #category : #'tests-access' }
CTGridTest >> testIndexOf [
	self assert: (grid23 indexOf: 12) equals: 2@1.
	self assert: (grid23 indexOf: 0) equals: 0@0
]

{ #category : #'tests-access' }
CTGridTest >> testIndexOfIfAbsent [
	self assert: (grid23 indexOf: 12 ifAbsent: [ false ] ) equals: 2 @ 1.
	self deny: (grid23 indexOf: 0 ifAbsent: [ false ] )
]

{ #category : #'tests-old-enumerating' }
CTGridTest >> testIndicesCollect [

	| newGrid |
	newGrid := self grid22 indicesCollect: [ :x :y | x == y ].
	"(
1 3
2 4
 )"
	self assert: (newGrid atRow: 1 atColumn: 1).
	self deny: (newGrid atRow: 1 atColumn: 2).
	self deny: (newGrid atRow: 2 atColumn: 1).
	self assert: (newGrid atRow: 2 atColumn: 2)
]

{ #category : #'tests - iterating' }
CTGridTest >> testIndicesDo [
	| ord |
	ord := OrderedCollection new. 
	self grid22 indicesDo: [ :row :column | ord add: (row raisedTo: column) ].
	 "(
1 3
2 4
 )"
	self assert: ord first equals: 1.
	self assert: ord second equals: 1.
	self assert: ord third equals: 2.
	self assert: ord fourth equals: 4.
]

{ #category : #'tests-old-enumerating' }
CTGridTest >> testIndicesInjectInto [

	| newGrid aBool |
	newGrid := self gridClass new: 2.
	newGrid atAllPut: 0.
	aBool := newGrid indicesInject: 1 into: [ :each :x :y | (newGrid atRow: x atColumn: y) == each ].
	self deny: aBool 
]

{ #category : #'tests-accessing - setters/getters' }
CTGridTest >> testNumberOfColumns [

	| grid4 |	
	grid4 := self gridClass new: 2.
	grid4 columnCount: 4.
	self assert: grid4 columnCount equals: 4
]

{ #category : #'tests-accessing - setters/getters' }
CTGridTest >> testNumberOfRows [
	
	| grid4 |
	grid4 := self gridClass new: 2.
	grid4 rowNUmber: 4.
	self assert: grid4 rowNumber equals: 4
]

{ #category : #'tests-testing' }
CTGridTest >> testOccurrencesOf [
	
	| grid4 |
	grid4 := self gridClass new: 2.
	grid4 atRow: 1 atColumn: 1 put: 1.
	grid4 atRow: 1 atColumn: 2 put: 1.
	grid4 atRow: 2  atColumn: 1 put: 1.
	grid4 atRow: 2 atColumn: 2 put: 0.
	self assert: (grid4 occurrencesOf: 1) equals: 3 
]

{ #category : #'tests-copying' }
CTGridTest >> testPostCopy [

	| g23 |
	g23 := grid23 postCopy.	
	self assert: (g23 atRow: 1 atColumn: 1) equals: 11.
	self assert: (g23 atRow: 1 atColumn: 2) equals: 21.
	self assert: (g23 atRow: 2 atColumn: 1) equals: 12.
	self assert: (g23 atRow: 2 atColumn: 2) equals: 22.
	self assert: (g23 atRow: 3 atColumn: 1) equals: 13.
	self assert: (g23 atRow: 3 atColumn: 2) equals: 23.

]

{ #category : #'tests-printing' }
CTGridTest >> testPrintOn [

	self
		assert: self grid22 printString equals: '(
1 3
2 4
 )'
]

{ #category : #tests }
CTGridTest >> testReplaceAll [

	grid1 atRow: 1 atColumn: 1 put: 1.
	grid1 atRow: 2 atColumn: 2 put: 1.
	grid1 replaceAll: 1 with: 10.
	self assert: (grid1 atRow: 1 atColumn: 1) equals: 10.
	self assert: (grid1 atRow: 2 atColumn: 1) equals: 2.
	self assert: (grid1 atRow: 1 atColumn: 2) equals: 3.
	self assert: (grid1 atRow: 2 atColumn: 2) equals: 10.
]

{ #category : #'tests-private' }
CTGridTest >> testRowAndColumnForIndex [
	self 
		assert: (grid23 rowAndColumnForIndex: 4) 
		equals: 2@2 
]

{ #category : #'tests - accessing' }
CTGridTest >> testRowCount [

	self 
		assert: grid62 rowCount 
		equals: 2
]

{ #category : #'tests - iterating' }
CTGridTest >> testRows [

	self assert: grid3x2BooksCreatedWithRows rows first equals: #('A Time to Kill' 'John Grisham' 1989).
	self assert: grid3x2BooksCreatedWithRows rows second equals: #('Blood and Smoke' 'Stephen King' 2010).
	self assert: grid3x2BooksCreatedWithRows rows third equals: #('Spin' 'Robert Charles Wilson' 2006)
]

{ #category : #'tests-private' }
CTGridTest >> testRowsColumnsContents [

	grid23 rows: 3 columns: 3 contents: #(1 1 1 1 1 1 1 1 1).	
	self assert: grid23 columnCount equals: 3.
	self assert: grid23 rowNumber equals: 3.
	1 
		to: grid23 columnCount 
		do: [ :x | 1 
						to: grid23 rowNumber 
						do: [ :y | self assert: (grid23 atRow: y atColumn: x ) equals: 1 ] ]
]

{ #category : #'tests-enumerating' }
CTGridTest >> testRowsDo [
	| ord |
	ord := OrderedCollection new.
	self grid22 rowsDo: [ :y | ord add: y ].
	self assert: ord first equals: #(1 3).
	self assert: ord second equals: #(2 4)
]

{ #category : #'tests - iterating' }
CTGridTest >> testSelect [
	| ord | 
	ord := self grid22 select: [ :each | each even ].
	 "(
1 3
2 4
 )"
	self assert: ord size equals: 2.
	self assert: ord first equals: 2.
	self assert: ord second equals: 4.

]

{ #category : #'tests-copying' }
CTGridTest >> testShuffled [
		| gri |
	gri := self gridClass new.
	gri := self grid22 shuffled.

	self assert: (gri includes: 1).
	self assert: (gri  includes: 2).
	self assert: (gri includes: 3).
	self assert: (gri includes: 4)
]

{ #category : #'tests - accessing' }
CTGridTest >> testSize [

	self assert: grid62 size equals: grid62 rowCount * grid62 columnCount.
	self assert: grid62 size equals: 12
]

{ #category : #'torevisit- tests - accessing' }
CTGridTest >> testSquaredWithAllElement [

	self 
		assert: ((self gridClass new: 3 element: -1) occurrencesOf: -1) 
		equals: 9.

]

{ #category : #'tests - filling' }
CTGridTest >> testSwap [

	grid62 swapAtRow: 1 atColumn: 2 withAtRow: 2 atColumn: 6.
	self assert: (grid62 atRow: 1 atColumn: 2) equals: 62.
	self assert: (grid62 atRow: 2 atColumn: 6) equals: 21.
]

{ #category : #'tests-modifying' }
CTGridTest >> testSwapAtPointWithPoint [

	| p1 p2 |
	p1 := 1 @ 1.
	p2 := 2 @ 2.
	grid23 swapAtPoint: p1 withPoint: p2.
	self assert: (grid23 atRow: 1 atColumn: 1) equals: 22
]

{ #category : #'tests-modifying' }
CTGridTest >> testSwapAtRowAtColumnWithAtRowAtColumn [
	grid23
		swapAtRow: 1
		atColumn: 1
		withAtRow: 2
		atColumn: 2.
	self assert: (grid23 atRow: 1 atColumn: 1) equals: 22.
	self assert: (grid23 atRow: 2 atColumn: 2) equals: 11
]

{ #category : #tests }
CTGridTest >> testSwapColumnWithColumn [

	self assert: (grid23 atRow: 1 atColumn: 1) equals: 11.
	self assert: (grid23 atRow: 1 atColumn: 2) equals: 21.
	self assert: (grid23 atRow: 2 atColumn: 1) equals: 12.
	self assert: (grid23 atRow: 2 atColumn: 2) equals: 22.
	self assert: (grid23 atRow: 3 atColumn: 1) equals: 13.
	self assert: (grid23 atRow: 3 atColumn: 2) equals: 23.
 "(
11 21
12 22
13 23
 )"		
		
	grid23 swapColumn: 1 withColumn: 2.
	self assert: (grid23 atRow: 1 atColumn: 1) equals: 21.
	self assert: (grid23 atRow: 1 atColumn: 2) equals: 11.
	self assert: (grid23 atRow: 2 atColumn: 1) equals: 22.
	self assert: (grid23 atRow: 2 atColumn: 2) equals: 12.
	self assert: (grid23 atRow: 3 atColumn: 1) equals: 23.
	self assert: (grid23 atRow: 3 atColumn: 2) equals: 13
]

{ #category : #'tests - filling' }
CTGridTest >> testSwapPointAPI [

	grid62 swapAtPoint: (2@1) withPoint: (6@2).
	self assert: (grid62 atRow: 1 atColumn: 2) = 62.
	self assert: (grid62 atRow: 2 atColumn: 6) = 21.
]

{ #category : #tests }
CTGridTest >> testSwapRowWithRow [

	self assert: (grid23 atRow: 1 atColumn: 1) equals: 11.
	self assert: (grid23 atRow: 1 atColumn: 2) equals: 21.
	self assert: (grid23 atRow: 2 atColumn: 1) equals: 12.
	self assert: (grid23 atRow: 2 atColumn: 2) equals: 22.
	self assert: (grid23 atRow: 3 atColumn: 1) equals: 13.
	self assert: (grid23 atRow: 3 atColumn: 2) equals: 23.
 "(
11 21
12 22
13 23
 )"		

	grid23 swapRow: 1 withRow: 2.
	self assert: (grid23 atRow: 1 atColumn: 1) equals: 12.
	self assert: (grid23 atRow: 1 atColumn: 2) equals: 22.
	self assert: (grid23 atRow: 2 atColumn: 1) equals: 11.
	self assert: (grid23 atRow: 2 atColumn: 2) equals: 21
]

{ #category : #'tests - testing' }
CTGridTest >> testTabulate [

	| m |
	m := self gridClass rows: 3 columns: 2 tabulate: [ :row :column | column * 10 + row ].
	self assert: (m atRow: 1 atColumn: 1) equals: 11.
	self assert: (m atRow: 1 atColumn: 2) equals: 21.
	self assert: (m atRow: 2 atColumn: 1) equals: 12.
	self assert: (m atRow: 2 atColumn: 2) equals: 22.
	self assert: (m atRow: 3 atColumn: 1) equals: 13.
	self assert: (m atRow: 3 atColumn: 2) equals: 23.
]

{ #category : #'tests - testing' }
CTGridTest >> testTabulateEquals [

	| m |
	m := self gridClass rows: 3 columns: 2 tabulate: [ :row :column | column * 10 + row ].
	self assert: (m = grid23)

]

{ #category : #'torevisit- tests - accessing' }
CTGridTest >> testTransposed [
	| transposed |
	transposed := grid1 transposed.
	self assert: (transposed atRow: 1 atColumn: 1) equals: 1.
	self assert: (transposed atRow: 1 atColumn: 2) equals: 2.
	self assert: (transposed atRow: 2 atColumn: 1) equals: 3.
	self assert: (transposed atRow: 2 atColumn: 2) equals: 4
]

{ #category : #'torevisit-tests - instance creation' }
CTGridTest >> testWithColumns [

	| grid |
	grid := self gridClass withColumns:
 #( #('A Time to Kill' 'Blood and Smoke') ('John Grisham' 'Stephen King') ( '100' '1000') ).
	self assert: grid extent equals: 3 @ 2.
	

]

{ #category : #'tests - iterating' }
CTGridTest >> testWithIndicesDo [

	| ord |
	ord := OrderedCollection new. 
	self grid22 withIndicesDo: [ :each :row :column | ord add: each + (row raisedTo: column) ].
	 "(
1 3
2 4
 )"
	self assert: ord first equals: 2.
	self assert: ord second equals: 4.
	self assert: ord third equals: 4.
	self assert: ord fourth equals: 8.
]

{ #category : #'torevisit-tests - instance creation' }
CTGridTest >> testWithRows [

	| grid |
	grid := self gridClass withRows:
 #( #('A Time to Kill' 'John Grisham' '100') #('Blood and Smoke' 'Stephen King' '1000')).
	self assert: grid extent equals: 3 @ 2	

]
