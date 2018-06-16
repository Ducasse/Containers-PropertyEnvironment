tests-lookup-dictionary
testAtIfAbsentPut
	
	self assert: (self childEnvironment at: #foo put: 'bar') equals: 'bar'.
	self assert: (self childEnvironment at: #foo) equals: 'bar'.
	
	self assert: (self childEnvironment at: #foo ifAbsentPut: [ 'baz' ]) equals: 'bar'.

	"ifAbsentPut: set the property with the put value"
	self assert: (self childEnvironment at: #bar ifAbsentPut: [ 'baz' ]) = 'baz'.
	self assert: (self childEnvironment at: #bar) = 'baz'