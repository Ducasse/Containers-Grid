access
atRandom: aGenerator
	"Return the contents of the receiver in a random order using the argument. aGenerator should be kept by the user in a variable and used every time. Use this instead of #atRandom for better uniformity of random numbers because only you use the generator."
	
	^ contents atRandom: aGenerator