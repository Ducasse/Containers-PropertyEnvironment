tests-lookup-dictionary
testAtPutDoesNotCannonizeKeyToBeASymbol

	self childEnvironment at: #foo put: 'bar'.
	self assert: (self childEnvironment at: #foo) equals: 'bar'.
	self childEnvironment at: #foo put: 'baz'.
	self assert: (self childEnvironment at: #foo) equals: 'baz'.
	
	self childEnvironment at: 'foo2String' put: 'bar'.
	self assert: (self childEnvironment at: 'foo2String') equals: 'bar'.
	
	self childEnvironment at: 'foo3String' put: 'bar'.
	self assert: (self childEnvironment at: #'foo3String') equals: 'bar'.