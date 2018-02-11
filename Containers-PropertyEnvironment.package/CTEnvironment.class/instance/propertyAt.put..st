accessing - properties
propertyAt: aKey put: aValue
	"Adds or replaces the property ==aKey== with ==aValue== in the receiver."

	^ self properties at: aKey asSymbol put: aValue