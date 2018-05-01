tests-accessing - setters/getters
testContents
	| ord |
	ord := OrderedCollection new.
	ord := self grid22 contents.
	self assert: ord equals: #(1 3 2 4)