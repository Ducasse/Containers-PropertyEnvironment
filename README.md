# Containers-PropertyEnvironment
A dictionary of properties with a lookup in ancestors (also called environment in other languages).

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

----
The best way to predict the future is to do it!
Less talking more doing. stepharo.self@gmail.com
