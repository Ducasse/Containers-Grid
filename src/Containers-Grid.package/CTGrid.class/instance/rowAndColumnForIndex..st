private
rowAndColumnForIndex: index
	|t|
	t := index - 1.
	^(t // columnCount + 1)@(t \\ columnCount + 1)