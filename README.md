# Pharo DataFrame
[![Build Status](https://travis-ci.org/Ducasse/Containers-Grid.svg?branch=master)](https://travis-ci.org/Ducasse/Containers-Grid)
[![Build status](https://ci.appveyor.com/api/projects/status/1wdnjvmlxfbml8qo?svg=true)](https://ci.appveyor.com/project/olekscode/dataframe)
[![Coverage Status](https://coveralls.io/repos/github/PolyMathOrg/DataFrame/badge.svg?branch=master)](https://coveralls.io/github/PolyMathOrg/DataFrame?branch=master)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/PolyMathOrg/DataFrame/master/LICENSE)
[![Pharo version](https://img.shields.io/badge/Pharo-6.1-%23aac9ff.svg)](https://pharo.org/download)
[![Pharo version](https://img.shields.io/badge/Pharo-7.0-%23aac9ff.svg)](https://pharo.org/download)
[![Pharo version](https://img.shields.io/badge/Pharo-8.0-%23aac9ff.svg)](https://pharo.org/download)


## Installation
The following script installs DataFrame into the Pharo image

```smalltalk
Metacello new
  baseline: 'ContainersGrid';
  repository: 'github://Ducasse/Containers-Grid/src';
  load.
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
