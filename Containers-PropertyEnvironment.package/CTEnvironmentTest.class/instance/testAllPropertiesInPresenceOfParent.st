tests-properties
testAllPropertiesInPresenceOfParent
	| allP |
	self connectChildParent.
	allP := self childEnvironment allProperties keys.
	allP
		do: [ :each | 
			self
				assert:
					(#(#P0inParent #P1inChildren #P2inChildren #configurations)
						includes: each) ].
	allP := self potentialParentEnvironment allProperties keys.
	allP
		do: [ :each | 
			self
				assert: (#(#P0inParent #P1inChildren #configurations) includes: each) ]