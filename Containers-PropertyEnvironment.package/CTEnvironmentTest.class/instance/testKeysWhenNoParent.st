tests-iteration
testKeysWhenNoParent

	self assert: (self childEnvironment keys includes: #P1inChildren).
	self assert: (self childEnvironment keys includes: #P2inChildren).
	self assert: self childEnvironment keys size equals: 2