tests-lookup-properties
testPropertyAtIfAbsentPutDoesNotUsePutWhenPropertyIsDefinedInParent
	self connectChildParent.
	self
		assert: (self childEnvironment propertyAt: #P0inParent ifAbsentPut: [ false ])
		equals: 50.
	self
		assert: (self childEnvironment propertyAt: #Zork ifAbsentPut: [ true ]).
	self assert: (self childEnvironment propertyAt: #Zork) equals: true.
	self assert: (self childEnvironment hasLocalProperty: #Zork).
	self deny: (self potentialParentEnvironment hasLocalProperty: #Zork)