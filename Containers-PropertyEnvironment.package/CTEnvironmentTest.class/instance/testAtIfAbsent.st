tests-lookup-dictionary
testAtIfAbsent

	self assert: (self childEnvironment at: #foo put: 'bar') equals: 'bar'.
	self assert: (self childEnvironment at: #foo ifAbsent: [ 'baz' ]) equals: 'bar'.
	self assert: (self childEnvironment at: #bar ifAbsent: [ 'baz' ]) equals: 'baz'