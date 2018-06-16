tests-lookup-dictionary
testAtIfAbsentDoesNotUseIfAbsentWhenPropertyIsDefinedInParent
	self connectChildParent.
	"since the property P0inParent is defined in parent do not execute the ifAbsent: clause."
	self
		assert: (self childEnvironment at: #P0inParent ifAbsent: [ false ])
		equals: 50.
	self assert: (self childEnvironment at: #Zork ifAbsent: [ true ])