tests-properties
testPropertyAtIfAbsentDoesNotUseIfAbsentWhenPropertyIsDefinedInParent
	self connectChildParent.
	"since the property P0inParent is defined in parent do not execute the ifAbsent: clause."
	self
		assert: (self childEnvironment propertyAt: #P0inParent ifAbsent: [ false ])
		equals: 50.
	self assert: (self childEnvironment propertyAt: #Zork ifAbsent: [ true ])