tests-lookup-properties
testPropertyAtPutDoesNotCannonizeKeyToBeASymbol

	self childEnvironment propertyAt: #foo put: 'bar'.
	self assert: (self childEnvironment propertyAt: #foo) equals: 'bar'.
	self childEnvironment propertyAt: #foo put: 'baz'.
	self assert: (self childEnvironment propertyAt: #foo) equals: 'baz'.
	
	self childEnvironment propertyAt: 'foo2String' put: 'bar'.
	self assert: (self childEnvironment propertyAt: 'foo2String') equals: 'bar'.
	
	self childEnvironment propertyAt: 'foo3String' put: 'bar'.
	self assert: (self childEnvironment propertyAt: #'foo3String') equals: 'bar'.