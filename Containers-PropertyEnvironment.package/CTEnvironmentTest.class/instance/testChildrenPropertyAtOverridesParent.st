tests-lookup-properties
testChildrenPropertyAtOverridesParent
	self connectChildParent.
	self
		assert: (self childEnvironment propertyAt: #P0inParent)
		equals: 50.
	self
		assert: (self childEnvironment propertyAt: #P1inChildren)
		equals: 12.
	self
		assert: (self childEnvironment parent propertyAt: #P1inChildren)
		equals: 24