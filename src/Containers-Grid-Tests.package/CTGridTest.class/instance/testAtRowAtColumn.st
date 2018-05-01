tests-accessing element
testAtRowAtColumn
	| anInt |
	
	anInt := grid23 atRow: 2 atColumn: 2.
	self assert: anInt equals: 22 