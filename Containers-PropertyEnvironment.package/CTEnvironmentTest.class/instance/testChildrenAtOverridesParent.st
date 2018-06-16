tests-lookup-dictionary
testChildrenAtOverridesParent
	self connectChildParent.
	self
		assert: (self childEnvironment at: #P0inParent)
		equals: 50.
	self
		assert: (self childEnvironment at: #P1inChildren)
		equals: 12.
	self
		assert: (self childEnvironment parent at: #P1inChildren)
		equals: 24