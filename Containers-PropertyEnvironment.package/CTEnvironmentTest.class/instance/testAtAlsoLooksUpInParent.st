tests-lookup-dictionary
testAtAlsoLooksUpInParent
	self connectChildParent.
	self
		assert: (self childEnvironment at: #P0inParent)
		equals: 50