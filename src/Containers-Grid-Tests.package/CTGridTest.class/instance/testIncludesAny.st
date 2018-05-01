tests-testing
testIncludesAny
	self assert: (grid23 includesAll: #(11 23)) equals: true.
	self assert: (grid23 includesAll: #(1 405)) equals: false