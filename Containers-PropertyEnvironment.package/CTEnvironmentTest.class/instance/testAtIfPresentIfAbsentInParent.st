tests-lookup-dictionary
testAtIfPresentIfAbsentInParent
	self connectChildParent.
	self deny: (self childEnvironment includesLocalKey: #P0inParent).
	self assert: (self childEnvironment parent includesLocalKey: #P0inParent).
	self
		assert:
			(self childEnvironment
				at: #P0inParent
				ifPresent: [ :smth | true ]
				ifAbsent: [ false ])