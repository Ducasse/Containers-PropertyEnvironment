testing
hasLocalProperty: aKey
	"Test if the property ==aKey== is defined within the receiver, not checking potential parent."

	^ properties includesKey: aKey asSymbol