testing
hasProperty: aKey
	"Answer true iff I (or one of my ancestors) contain a property named ==aKey==."

	^ self properties
		at: aKey asSymbol
		ifPresent: [ :value | true ]
		ifAbsent: [ self hasParent
				ifTrue: [ self parent hasProperty: aKey ]
				ifFalse: [ false ] ]