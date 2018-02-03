tests-local
testHasParent
	self connectChildParent.
	self deny: self potentialParentEnvironment hasParent.
	self assert: self childEnvironment hasParent