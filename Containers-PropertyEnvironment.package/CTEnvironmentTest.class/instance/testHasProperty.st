tests-testing
testHasProperty
	self connectChildParent.
	self assert: (self childEnvironment hasProperty: #P0inParent).
	self assert: (self childEnvironment hasProperty: #P1inChildren)