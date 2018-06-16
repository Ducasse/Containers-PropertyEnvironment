tests-lookup-properties
testPropertyAtAlsoLooksUpInParent
	self connectChildParent.
	self
		assert: (self childEnvironment propertyAt: #P0inParent)
		equals: 50