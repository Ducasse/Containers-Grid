modifying
shuffledBy: aGenerator
	"aGenerator should be kept by the user in a variable and used every time. Use this instead of #atRandom for better uniformity of random numbers because only you use the generator."
	^ self class rows: rowCount columns: columnCount contents: (contents copy shuffleBy: aGenerator)