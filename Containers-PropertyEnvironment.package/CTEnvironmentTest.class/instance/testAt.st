tests-lookup-dictionary
testAt

	self childEnvironment at: #foo put: 'bar'.
	self assert: (self childEnvironment at: #foo) equals: 'bar'.
	self childEnvironment at: #foo put: 'baz'.
	self assert: (self childEnvironment at: #foo) equals: 'baz'.
	
