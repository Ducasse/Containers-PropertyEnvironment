tests-lookup-dictionary
testAtIfAbsentPutDoesNotUsePutWhenPropertyIsDefinedInParent
	self connectChildParent.
	self
		assert: (self childEnvironment at: #P0inParent ifAbsentPut: [ false ])
		equals: 50.
	self
		assert: (self childEnvironment at: #Zork ifAbsentPut: [ true ]).
	self assert: (self childEnvironment at: #Zork) equals: true.
	self assert: (self childEnvironment includesLocalKey: #Zork).
	self deny: (self potentialParentEnvironment includesLocalKey: #Zork)