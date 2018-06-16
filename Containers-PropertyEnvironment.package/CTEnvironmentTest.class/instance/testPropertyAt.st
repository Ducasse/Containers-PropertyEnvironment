tests-lookup-properties
testPropertyAt

	self childEnvironment  propertyAt: #foo put: 'bar'.
	self assert: (self childEnvironment propertyAt: #foo) equals: 'bar'.
	self childEnvironment propertyAt: #foo put: 'baz'.
	self assert: (self childEnvironment propertyAt: #foo) equals: 'baz'.
	
