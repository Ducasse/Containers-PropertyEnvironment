tests-lookup-dictionary
testIncludeKeyOnlyTestLocalProperties

	self deny: (self childEnvironment includesLocalKey: #foo).
	self childEnvironment at: #foo put: 'bar'.
	self assert: (self childEnvironment includesLocalKey: #foo).
	self deny: (self childEnvironment includesLocalKey: #bar).
	self deny: (self childEnvironment includesLocalKey: #P0inParent).
	self assert: (self potentialParentEnvironment includesLocalKey: #P0inParent).