# Pharo Containers-Grid
[![Build Status](https://travis-ci.com/Ducasse/Containers-Grid.svg?branch=master)](https://travis-ci.com/Ducasse/Containers-Grid)
[![Coverage Status](https://coveralls.io/repos/github//Ducasse/Containers-Grid/badge.svg?branch=master)](https://coveralls.io/github//Ducasse/Containers-Grid?branch=master)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)]()
[![Pharo version](https://img.shields.io/badge/Pharo-6.1-%23aac9ff.svg)](https://pharo.org/download)
[![Pharo version](https://img.shields.io/badge/Pharo-7.0-%23aac9ff.svg)](https://pharo.org/download)
[![Pharo version](https://img.shields.io/badge/Pharo-8.0-%23aac9ff.svg)](https://pharo.org/download)
<!-- [![Build status](https://ci.appveyor.com/api/projects/status/1wdnjvmlxfbml8qo?svg=true)](https://ci.appveyor.com/project/olekscode/dataframe)  -->

## Installation
The following script installs DataFrame into the Pharo image

```smalltalk
Metacello new
  baseline: 'ContainersGrid';
  repository: 'github://Ducasse/Containers-Grid/src';
  load.
```

## If you want to depend on it
```smalltalk
spec 
   baseline: 'ContainersGrid'
   with: [ spec repository: 'github://Ducasse/Containers-Grid/src' ].
 ```
   

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
