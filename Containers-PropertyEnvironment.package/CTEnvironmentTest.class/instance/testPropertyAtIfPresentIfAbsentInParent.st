tests-lookup-properties
testPropertyAtIfPresentIfAbsentInParent
	self connectChildParent.
	self deny: (self childEnvironment hasLocalProperty: #P0inParent).
	self assert: (self childEnvironment parent hasLocalProperty: #P0inParent).
	self
		assert:
			(self childEnvironment
				propertyAt: #P0inParent
				ifPresent: [ :smth | true ]
				ifAbsent: [ false ])