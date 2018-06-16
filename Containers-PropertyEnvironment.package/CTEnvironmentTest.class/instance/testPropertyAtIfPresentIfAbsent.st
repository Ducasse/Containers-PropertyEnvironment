tests-lookup-properties
testPropertyAtIfPresentIfAbsent

	self assert: (self childEnvironment propertyAt: #foo put: 'bar') equals: 'bar'.
	self
		assert:
			(self childEnvironment
				propertyAt: #foo
				ifPresent: [ :smth | true ]
				ifAbsent: [ false ]).
	self
		deny:
			(self childEnvironment
				propertyAt: #foo2
				ifPresent: [ :smth | true ]
				ifAbsent: [ false ])