# Containers-PropertyEnvironment
A dictionary of properties with a lookup in ancestors (also called environment in other languages).

![https://github.com/Ducasse/Containers-PropertyEnvironment/workflows/currentStablePharo/badge.svg](https://github.com/Ducasse/Containers-PropertyEnvironment/workflows/currentStablePharo/badge.svg)
![https://github.com/Ducasse/Containers-PropertyEnvironment/workflows/matrix/badge.svg](https://github.com/Ducasse/Containers-PropertyEnvironment/workflows/matrix/badge.svg)
[![Coverage Status](https://coveralls.io/repos/github//Ducasse/Containers-PropertyEnvironment/badge.svg?branch=master)](https://coveralls.io/github//Ducasse/Containers-PropertyEnvironment?branch=master)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/PolyMathOrg/DataFrame/master/LICENSE)
<!-- [![Build status](https://ci.appveyor.com/api/projects/status/1wdnjvmlxfbml8qo?svg=true)](https://ci.appveyor.com/project/Ducasse/Containers-PropertyEnvironment)  -->

## Example

```
CTEnvironmentTest >> testChildrenPropertyAtOverridesParent [
	self connectChildParent.
	self
		assert: (self childEnvironment propertyAt: #P0inParent)
		equals: 50.
	self
		assert: (self childEnvironment propertyAt: #P1inChildren)
		equals: 12.
	self
		assert: (self childEnvironment parent propertyAt: #P1inChildren)
		equals: 24
]
```


This package is part of the Containers project: This project is to collect, clean, 
test and document alternate collection datastructures. Each package is modular so that users 
can only load the collection they need without 100 of related collections.



## Loading

```
Metacello new
   baseline: 'ContainersPropertyEnvironment';
   repository: 'github://Ducasse/Containers-PropertyEnvironment';
   load.
```

## If you want to depend on it

```
spec 
   baseline: 'ContainersPropertyEnvironment' 
   with: [ spec repository: 'github://Ducasse/Containers-PropertyEnvironment' ].
```






----
The best way to predict the future is to do it!
Less talking more doing. stepharo.self@gmail.com
