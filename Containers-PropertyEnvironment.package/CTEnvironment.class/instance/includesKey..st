testing-dictionary
includesKey: aKey
	"Answer true iff I (or one of my ancestors) contain a property named ==aKey==."

	^ properties
		at: aKey asSymbol
		ifPresent: [ :value | true ]
		ifAbsent: [ self hasParent
				ifTrue: [ parent includesKey: aKey ]
				ifFalse: [ false ] ]