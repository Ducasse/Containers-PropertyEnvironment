tests-properties
testAllPropertiesWithoutInheritance

	| allP |
	allP := self childEnvironment allProperties keys.
	allP do: [ :each | self assert: (#(#P2inChildren #P1inChildren #configurations) includes: each) ].
	allP := self potentialParentEnvironment allProperties keys.
	allP do: [ :each | self assert: (#(#P0inParent #P1inChildren #configurations) includes: each) ]