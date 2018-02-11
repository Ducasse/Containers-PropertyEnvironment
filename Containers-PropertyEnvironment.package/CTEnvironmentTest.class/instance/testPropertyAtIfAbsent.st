tests-properties
testPropertyAtIfAbsent

	self assert: (self childEnvironment propertyAt: #foo put: 'bar') equals: 'bar'.
	self assert: (self childEnvironment propertyAt: #foo ifAbsent: [ 'baz' ]) equals: 'bar'.
	self assert: (self childEnvironment propertyAt: #bar ifAbsent: [ 'baz' ]) equals: 'baz'