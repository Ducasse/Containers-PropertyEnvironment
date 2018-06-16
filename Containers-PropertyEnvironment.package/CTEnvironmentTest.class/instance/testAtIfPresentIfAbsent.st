tests-lookup-dictionary
testAtIfPresentIfAbsent

	self assert: (self childEnvironment at: #foo put: 'bar') equals: 'bar'.
	self
		assert:
			(self childEnvironment
				at: #foo
				ifPresent: [ :smth | true ]
				ifAbsent: [ false ]).
	self
		deny:
			(self childEnvironment
				at: #foo2
				ifPresent: [ :smth | true ]
				ifAbsent: [ false ])