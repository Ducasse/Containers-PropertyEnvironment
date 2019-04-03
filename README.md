# Containers-PropertyEnvironment
A dictionary of properties with a lookup in ancestors (also called environment in other languages).


[![Build Status](https://travis-ci.com/Ducasse/Containers-PropertyEnvironment.svg?branch=master)](https://travis-ci.com/Ducasse/Containers-PropertyEnvironment)
[![Coverage Status](https://coveralls.io/repos/github//Ducasse/Containers-PropertyEnvironment/badge.svg?branch=master)](https://coveralls.io/github//Ducasse/Containers-Grid?branch=master)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/PolyMathOrg/DataFrame/master/LICENSE)
[![Pharo version](https://img.shields.io/badge/Pharo-6.1-%23aac9ff.svg)](https://pharo.org/download)
[![Pharo version](https://img.shields.io/badge/Pharo-7.0-%23aac9ff.svg)](https://pharo.org/download)
[![Pharo version](https://img.shields.io/badge/Pharo-8.0-%23aac9ff.svg)](https://pharo.org/download)
<!-- [![Build status](https://ci.appveyor.com/api/projects/status/1wdnjvmlxfbml8qo?svg=true)](https://ci.appveyor.com/project/Ducasse/Containers-PropertyEnvironment)  -->


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
