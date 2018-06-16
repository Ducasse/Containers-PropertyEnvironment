tests-properties
testHasPropertyOnlyTestLocalProperties

	self deny: (self childEnvironment hasLocalProperty: #foo).
	self childEnvironment propertyAt: #foo put: 'bar'.
	self assert: (self childEnvironment hasLocalProperty: #foo).
	self deny: (self childEnvironment hasLocalProperty: #bar).
	self deny: (self childEnvironment hasLocalProperty: #P0inParent).
	self assert: (self potentialParentEnvironment hasLocalProperty: #P0inParent).