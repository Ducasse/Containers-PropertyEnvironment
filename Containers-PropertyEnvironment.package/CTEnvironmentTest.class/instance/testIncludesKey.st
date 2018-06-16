tests-testing-dictionary
testIncludesKey
	self connectChildParent.
	self assert: (self childEnvironment includesKey: #P0inParent).
	self assert: (self childEnvironment includesKey: #P1inChildren)