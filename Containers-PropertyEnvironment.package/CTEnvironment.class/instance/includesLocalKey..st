testing-dictionary
includesLocalKey: aKey
	"Test if the property ==aKey== is defined within the receiver, not checking potential parent."

	^ self properties includesKey: aKey asSymbol