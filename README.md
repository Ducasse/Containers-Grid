# Containers-Grid
A grid data structure

```
CTGridTest >> testRows [

	self assert: grid3x2BooksCreatedWithRows rows first equals: #('A Time to Kill' 'John Grisham' 1989).
	self assert: grid3x2BooksCreatedWithRows rows second equals: #('Blood and Smoke' 'Stephen King' 2010).
	self assert: grid3x2BooksCreatedWithRows rows third equals: #('Spin' 'Robert Charles Wilson' 2006)
]
```
This package is part of the Containers project: This project is to collect, clean, 
test and document alternate collection datastructures. Each package is modular so that users 
can only load the collection they need without 100 of related collections.

----
The best way to predict the future is to do it!
Less talking more doing. stepharo.self@gmail.com
