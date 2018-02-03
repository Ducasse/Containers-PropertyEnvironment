tests-local
testHasProperty
	self connectChildParent.
	self assert: (self childEnvironment hasPropertyAt: #P0inParent).
	self assert: (self childEnvironment hasPropertyAt: #P1inChildren)