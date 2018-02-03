tests-properties
testPropertyAtIfAbsentPut
	
	self assert: (self childEnvironment propertyAt: #foo put: 'bar') equals: 'bar'.
	self assert: (self childEnvironment propertyAt: #foo) equals: 'bar'.
	
	self assert: (self childEnvironment propertyAt: #foo ifAbsentPut: [ 'baz' ]) equals: 'bar'.

	"ifAbsentPut: set the property with the put value"
	self assert: (self childEnvironment propertyAt: #bar ifAbsentPut: [ 'baz' ]) = 'baz'.
	self assert: (self childEnvironment propertyAt: #bar) = 'baz'