testing
includesKey: aKey
	"Answer true iff I (or one of my ancestors) contain a property named ==aKey==."
	^ self hasProperty: aKey